import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _jwt({String sub = 'user-1', String role = 'patient'}) {
  String b64url(String json) =>
      base64Url.encode(utf8.encode(json)).replaceAll('=', '');
  return '${b64url('{"alg":"none"}')}.'
      '${b64url('{"sub":"$sub","role":"$role"}')}.sig';
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AuthUserSnapshot', () {
    test('decodes sub and role from a JWT', () {
      final snapshot = AuthUserSnapshot.fromAccessToken(
        _jwt(),
        phone: '+213555000000',
      );
      expect(snapshot?.userId, 'user-1');
      expect(snapshot?.role, 'patient');
      expect(snapshot?.phone, '+213555000000');
    });

    test('returns null for non-JWT tokens', () {
      expect(AuthUserSnapshot.fromAccessToken('access'), isNull);
    });
  });

  group('AuthSessionNotifier', () {
    test('restores session from refresh token and snapshot', () async {
      final store = InMemoryTokenStore();
      await store.saveTokens(
        TokenPair(
          (b) => b
            ..accessToken = ''
            ..refreshToken = 'refresh'
            ..expiresIn = 3600,
        ),
      );
      await store.saveUserSnapshot(
        const AuthUserSnapshot(userId: 'user-1', role: 'patient'),
      );

      final notifier = AuthSessionNotifier(store);
      expect(notifier.isAuthenticated, isTrue);
      expect(notifier.currentUser?.userId, 'user-1');
    });

    test('signIn persists tokens and user snapshot', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final store = SharedPreferencesTokenStore(prefs);
      final notifier = AuthSessionNotifier(store);

      await notifier.signIn(
        TokenPair(
          (b) => b
            ..accessToken = _jwt(sub: 'pat-9', role: 'patient')
            ..refreshToken = 'refresh-9'
            ..expiresIn = 900,
        ),
        phone: '+21355501111',
      );

      expect(notifier.isAuthenticated, isTrue);
      expect(notifier.currentUser?.userId, 'pat-9');
      expect(notifier.currentUser?.phone, '+21355501111');

      final reloaded = SharedPreferencesTokenStore(prefs);
      await reloaded.load();
      expect(reloaded.accessToken, _jwt(sub: 'pat-9', role: 'patient'));
      expect(reloaded.refreshToken, 'refresh-9');
      expect(reloaded.userSnapshot?.userId, 'pat-9');
      expect(reloaded.userSnapshot?.phone, '+21355501111');

      final restored = AuthSessionNotifier(reloaded);
      expect(restored.isAuthenticated, isTrue);
      expect(restored.currentUser?.userId, 'pat-9');
    });

    test('signOut clears tokens and snapshot', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final store = SharedPreferencesTokenStore(prefs);
      final notifier = AuthSessionNotifier(store);
      await notifier.signIn(
        TokenPair(
          (b) => b
            ..accessToken = _jwt()
            ..refreshToken = 'refresh'
            ..expiresIn = 900,
        ),
        phone: '+213555000000',
      );
      await notifier.signOut();

      final reloaded = SharedPreferencesTokenStore(prefs);
      await reloaded.load();
      expect(reloaded.accessToken, isNull);
      expect(reloaded.refreshToken, isNull);
      expect(reloaded.userSnapshot, isNull);
      expect(notifier.isAuthenticated, isFalse);
    });
  });

  group('AuthRefreshInterceptor session expiry', () {
    const bearerSecureExtra = {
      'secure': [
        {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
      ],
    };

    test(
      'does not expire session when refresh fails from no network',
      () async {
        final tokenStore = InMemoryTokenStore();
        await tokenStore.saveTokens(
          TokenPair(
            (b) => b
              ..accessToken = 'expired-access'
              ..refreshToken = 'valid-refresh'
              ..expiresIn = 900,
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
                type: DioExceptionType.connectionError,
                error: const SocketException(
                  'No address associated with hostname',
                ),
              );
            },
          ),
        );

        adapter.onGet(
          '/auth/me',
          (server) => server.reply(401, {'title': 'Unauthorized'}),
        );

        await expectLater(
          dio.get<void>('/auth/me', options: Options(extra: bearerSecureExtra)),
          throwsA(isA<DioException>()),
        );

        expect(sessionExpired, 0);
        expect(tokenStore.refreshToken, 'valid-refresh');
        expect(tokenStore.accessToken, 'expired-access');
      },
    );

    test('expires session when refresh is rejected with 401', () async {
      final tokenStore = InMemoryTokenStore();
      await tokenStore.saveTokens(
        TokenPair(
          (b) => b
            ..accessToken = 'expired-access'
            ..refreshToken = 'revoked-refresh'
            ..expiresIn = 900,
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
              type: DioExceptionType.badResponse,
              response: Response(
                requestOptions: RequestOptions(path: '/auth/refresh'),
                statusCode: 401,
              ),
            );
          },
        ),
      );

      adapter.onGet(
        '/auth/me',
        (server) => server.reply(401, {'title': 'Unauthorized'}),
      );

      await expectLater(
        dio.get<void>('/auth/me', options: Options(extra: bearerSecureExtra)),
        throwsA(isA<DioException>()),
      );

      expect(sessionExpired, 1);
    });
  });
}
