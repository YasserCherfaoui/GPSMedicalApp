import 'package:gps_medical_shared/gps_medical_shared.dart';

class GeoRepository {
  GeoRepository(this._client);

  final GpsMedicalClient _client;

  Future<List<Wilaya>> fetchWilayas() async {
    final response = await _client.geolocation.geoWilayasGet();
    return response.data?.toList() ?? [];
  }

  Future<List<Commune>> fetchCommunes(String wilayaCode) async {
    final response = await _client.geolocation.geoWilayasWilayaCodeCommunesGet(
      wilayaCode: wilayaCode,
    );
    return response.data?.toList() ?? [];
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
