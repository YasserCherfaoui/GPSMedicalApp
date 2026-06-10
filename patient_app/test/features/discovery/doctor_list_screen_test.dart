import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/screens/doctor_list_screen.dart';
import 'package:patient_app/features/discovery/utils/discovery_api_error.dart';
import 'package:patient_app/features/discovery/widgets/discovery_error_view.dart';
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

  void mockSpecialties() {
    dioAdapter.onGet('/specialties', (server) {
      return server.reply(200, [
        {
          'id': 'spec-1',
          'code': 'CAR',
          'name_fr': 'Cardiologie',
          'name_ar': 'طب القلب',
        },
      ]);
    });
  }

  testWidgets('shows shimmer then doctor cards with localized header', (
    tester,
  ) async {
    mockSpecialties();
    dioAdapter.onGet('/doctors', (server) {
      return server.reply(200, {
        'data': [
          {
            'id': 'doc-1',
            'full_name': 'Benali',
            'title': 'Dr.',
            'verified': true,
            'rating_average': 4.5,
            'rating_count': 12,
            'consultation_fee_dzd': 2500,
            'offers_telehealth': true,
            'specialties': [
              {
                'id': 'spec-1',
                'code': 'CAR',
                'name_fr': 'Cardiologie',
                'name_ar': 'طب القلب',
              },
            ],
            'practice_address': {
              'wilaya_name': 'Alger',
              'commune_name': 'Hydra',
            },
          },
        ],
        'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
      });
    });

    await tester.pumpWidget(wrap(const DoctorListScreen()));
    await tester.pump();

    expect(find.byType(LoadingSkeleton), findsWidgets);

    await tester.pumpAndSettle();

    expect(find.text('MedNavigator'), findsOneWidget);
    expect(find.text('Spécialistes recommandés'), findsOneWidget);
    expect(find.text('Dr. Benali'), findsOneWidget);
    expect(find.text('Cardiologie'), findsWidgets);
    expect(find.text('Prendre RDV'), findsOneWidget);
  });

  testWidgets('shows empty state when no doctors returned', (tester) async {
    mockSpecialties();
    dioAdapter.onGet('/doctors', (server) {
      return server.reply(200, {
        'data': <Map<String, dynamic>>[],
        'meta': {'page': 1, 'page_size': 20, 'total': 0, 'total_pages': 0},
      });
    });

    await tester.pumpWidget(wrap(const DoctorListScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Aucun médecin trouvé'), findsOneWidget);
    expect(find.text('Rechercher'), findsOneWidget);
  });

  testWidgets('DiscoveryErrorView shows localized rate-limit countdown', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(
        Scaffold(
          body: DiscoveryErrorView(
            error: DiscoveryRateLimitException(30),
            onRetry: () {},
          ),
        ),
      ),
    );

    expect(find.text('Trop de requêtes'), findsOneWidget);
    expect(find.textContaining('secondes'), findsOneWidget);
  });
}
