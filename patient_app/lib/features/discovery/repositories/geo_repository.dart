import 'package:gps_medical_shared/gps_medical_shared.dart';

class GeoRepository {
  GeoRepository(this._client);

  final GpsMedicalClient _client;
  List<Wilaya>? _wilayasCache;
  final Map<String, List<Commune>> _communesCache = {};

  Future<List<Wilaya>> fetchWilayas({bool forceRefresh = false}) async {
    if (!forceRefresh && _wilayasCache != null) {
      return _wilayasCache!;
    }

    final response = await _client.geolocation.geoWilayasGet();
    _wilayasCache = response.data?.toList() ?? [];

    return _wilayasCache!;
  }

  Future<List<Commune>> fetchCommunes(
    String wilayaCode, {
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh && _communesCache.containsKey(wilayaCode)) {
      return _communesCache[wilayaCode]!;
    }

    final response = await _client.geolocation.geoWilayasWilayaCodeCommunesGet(
      wilayaCode: wilayaCode,
    );
    final list = response.data?.toList() ?? [];
    _communesCache[wilayaCode] = list;

    return list;
  }

  void clearWilayasCache() {
    _wilayasCache = null;
  }

  void clearCommunesCache(String wilayaCode) {
    _communesCache.remove(wilayaCode);
  }

  Future<List<DoctorWithDistance>> fetchNearby({
    required double lat,
    required double lng,
    required double radiusKm,
    String? specialtyId,
  }) async {
    final response = await _client.v1.getGeolocationApi().geoDoctorsNearbyGet(
      lat: lat,
      lng: lng,
      radiusKm: radiusKm,
      specialtyId: specialtyId,
    );
    return response.data?.data?.toList() ?? [];
  }
}
