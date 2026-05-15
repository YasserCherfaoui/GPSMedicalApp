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
}
