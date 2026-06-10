import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/notifications/services/push_notification_service.dart';
import 'package:patient_app/features/notifications/widgets/push_notifications_bootstrap.dart';
import '../../test_api_constants.dart';

class _RecordingPushService extends PushNotificationService {
  _RecordingPushService(super.ref);

  int initializeCalls = 0;
  int registerCalls = 0;

  @override
  Future<void> initialize() async {
    initializeCalls++;
  }

  @override
  Future<void> registerIfNeeded() async {
    registerCalls++;
  }
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);

    adapter.onGet('/notifications', (server) {
      return server.reply(200, {
        'data': <Map<String, dynamic>>[],
        'meta': {'page': 1, 'page_size': 1, 'total': 0, 'total_pages': 0},
      });
    });
  });

  testWidgets('registers push after authenticated session restores', (
    tester,
  ) async {
    final tokenStore = InMemoryTokenStore();
    await tokenStore.saveTokens(
      TokenPair(
        (b) => b
          ..accessToken = 'access-staging'
          ..refreshToken = 'refresh-staging',
      ),
    );

    late _RecordingPushService push;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gpsMedicalClientProvider.overrideWithValue(client),
          tokenStoreProvider.overrideWithValue(tokenStore),
          pushNotificationServiceProvider.overrideWith((ref) {
            push = _RecordingPushService(ref);
            return push;
          }),
        ],
        child: const MaterialApp(
          home: PushNotificationsBootstrap(child: Text('App')),
        ),
      ),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    expect(push.initializeCalls, greaterThanOrEqualTo(1));
    expect(push.registerCalls, greaterThanOrEqualTo(1));
  });

  testWidgets('registers push when user signs in', (tester) async {
    final tokenStore = InMemoryTokenStore();
    late _RecordingPushService push;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gpsMedicalClientProvider.overrideWithValue(client),
          tokenStoreProvider.overrideWithValue(tokenStore),
          pushNotificationServiceProvider.overrideWith((ref) {
            push = _RecordingPushService(ref);
            return push;
          }),
        ],
        child: const MaterialApp(
          home: PushNotificationsBootstrap(child: Text('App')),
        ),
      ),
    );
    await tester.pump();

    final container = ProviderScope.containerOf(
      tester.element(find.text('App')),
    );
    await container
        .read(authSessionProvider)
        .signIn(
          TokenPair(
            (b) => b
              ..accessToken = 'access-after-login'
              ..refreshToken = 'refresh-after-login',
          ),
        );
    await tester.pump();
    await tester.pumpAndSettle();

    expect(push.registerCalls, greaterThanOrEqualTo(1));
  });
}
