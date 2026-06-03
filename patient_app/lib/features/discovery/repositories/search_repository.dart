import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/doctor_search.provider.dart';
import '../utils/discovery_api_error.dart';

class SearchRepository {
  SearchRepository(this._client);

  final GpsMedicalClient _client;

  Future<({List<Doctor> doctors, int total})> searchDoctors({
    required SearchFilters filters,
    required int page,
    required int pageSize,
    double? userLat,
    double? userLng,
  }) async {
    try {
      final response = await _client.v1.getSearchApi().searchDoctorsGet(
        q: filters.query.isNotEmpty ? filters.query : null,
        specialtyId: filters.specialtyId,
        wilayaCode: filters.wilayaCode,
        communeId: filters.communeCode,
        gender: filters.gender,
        language: filters.languages.isNotEmpty
            ? BuiltList<String>(filters.languages)
            : null,
        acceptsCnas: filters.acceptsCnas ? true : null,
        acceptsCasnos: filters.acceptsCasnos ? true : null,
        maxFeeDzd: filters.maxFee < 10000 ? filters.maxFee : null,
        telehealth: filters.offersTelehealth ? true : null,
        availableWithinDays: filters.availableWithinDays,
        lat: userLat,
        lng: userLng,
        sort: filters.sort,
        page: page,
        pageSize: pageSize,
      );
      final paginated = response.data;
      return (
        doctors: paginated?.data?.toList() ?? [],
        total: paginated?.meta?.total ?? 0,
      );
    } catch (e) {
      rethrowDiscoveryApiError(e);
    }
  }

  Future<SearchSuggestGet200Response?> suggest(String query) async {
    if (query.trim().length < 2) return null;
    final response = await _client.v1.getSearchApi().searchSuggestGet(q: query);
    return response.data;
  }
}
