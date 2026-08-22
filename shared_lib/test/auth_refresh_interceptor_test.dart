import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

const _bearerSecureExtra = {
  'secure': [
    {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
  ],
};

void main() {
  setUp(AuthRefreshInterceptor.debugResetSharedRefresh);

  test('adds Authorization bearer header on protected routes', () async {
    final tokenStore = InMemoryTokenStore();
    await tokenStore.saveTokens(
      TokenPair(
        (b) => b
          ..accessToken = 'access-token'
          ..refreshToken = 'refresh-token'
          ..expiresIn = 3600,
      ),
    );

    final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/v1'));
    final adapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = adapter;

    dio.interceptors.add(
      AuthRefreshInterceptor(
        dio: dio,
        tokenStore: tokenStore,
        refreshTokens: (_) async => null,
      ),
    );

    String? authorizationHeader;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          authorizationHeader = options.headers['Authorization'] as String?;
          handler.next(options);
        },
      ),
    );

    adapter.onGet(
      '/auth/me',
      (server) => server.reply(200, <String, dynamic>{}),
    );

    await dio.get<void>(
      '/auth/me',
      options: Options(extra: _bearerSecureExtra),
    );

    expect(authorizationHeader, 'Bearer access-token');
  });

  test('invokes refresh callback once on HTTP 401', () async {
    final tokenStore = InMemoryTokenStore();
    await tokenStore.saveTokens(
      TokenPair(
        (b) => b
          ..accessToken = 'expired-access'
          ..refreshToken = 'valid-refresh'
          ..expiresIn = 3600,
      ),
    );

    var refreshCallCount = 0;

    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8080/v1',
        validateStatus: (status) => status != null && status < 300,
      ),
    );
    final adapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = adapter;

    dio.interceptors.add(
      AuthRefreshInterceptor(
        dio: dio,
        tokenStore: tokenStore,
        refreshTokens: (refreshToken) async {
          refreshCallCount += 1;
          expect(refreshToken, 'valid-refresh');
          return null;
        },
      ),
    );

    adapter.onGet(
      '/auth/me',
      (server) => server.reply(401, {'title': 'Unauthorized'}),
    );

    await expectLater(
      dio.get<void>('/auth/me', options: Options(extra: _bearerSecureExtra)),
      throwsA(isA<DioException>()),
    );

    expect(refreshCallCount, 1);
  });

  test(
    'does not invoke refresh callback on non-401 error (e.g. HTTP 404)',
    () async {
      final tokenStore = InMemoryTokenStore();
      var refreshCallCount = 0;

      final dio = Dio(
        BaseOptions(
          baseUrl: 'http://localhost:8080/v1',
          validateStatus: (status) => status != null && status < 300,
        ),
      );
      final adapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = adapter;

      dio.interceptors.add(
        AuthRefreshInterceptor(
          dio: dio,
          tokenStore: tokenStore,
          refreshTokens: (_) async {
            refreshCallCount += 1;
            return null;
          },
        ),
      );

      adapter.onGet(
        '/auth/me',
        (server) => server.reply(404, {'title': 'Not Found'}),
      );

      await expectLater(
        dio.get<void>('/auth/me', options: Options(extra: _bearerSecureExtra)),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'statusCode',
            404,
          ),
        ),
      );

      expect(refreshCallCount, 0);
    },
  );

  test('does not throw unhandled exception if retry fails', () async {
    final tokenStore = InMemoryTokenStore();
    await tokenStore.saveTokens(
      TokenPair(
        (b) => b
          ..accessToken = 'expired-access'
          ..refreshToken = 'valid-refresh'
          ..expiresIn = 3600,
      ),
    );

    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8080/v1',
        validateStatus: (status) => status != null && status < 300,
      ),
    );
    final adapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = adapter;

    dio.interceptors.add(
      AuthRefreshInterceptor(
        dio: dio,
        tokenStore: tokenStore,
        refreshTokens: (refreshToken) async {
          return TokenPair(
            (b) => b
              ..accessToken = 'new-access-token'
              ..refreshToken = 'new-refresh-token'
              ..expiresIn = 3600,
          );
        },
      ),
    );

    // Initial call fails with 401
    adapter.onGet(
      '/auth/me',
      (server) => server.reply(401, {'title': 'Unauthorized'}),
      data: null,
    );

    // Retried call fails with 404
    adapter.onGet(
      '/auth/me',
      (server) => server.reply(404, {'title': 'Not Found'}),
      headers: {'Authorization': 'Bearer new-access-token'},
    );

    await expectLater(
      dio.get<void>('/auth/me', options: Options(extra: _bearerSecureExtra)),
      throwsA(
        isA<DioException>().having(
          (e) => e.response?.statusCode,
          'statusCode',
          404,
        ),
      ),
    );
  });

  test('shares a single refresh across concurrent 401s', () async {
    final tokenStore = InMemoryTokenStore();
    await tokenStore.saveTokens(
      TokenPair(
        (b) => b
          ..accessToken = 'expired-access'
          ..refreshToken = 'valid-refresh'
          ..expiresIn = 3600,
      ),
    );

    var refreshCallCount = 0;
    final refreshStarted = Completer<void>();
    final allowRefresh = Completer<void>();

    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8080/v1',
        validateStatus: (status) => status != null && status < 300,
      ),
    );
    final adapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = adapter;

    var sessionExpired = 0;
    dio.interceptors.add(
      AuthRefreshInterceptor(
        dio: dio,
        tokenStore: tokenStore,
        onSessionExpired: () async {
          sessionExpired += 1;
        },
        refreshTokens: (refreshToken) async {
          refreshCallCount += 1;
          expect(refreshToken, 'valid-refresh');
          if (!refreshStarted.isCompleted) {
            refreshStarted.complete();
          }
          await allowRefresh.future;
          return TokenPair(
            (b) => b
              ..accessToken = 'new-access-token'
              ..refreshToken = 'new-refresh-token'
              ..expiresIn = 3600,
          );
        },
      ),
    );

    adapter.onGet(
      '/auth/me',
      (server) => server.reply(401, {'title': 'Unauthorized'}),
    );
    adapter.onGet(
      '/doctors/me',
      (server) => server.reply(401, {'title': 'Unauthorized'}),
    );

    final first = dio.get<void>(
      '/auth/me',
      options: Options(extra: _bearerSecureExtra),
    );
    final second = dio.get<void>(
      '/doctors/me',
      options: Options(extra: _bearerSecureExtra),
    );

    await refreshStarted.future;
    allowRefresh.complete();

    await Future.wait<void>([
      first.then<void>((_) {}, onError: (_) {}),
      second.then<void>((_) {}, onError: (_) {}),
    ]);
    expect(refreshCallCount, 1);
    expect(sessionExpired, 0);
    expect(tokenStore.refreshToken, 'new-refresh-token');
  });

  test('does not sign out when refresh returns HTTP 500', () async {
    final tokenStore = InMemoryTokenStore();
    await tokenStore.saveTokens(
      TokenPair(
        (b) => b
          ..accessToken = 'expired-access'
          ..refreshToken = 'valid-refresh'
          ..expiresIn = 3600,
      ),
    );

    var sessionExpired = 0;
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8080/v1',
        validateStatus: (status) => status != null && status < 300,
      ),
    );
    final adapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = adapter;

    dio.interceptors.add(
      AuthRefreshInterceptor(
        dio: dio,
        tokenStore: tokenStore,
        onSessionExpired: () async {
          sessionExpired += 1;
        },
        refreshTokens: (_) async {
          throw DioException(
            requestOptions: RequestOptions(path: '/auth/refresh'),
            response: Response<dynamic>(
              requestOptions: RequestOptions(path: '/auth/refresh'),
              statusCode: 500,
              data: {'title': 'Erreur interne'},
            ),
            type: DioExceptionType.badResponse,
          );
        },
      ),
    );

    adapter.onGet(
      '/auth/me',
      (server) => server.reply(401, {'title': 'Unauthorized'}),
    );

    await expectLater(
      dio.get<void>('/auth/me', options: Options(extra: _bearerSecureExtra)),
      throwsA(isA<DioException>()),
    );

    expect(sessionExpired, 0);
    expect(tokenStore.refreshToken, 'valid-refresh');
  });

  test(
    'does not sign out when refresh 401 races a rotated store token',
    () async {
      final tokenStore = InMemoryTokenStore();
      await tokenStore.saveTokens(
        TokenPair(
          (b) => b
            ..accessToken = 'expired-access'
            ..refreshToken = 'old-refresh'
            ..expiresIn = 3600,
        ),
      );

      var sessionExpired = 0;
      final dio = Dio(
        BaseOptions(
          baseUrl: 'http://localhost:8080/v1',
          validateStatus: (status) => status != null && status < 300,
        ),
      );
      final adapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = adapter;

      dio.interceptors.add(
        AuthRefreshInterceptor(
          dio: dio,
          tokenStore: tokenStore,
          onSessionExpired: () async {
            sessionExpired += 1;
          },
          refreshTokens: (_) async {
            await tokenStore.saveTokens(
              TokenPair(
                (b) => b
                  ..accessToken = 'new-access'
                  ..refreshToken = 'new-refresh'
                  ..expiresIn = 3600,
              ),
            );
            throw DioException(
              requestOptions: RequestOptions(path: '/auth/refresh'),
              response: Response<dynamic>(
                requestOptions: RequestOptions(path: '/auth/refresh'),
                statusCode: 401,
                data: {'error': 'invalid credentials'},
              ),
              type: DioExceptionType.badResponse,
            );
          },
        ),
      );

      adapter.onGet(
        '/auth/me',
        (server) => server.reply(401, {'title': 'Unauthorized'}),
      );
      adapter.onGet(
        '/auth/me',
        (server) => server.reply(200, <String, dynamic>{}),
        headers: {'Authorization': 'Bearer new-access'},
      );

      await dio.get<void>(
        '/auth/me',
        options: Options(extra: _bearerSecureExtra),
      );

      expect(sessionExpired, 0);
      expect(tokenStore.refreshToken, 'new-refresh');
    },
  );
}
