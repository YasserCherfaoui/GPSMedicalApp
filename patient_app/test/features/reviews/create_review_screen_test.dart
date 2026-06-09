import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/reviews/screens/create_review_screen.dart';
import 'package:patient_app/features/reviews/screens/review_confirmation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late GpsMedicalClient client;

  const appointmentId = 'appt-review-1';
  const doctorId = 'doc-review-1';

  setUp(() {
    SharedPreferences.setMockInitialValues({});
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
        'start_at': '2026-05-01T09:00:00Z',
        'end_at': '2026-05-01T09:30:00Z',
        'mode': 'in_person',
        'status': 'completed',
        'fee_dzd': 2500,
        'payment_status': 'paid',
        'created_at': '2026-04-01T00:00:00Z',
        'updated_at': '2026-04-01T00:00:00Z',
      });
    });

    adapter.onGet('/doctors/$doctorId', (server) {
      return server.reply(200, {
        'id': doctorId,
        'full_name': 'Karim Benali',
        'title': 'Dr.',
        'consultation_fee_dzd': 2500,
      });
    });
  });

  Widget wrap() {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => CreateReviewScreen(appointmentId: appointmentId),
        ),
        GoRoute(
          path: '/appointments/:id/review/confirmation',
          builder: (context, state) => ReviewConfirmationScreen(
            appointmentId: state.pathParameters['id']!,
            review: state.extra as Review?,
          ),
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

  testWidgets('shows rating form for completed appointment', (tester) async {
    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    expect(find.text('Laisser un avis'), findsOneWidget);
    expect(find.text('Dr. Karim Benali'), findsOneWidget);
    expect(find.text('Envoyer'), findsOneWidget);
    expect(find.byIcon(Icons.star_outline_rounded), findsWidgets);
  });

  testWidgets('submits review when rating is selected', (tester) async {
    adapter.onPost('/reviews', (server) {
      return server.reply(201, {
        'id': 'rev-new',
        'doctor_id': doctorId,
        'patient_id': 'pat-1',
        'appointment_id': appointmentId,
        'rating': 5,
        'comment': 'Excellent',
        'status': 'pending',
        'created_at': '2026-06-01T10:00:00Z',
      });
    });

    await tester.pumpWidget(wrap());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.star_outline_rounded).last);
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'Excellent');
    await tester.tap(find.text('Envoyer'));
    await tester.pumpAndSettle();

    expect(find.text('Merci pour votre avis'), findsWidgets);
  });
}
