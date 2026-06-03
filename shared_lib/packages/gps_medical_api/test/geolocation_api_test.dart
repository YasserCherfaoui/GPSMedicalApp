import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for GeolocationApi
void main() {
  final instance = GpsMedicalApi().getGeolocationApi();

  group(GeolocationApi, () {
    // Médecins à proximité d'un point GPS
    //
    //Future<PaginatedDoctorsWithDistance> geoDoctorsNearbyGet(double lat, double lng, { num radiusKm, String specialtyId, int page, int pageSize }) async
    test('test geoDoctorsNearbyGet', () async {
      // TODO
    });

    // Liste des 58 wilayas algériennes
    //
    //Future<BuiltList<Wilaya>> geoWilayasGet() async
    test('test geoWilayasGet', () async {
      // TODO
    });

    // Communes d'une wilaya donnée
    //
    //Future<BuiltList<Commune>> geoWilayasWilayaCodeCommunesGet(String wilayaCode) async
    test('test geoWilayasWilayaCodeCommunesGet', () async {
      // TODO
    });

  });
}
