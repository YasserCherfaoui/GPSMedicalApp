import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/providers/doctor_search.provider.dart';
import 'package:patient_app/features/discovery/screens/doctor_search_screen.dart';
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

  void mockSearch({List<Map<String, Object?>>? data, int total = 0}) {
    dioAdapter.onGet('/search/doctors', (server) {
      return server.reply(200, {
        'data': data ?? [],
        'meta': {
          'page': 1,
          'page_size': 20,
          'total': total,
          'total_pages': total == 0 ? 0 : 1,
        },
      });
    });
  }

  testWidgets('shows localized empty state with clear-filters action', (
    tester,
  ) async {
    mockSearch();

    await tester.pumpWidget(wrap(const DoctorSearchScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Aucun médecin ne correspond'), findsOneWidget);
    expect(find.text('Effacer les filtres'), findsOneWidget);
  });

  testWidgets('shows filter badge when filters are active', (tester) async {
    mockSearch();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gpsMedicalClientProvider.overrideWithValue(client),
          searchFiltersNotifierProvider.overrideWith(
            () => _PrefilledSearchFilters(),
          ),
        ],
        child: MaterialApp(
          theme: GpsTheme.light(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('fr'),
          home: const DoctorSearchScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(Badge), findsOneWidget);
  });

  testWidgets('renders search results', (tester) async {
    mockSearch(
      data: [
        {
          'id': 'doc-1',
          'full_name': 'Karim Benali',
          'title': 'Dr.',
          'verified': true,
          'consultation_fee_dzd': 2000,
        },
      ],
      total: 1,
    );

    await tester.pumpWidget(wrap(const DoctorSearchScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Dr. Karim Benali'), findsOneWidget);
  });
}

class _PrefilledSearchFilters extends SearchFiltersNotifier {
  @override
  SearchFilters build() {
    return const SearchFilters(
      specialtyId: 'spec-1',
      wilayaCode: '16',
      sort: 'rating_desc',
    );
  }
}
