import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/notifications/screens/notification_preferences_screen.dart';
import '../../test_api_constants.dart';

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

    adapter.onGet('/notifications/preferences', (server) {
      return server.reply(200, {
        'push_enabled': true,
        'sms_enabled': false,
        'email_enabled': true,
        'appointment_reminders': true,
        'reminder_hours_before': 24,
      });
    });
  });

  Widget wrap() {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: const NotificationPreferencesScreen(),
      ),
    );
  }

  testWidgets('loads preferences and toggles push channel', (tester) async {
    adapter.onPut('/notifications/preferences', (server) {
      return server.reply(200, {
        'push_enabled': false,
        'sms_enabled': false,
        'email_enabled': true,
        'appointment_reminders': true,
        'reminder_hours_before': 24,
      });
    });

    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Préférences de notification'), findsOneWidget);
    expect(find.text('Notifications push'), findsOneWidget);

    final pushSwitch = find.byType(SwitchListTile).first;
    expect(tester.widget<SwitchListTile>(pushSwitch).value, isTrue);

    await tester.tap(pushSwitch);
    await tester.pumpAndSettle();

    expect(tester.widget<SwitchListTile>(pushSwitch).value, isFalse);
  });
}
