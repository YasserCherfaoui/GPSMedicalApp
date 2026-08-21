import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/teleconsultation/screens/patient_teleconsultation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  const appointmentId = '00000000-0000-4000-8000-000000000099';
  const doctorId = 'doc-teleconsult-1';

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);

    final start = DateTime.now().toUtc().add(const Duration(days: 2));
    final end = start.add(const Duration(minutes: 30));
    adapter.onGet('/appointments/$appointmentId', (server) {
      return server.reply(200, {
        'id': appointmentId,
        'patient_id': 'pat-1',
        'doctor_id': doctorId,
        'start_at': start.toIso8601String(),
        'end_at': end.toIso8601String(),
        'mode': 'telehealth',
        'status': 'confirmed',
        'fee_dzd': 3000,
        'payment_status': 'unpaid',
        'created_at': '2026-06-01T00:00:00Z',
        'updated_at': '2026-06-01T00:00:00Z',
      });
    });
    adapter.onGet('/doctors/$doctorId', (server) {
      return server.reply(200, {
        'id': doctorId,
        'full_name': 'Karim Benali',
        'title': 'Dr.',
      });
    });
  });

  Widget wrap(Widget child) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, __) => child),
        GoRoute(
          path: GpsRoutes.appointments,
          builder: (_, __) => const SizedBox.shrink(),
        ),
      ],
    );
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp.router(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        routerConfig: router,
      ),
    );
  }

  testWidgets('teleconsult shows waiting countdown when window closed', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(const PatientTeleconsultationScreen(appointmentId: appointmentId)),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(find.text("La session n'est pas encore ouverte."), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(find.textContaining('Ouverture dans'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 2));
  });
}
