import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/booking/screens/appointment_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  const appointmentId = 'appt-detail-1';
  const doctorId = 'doc-detail-1';

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = adapter;
    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);
  });

  Widget wrap(Widget child) {
    return ProviderScope(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      child: MaterialApp(
        theme: GpsTheme.light(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: child,
      ),
    );
  }

  void mockDetail({
    required String status,
    required String mode,
    required String startAt,
    String? reason,
    String paymentStatus = 'unpaid',
  }) {
    adapter.onGet('/appointments/$appointmentId', (server) {
      return server.reply(200, {
        'id': appointmentId,
        'patient_id': 'pat-1',
        'doctor_id': doctorId,
        'start_at': startAt,
        'end_at': '2026-06-10T09:30:00Z',
        'mode': mode,
        'status': status,
        'fee_dzd': 3000,
        'payment_status': paymentStatus,
        if (reason != null) 'reason': reason,
        'created_at': '2026-06-01T00:00:00Z',
        'updated_at': '2026-06-01T00:00:00Z',
      });
    });

    adapter.onGet('/doctors/$doctorId', (server) {
      return server.reply(200, {
        'id': doctorId,
        'full_name': 'Karim Benali',
        'title': 'Dr.',
        'consultation_fee_dzd': 2500,
        'specialties': [
          {'id': 's1', 'code': 'CAR', 'name_fr': 'Cardiologie'},
        ],
        'practice_address': {
          'line1': '12 Rue Didouche Mourad',
          'commune_name': 'Alger Centre',
          'wilaya_name': 'Alger',
          'latitude': 36.7538,
          'longitude': 3.0588,
        },
      });
    });
  }

  testWidgets('shows doctor card, schedule, mode, fee, and payment status', (
    tester,
  ) async {
    mockDetail(
      status: 'confirmed',
      mode: 'in_person',
      startAt: '2027-06-10T09:00:00Z',
      reason: 'Contrôle annuel',
      paymentStatus: 'paid',
    );

    await tester.pumpWidget(
      wrap(const AppointmentDetailScreen(appointmentId: appointmentId)),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Détail du rendez-vous'), findsOneWidget);
    expect(find.text('Dr. Karim Benali'), findsOneWidget);
    expect(find.text('Cardiologie'), findsOneWidget);
    expect(find.text('Confirmé'), findsOneWidget);
    expect(find.text('En présentiel'), findsOneWidget);
    expect(find.text('Payé'), findsOneWidget);
    expect(find.text('Contrôle annuel'), findsOneWidget);
    expect(find.text('Adresse de pratique'), findsOneWidget);
    expect(find.textContaining('12 Rue Didouche Mourad'), findsOneWidget);
    expect(find.text('Itinéraire'), findsOneWidget);
  });

  testWidgets('shows cancel and reschedule when start is more than 24h away', (
    tester,
  ) async {
    mockDetail(
      status: 'pending',
      mode: 'in_person',
      startAt: '2027-06-10T09:00:00Z',
    );

    await tester.pumpWidget(
      wrap(const AppointmentDetailScreen(appointmentId: appointmentId)),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Annuler'), findsOneWidget);
    expect(find.text('Reporter'), findsOneWidget);
  });

  testWidgets('hides modify actions when appointment starts within 24h', (
    tester,
  ) async {
    final soon = DateTime.now().toUtc().add(const Duration(hours: 2));
    mockDetail(
      status: 'confirmed',
      mode: 'in_person',
      startAt: soon.toIso8601String(),
    );

    await tester.pumpWidget(
      wrap(const AppointmentDetailScreen(appointmentId: appointmentId)),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Annuler'), findsNothing);
    expect(find.text('Reporter'), findsNothing);
  });

  testWidgets('confirmed unpaid appointment shows pay deposit CTA', (
    tester,
  ) async {
    mockDetail(
      status: 'confirmed',
      mode: 'in_person',
      startAt: '2027-06-10T09:00:00Z',
      paymentStatus: 'unpaid',
    );

    await tester.pumpWidget(
      wrap(const AppointmentDetailScreen(appointmentId: appointmentId)),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Payer l\'acompte'), findsWidgets);
  });

  testWidgets('completed appointment shows enabled leave review CTA', (
    tester,
  ) async {
    mockDetail(
      status: 'completed',
      mode: 'in_person',
      startAt: '2026-01-10T09:00:00Z',
    );

    await tester.pumpWidget(
      wrap(const AppointmentDetailScreen(appointmentId: appointmentId)),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    final reviewButton = find.widgetWithText(OutlinedButton, 'Laisser un avis');
    expect(reviewButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(reviewButton).onPressed, isNotNull);
  });

  testWidgets('completed appointment shows already reviewed tile when cached', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'gps_appointment_reviews': '{"$appointmentId":{"appointment_id":"$appointmentId","review_id":"rev-1","rating":5,"created_at":"2026-06-01T10:00:00Z","status":"pending"}}',
    });
    mockDetail(
      status: 'completed',
      mode: 'in_person',
      startAt: '2026-01-10T09:00:00Z',
    );

    await tester.pumpWidget(
      wrap(const AppointmentDetailScreen(appointmentId: appointmentId)),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Vous avez déjà laissé un avis'), findsOneWidget);
    expect(find.text('Laisser un avis'), findsNothing);
  });
}
