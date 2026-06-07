import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/profile/screens/consent_management_screen.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);

    adapter.onGet('/me/consents', (server) {
      return server.reply(200, [
        {
          'id': 'c-marketing',
          'user_id': 'u-1',
          'consent_type': 'marketing',
          'version': '2026-05-01',
          'granted_at': '2026-06-10T09:00:00Z',
        },
        {
          'id': 'c-health',
          'user_id': 'u-1',
          'consent_type': 'health_data',
          'version': '2026-05-01',
          'granted_at': '2026-06-01T09:00:00Z',
        },
      ]);
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
        home: const ConsentManagementScreen(),
      ),
    );
  }

  testWidgets('lists consent history with marketing toggle and essential revoke',
      (tester) async {
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Mes consentements'), findsOneWidget);
    expect(find.text('Communications marketing (optionnel)'), findsWidgets);
    expect(find.text('Traitement de mes données de santé'), findsOneWidget);
    expect(find.text('Retirer mon consentement'), findsOneWidget);
    expect(find.byType(SwitchListTile), findsOneWidget);
  });
}
