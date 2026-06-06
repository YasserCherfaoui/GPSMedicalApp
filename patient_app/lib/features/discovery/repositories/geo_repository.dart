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

  Commune? findCommuneInCache(String communeId) {
    for (final communes in _communesCache.values) {
      final found = communes.where((c) => c.id == communeId).firstOrNull;
      if (found != null) return found;
    }
    return null;
  }

  /// Resolves a commune by id, optionally narrowing the search via [wilayaNameHint]
  /// from autosuggest labels such as `Hydra (Alger)`.
  Future<Commune?> findCommuneById(
    String communeId, {
    String? wilayaNameHint,
  }) async {
    final cached = findCommuneInCache(communeId);
    if (cached != null) return cached;

    final wilayas = await fetchWilayas();
    final candidates = wilayaNameHint == null
        ? wilayas
        : wilayas
              .where(
                (w) => _wilayaMatchesHint(
                  w,
                  wilayaNameHint,
                ),
              )
              .toList();

    for (final wilaya in candidates) {
      final code = wilaya.code;
      if (code == null || code.isEmpty) continue;

      final communes = await fetchCommunes(code);
      final found = communes.where((c) => c.id == communeId).firstOrNull;
      if (found != null) return found;
    }

    return null;
  }

  bool _wilayaMatchesHint(Wilaya wilaya, String hint) {
    final normalizedHint = _normalizeGeoName(hint);
    if (normalizedHint.isEmpty) return false;

    final fr = _normalizeGeoName(wilaya.nameFr ?? '');
    final ar = (wilaya.nameAr ?? '').trim().toLowerCase();
    final code = (wilaya.code ?? '').trim();

    return fr == normalizedHint ||
        ar == hint.trim().toLowerCase() ||
        code == hint.trim();
  }

  String _normalizeGeoName(String input) {
    const withAccents =
        'àáâãäåçèéêëìíîïñòóôõöùúûüýÿÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝ';
    const withoutAccents =
        'aaaaaaceeeeiiiinooooouuuuyyAAAAAACEEEEIIIINOOOOOUUUUY';
    var output = input.trim().toLowerCase();
    for (var i = 0; i < withAccents.length; i++) {
      output = output.replaceAll(withAccents[i], withoutAccents[i]);
    }
    return output;
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
