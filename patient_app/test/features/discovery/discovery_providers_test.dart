import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/providers/doctor_detail.provider.dart';
import 'package:patient_app/features/discovery/providers/doctor_list.provider.dart';
import 'package:patient_app/features/discovery/providers/doctor_search.provider.dart';
import 'package:patient_app/features/discovery/providers/specialties.provider.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late GpsMedicalClient client;
  late ProviderContainer container;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.gpsmedical.dz/v1'));
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    client = GpsMedicalClient(tokenStore: InMemoryTokenStore(), v1Dio: dio);

    container = ProviderContainer(
      overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('Specialties Provider', () {
    test('fetches and caches specialties list', () async {
      var callCount = 0;
      dioAdapter.onGet('/specialties', (server) {
        callCount++;
        return server.reply(200, [
          {
            'id': 'spec-1',
            'code': 'CAR',
            'name_fr': 'Cardiologie',
            'name_ar': 'طب القلب',
          },
          {
            'id': 'spec-2',
            'code': 'PED',
            'name_fr': 'Pédiatrie',
            'name_ar': 'طب الأطفال',
            'parent_id': 'spec-1',
          },
        ]);
      });

      // specialtiesProvider has keepAlive: true, so it won't auto-dispose.
      // Read for the first time
      final result1 = await container.read(specialtiesProvider.future);
      expect(result1, hasLength(2));
      expect(result1[0].id, 'spec-1');
      expect(result1[0].nameFr, 'Cardiologie');
      expect(result1[1].parentId, 'spec-1');
      expect(callCount, 1);

      // Read for the second time
      final result2 = await container.read(specialtiesProvider.future);
      expect(result2, hasLength(2));
      // Call count should still be 1 (cached)
      expect(callCount, 1);
    });
  });

  group('DoctorList Provider', () {
    test('fetches first page and page 2 incrementally', () async {
      // Listen to the provider to keep it alive (prevent auto-dispose)
      container.listen(doctorListProvider, (_, __) {});

      dioAdapter.onGet(
        '/doctors',
        (server) => server.reply(200, (RequestOptions options) {
          final page = options.queryParameters['page']?.toString();
          if (page == '2') {
            return {
              'data': [
                {'id': 'doc-20', 'full_name': 'Doctor 20', 'verified': true},
              ],
              'meta': {
                'page': 2,
                'page_size': 20,
                'total': 21,
                'total_pages': 2,
              },
            };
          } else {
            return {
              'data': List.generate(
                20,
                (i) => {
                  'id': 'doc-$i',
                  'full_name': 'Doctor $i',
                  'verified': true,
                },
              ),
              'meta': {
                'page': 1,
                'page_size': 20,
                'total': 21,
                'total_pages': 2,
              },
            };
          }
        }),
      );

      // Verify page 1 loading
      final firstStateAsync = container.read(doctorListProvider);
      if (firstStateAsync.hasError) {
        fail(
          'PAGE 1 ERROR: ${firstStateAsync.error}\n${firstStateAsync.stackTrace}',
        );
      }

      var listState = await container.read(doctorListProvider.future);
      expect(listState.doctors, hasLength(20));
      expect(listState.currentPage, 1);
      expect(listState.hasMore, isTrue);

      // Load next page
      await container.read(doctorListProvider.notifier).loadNextPage();

      // Verify combined list
      final nextStateAsync = container.read(doctorListProvider);
      if (nextStateAsync.hasError) {
        fail(
          'PAGE 2 ERROR: ${nextStateAsync.error}\n${nextStateAsync.stackTrace}',
        );
      }

      listState = nextStateAsync.value!;
      expect(listState.doctors, hasLength(21));
      expect(listState.currentPage, 2);
      expect(listState.hasMore, isFalse);
    });
  });

  group('DoctorSearch Provider and Filters', () {
    test('serializes search filters correctly', () async {
      // Listen to the provider to keep it alive (prevent auto-dispose)
      container.listen(doctorSearchProvider, (_, __) {});

      dioAdapter.onGet(
        '/search/doctors',
        (server) => server.reply(200, (RequestOptions options) {
          final queryParams = options.queryParameters;
          expect(queryParams['q'], 'Benali');
          expect(queryParams['specialty_id'], 'spec-cardiology');
          expect(queryParams['wilaya_code'], '16');
          expect(queryParams['commune_id'], '1601');
          expect(queryParams['gender'], 'male');
          expect(queryParams['accepts_cnas'], true);
          expect(queryParams['accepts_casnos'], true);
          expect(queryParams['max_fee_dzd'], 3000);
          expect(queryParams['telehealth'], true);
          expect(queryParams['sort'], 'rating_desc');

          final langParam = queryParams['language'];
          expect(langParam.toString(), contains('fr'));

          return {
            'data': [
              {
                'id': 'doc-search-1',
                'full_name': 'Searched Doctor',
                'verified': true,
              },
            ],
            'meta': {'page': 1, 'page_size': 20, 'total': 1, 'total_pages': 1},
          };
        }),
      );

      // Update filters using SearchFiltersNotifier
      final filtersNotifier = container.read(
        searchFiltersNotifierProvider.notifier,
      );
      filtersNotifier.updateQuery('Benali');
      filtersNotifier.selectSpecialty('spec-cardiology');
      filtersNotifier.selectWilaya('16');
      filtersNotifier.selectCommune('1601');
      filtersNotifier.selectGender('male');
      filtersNotifier.toggleLanguage('fr');
      filtersNotifier.toggleCnas(true);
      filtersNotifier.toggleCasnos(true);
      filtersNotifier.updateMaxFee(3000);
      filtersNotifier.toggleTelehealth(true);
      filtersNotifier.updateSort('rating_desc');

      // Verify that doctorSearchProvider triggers fetch with serialized filters
      final searchState = await container.read(doctorSearchProvider.future);
      expect(searchState.doctors, hasLength(1));
      expect(searchState.doctors[0].id, 'doc-search-1');
    });
  });

  group('DoctorDetail Provider', () {
    test('loads profile when reviews endpoint returns 404', () async {
      const doctorId = 'd1000000-0000-4000-8000-000000000001';

      dioAdapter.onGet(
        '/doctors/$doctorId',
        (server) => server.reply(200, {
          'id': doctorId,
          'full_name': 'Dr. Test',
          'verified': true,
        }),
      );
      dioAdapter.onGet(
        '/doctors/$doctorId/reviews',
        (server) => server.reply(404, {
          'title': 'Not Found',
          'status': 404,
        }),
      );

      final detail = await container.read(
        doctorDetailProvider(doctorId).future,
      );

      expect(detail.doctor.id, doctorId);
      expect(detail.doctor.fullName, 'Dr. Test');
      expect(detail.reviews, isEmpty);
      expect(detail.hasMoreReviews, isFalse);
    });
  });
}
