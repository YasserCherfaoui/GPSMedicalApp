import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/screens/doctor_detail_screen.dart';
import '../../test_api_constants.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late GpsMedicalClient client;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

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

  testWidgets('shows doctor profile with fee and insurance chips', (
    tester,
  ) async {
    const doctorId = 'd1000000-0000-4000-8000-000000000001';

    dioAdapter.onGet(
      '/doctors/$doctorId',
      (server) => server.reply(200, {
        'id': doctorId,
        'full_name': 'Karim Benali',
        'title': 'Dr.',
        'verified': true,
        'bio': 'Spécialiste en traumatologie.',
        'consultation_fee_dzd': 2500,
        'accepts_cnas': true,
        'accepts_casnos': true,
        'offers_telehealth': true,
        'languages': ['ar', 'fr'],
        'specialties': [
          {
            'id': 'spec-1',
            'code': 'TRA',
            'name_fr': 'Traumatologie',
            'name_ar': 'جراحة',
          },
        ],
        'practice_address': {
          'line1': '12 Rue Example',
          'commune_name': 'Hydra',
          'wilaya_name': 'Alger',
          'latitude': 36.75,
          'longitude': 3.05,
        },
        'rating_average': 4.8,
        'rating_count': 12,
      }),
    );
    dioAdapter.onGet(
      '/doctors/$doctorId/reviews',
      (server) => server.reply(200, {
        'data': [
          {
            'id': 'rev-1',
            'rating': 5,
            'comment': 'Excellent médecin.',
            'created_at': '2026-03-01T10:00:00Z',
          },
        ],
        'meta': {'page': 1, 'page_size': 10, 'total': 1, 'total_pages': 1},
      }),
    );

    await tester.pumpWidget(wrap(const DoctorDetailScreen(doctorId: doctorId)));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Profil du spécialiste'), findsOneWidget);
    expect(find.text('Dr. Karim Benali'), findsOneWidget);
    expect(find.text('Traumatologie'), findsOneWidget);
    expect(find.text('Conventionné CNAS'), findsOneWidget);
    expect(find.text('Conventionné CASNOS'), findsOneWidget);
    expect(find.text('Réserver'), findsOneWidget);
    expect(find.text('Téléconsultation'), findsOneWidget);
    expect(find.text('Patient vérifié'), findsOneWidget);
  });

  testWidgets('shows not-found state on 404', (tester) async {
    const doctorId = 'missing-doctor';

    dioAdapter.onGet(
      '/doctors/$doctorId',
      (server) => server.reply(404, {'title': 'Not Found', 'status': 404}),
    );

    await tester.pumpWidget(wrap(const DoctorDetailScreen(doctorId: doctorId)));
    await tester.pumpAndSettle();

    expect(find.text('Médecin introuvable'), findsOneWidget);
  });
}
