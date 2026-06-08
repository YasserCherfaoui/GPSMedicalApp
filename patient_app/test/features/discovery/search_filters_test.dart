import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/discovery/providers/doctor_search.provider.dart';

import 'geo_test_fixtures.dart';
import '../../test_api_constants.dart';

void main() {
  group('SearchFilters.activeFiltersCount', () {
    test('counts zero on defaults', () {
      const filters = SearchFilters();
      expect(filters.activeFiltersCount, 0);
    });

    test('counts each active constraint', () {
      const filters = SearchFilters(
        specialtyId: 'spec-1',
        wilayaCode: '16',
        communeCode: 'commune-1',
        gender: 'female',
        languages: ['fr', 'ar'],
        acceptsCnas: true,
        acceptsCasnos: true,
        maxFee: 3000,
        offersTelehealth: true,
        availableWithinDays: 7,
        sort: 'rating_desc',
      );

      expect(filters.activeFiltersCount, 11);
    });

    test('does not count free-text query', () {
      const filters = SearchFilters(query: 'Benali');
      expect(filters.activeFiltersCount, 0);
    });
  });

  group('SearchFiltersNotifier', () {
    test('reset restores defaults and clear-all semantics', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(searchFiltersNotifierProvider.notifier);
      notifier.updateQuery('Cardio');
      notifier.selectSpecialty('spec-1');
      notifier.selectWilaya('16');
      notifier.toggleCnas(true);
      notifier.updateSort('fee_asc');

      notifier.reset();

      final state = container.read(searchFiltersNotifierProvider);
      expect(state, const SearchFilters());
      expect(state.query, isEmpty);
      expect(state.activeFiltersCount, 0);
    });

    test('applyLocationSuggestion resolves wilaya for commune picks', () async {
      const communeId = '5fcffb1c-ad63-4de0-b594-9f3a8c8f1a2b';

      final dio = Dio(BaseOptions(baseUrl: kTestApiV1BaseUrl));
      final dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;
      final client = GpsMedicalClient(
        tokenStore: InMemoryTokenStore(),
        v1Dio: dio,
      );

      dioAdapter.onGet('/geo/wilayas', (server) {
        return server.reply(200, [wilayaJson()]);
      });
      dioAdapter.onGet('/geo/wilayas/16/communes', (server) {
        return server.reply(200, [
          communeJson(id: communeId, nameFr: 'Hydra'),
        ]);
      });

      final container = ProviderContainer(
        overrides: [gpsMedicalClientProvider.overrideWithValue(client)],
      );
      addTearDown(container.dispose);
      container.listen(searchFiltersNotifierProvider, (_, __) {});

      final notifier = container.read(searchFiltersNotifierProvider.notifier);
      await notifier.applyLocationSuggestion(
        SuggestItem(
          (b) => b
            ..id = communeId
            ..label = 'Hydra (Alger)'
            ..kind = SuggestItemKindEnum.location,
        ),
      );

      final state = container.read(searchFiltersNotifierProvider);
      expect(state.communeCode, communeId);
      expect(state.wilayaCode, '16');
      expect(state.locationDisplayLabel, isNull);
    });
  });
}
