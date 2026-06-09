import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/payments/screens/payment_deposit_screen.dart';

import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  const appointmentId = 'appt-pay-1';
  const doctorId = 'doc-pay-1';

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);

    adapter.onGet('/appointments/$appointmentId', (server) {
      return server.reply(200, {
        'id': appointmentId,
        'patient_id': 'pat-1',
        'doctor_id': doctorId,
        'start_at': '2027-06-10T09:00:00Z',
        'end_at': '2027-06-10T09:30:00Z',
        'mode': 'in_person',
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
        'consultation_fee_dzd': 3000,
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
        home: PaymentDepositScreen(appointmentId: appointmentId),
      ),
    );
  }

  testWidgets('shows deposit amount and sandbox pay actions', (tester) async {
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Payer l\'acompte'), findsNWidgets(2));
    expect(find.text('Dr. Karim Benali'), findsOneWidget);
    expect(find.textContaining('3'), findsWidgets);
    expect(find.text('Mode test (sandbox)'), findsOneWidget);
    expect(find.widgetWithText(PrimaryButton, 'Payer l\'acompte'), findsOneWidget);
  });
}
