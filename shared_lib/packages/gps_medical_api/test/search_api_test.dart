import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for SearchApi
void main() {
  final instance = GpsMedicalApi().getSearchApi();

  group(SearchApi, () {
    // Recherche de cliniques
    //
    //Future<PaginatedClinics> searchClinics({ String q, String wilayaCode, String communeId, int page, int pageSize }) async
    test('test searchClinics', () async {
      // TODO
    });

    // Recherche multicritères de médecins
    //
    // Uniquement des médecins `verified=true`. Les dossiers `approved_pending_activation` sont exclus. 
    //
    //Future<PaginatedDoctors> searchDoctorsGet({ String q, String specialtyId, String wilayaCode, String communeId, String gender, BuiltList<String> language, bool acceptsCnas, bool acceptsCasnos, int maxFeeDzd, bool telehealth, int availableWithinDays, double lat, double lng, String sort, int page, int pageSize }) async
    test('test searchDoctorsGet', () async {
      // TODO
    });

    // Suggestions auto-complétion (médecins, spécialités, communes)
    //
    // Les suggestions de médecins ne portent que sur `verified=true`. 
    //
    //Future<SearchSuggestGet200Response> searchSuggestGet(String q) async
    test('test searchSuggestGet', () async {
      // TODO
    });

  });
}
