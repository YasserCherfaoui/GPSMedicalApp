import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/screens/clinic_detail_screen.dart';

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

  testWidgets('shows clinic profile with services, specialists, and reviews', (
    tester,
  ) async {
    const clinicId = 'c1000000-0000-4000-8000-000000000001';

    dioAdapter.onGet(
      '/clinics/$clinicId',
      (server) => server.reply(200, {
        'id': clinicId,
        'name': 'Clinique El Shifa',
        'description': 'Polyclinique à Hydra.',
        'verified': true,
        'offers_telehealth': true,
        'rating_average': 4.6,
        'rating_count': 48,
        'address': {
          'line1': '12 Rue Example',
          'commune_name': 'Hydra',
          'wilaya_name': 'Alger',
          'latitude': 36.75,
          'longitude': 3.05,
        },
      }),
    );
    dioAdapter.onGet(
      '/clinics/$clinicId/services',
      (server) => server.reply(200, [
        {
          'id': 'svc-1',
          'clinic_id': clinicId,
          'name': 'Consultation générale',
          'description': 'Examen clinique.',
          'duration_minutes': 30,
          'price_amount': 3500,
          'currency': 'DZD',
          'offers_telehealth': true,
          'accepts_cnas': true,
          'active': true,
        },
      ]),
    );
    dioAdapter.onGet(
      '/clinics/$clinicId/specialists',
      (server) => server.reply(200, [
        {
          'id': 'doc-1',
          'full_name': 'Karim Benali',
          'title': 'Dr.',
          'specialty_code': 'TRA',
        },
      ]),
    );
    dioAdapter.onGet(
      '/clinics/$clinicId/reviews',
      (server) => server.reply(200, {
        'data': [
          {
            'id': 'rev-1',
            'rating': 5,
            'comment': 'Accueil excellent.',
            'created_at': '2026-03-01T10:00:00Z',
          },
        ],
        'meta': {'page': 1, 'page_size': 10, 'total': 1, 'total_pages': 1},
      }),
    );

    await tester.pumpWidget(wrap(const ClinicDetailScreen(clinicId: clinicId)));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Clinique'), findsOneWidget);
    expect(find.text('Clinique El Shifa'), findsOneWidget);
    expect(find.text('Clinique vérifiée'), findsOneWidget);
    expect(find.text('Polyclinique à Hydra.'), findsOneWidget);
    expect(find.text('Consultation générale'), findsOneWidget);
    expect(find.text('3500 DZD'), findsOneWidget);
    expect(find.text('Dr. Karim Benali'), findsOneWidget);
    expect(
      find.text(
        'Vous réservez un service ; la clinique attribue le praticien.',
      ),
      findsOneWidget,
    );
    expect(find.text('Patient vérifié'), findsOneWidget);
    expect(find.text('Accueil excellent.'), findsOneWidget);
    expect(find.text('Réserver'), findsOneWidget);
  });

  testWidgets('shows not-found state on 404', (tester) async {
    const clinicId = 'missing-clinic';

    dioAdapter.onGet(
      '/clinics/$clinicId',
      (server) => server.reply(404, {'title': 'Not Found', 'status': 404}),
    );

    await tester.pumpWidget(wrap(const ClinicDetailScreen(clinicId: clinicId)));
    await tester.pumpAndSettle();

    expect(find.text('Clinique introuvable'), findsOneWidget);
  });
}
