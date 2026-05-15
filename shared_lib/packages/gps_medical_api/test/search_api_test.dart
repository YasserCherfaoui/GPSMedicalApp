import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

/// tests for SearchApi
void main() {
  final instance = GpsMedicalApi().getSearchApi();

  group(SearchApi, () {
    // Recherche multicritères de médecins
    //
    //Future<PaginatedDoctors> searchDoctorsGet({ String q, String specialtyId, String wilayaCode, String communeId, String gender, BuiltList<String> language, bool acceptsCnas, bool acceptsCasnos, int maxFeeDzd, bool telehealth, int availableWithinDays, String sort, int page, int pageSize }) async
    test('test searchDoctorsGet', () async {
      // TODO
    });

    // Suggestions auto-complétion (médecins, spécialités, communes)
    //
    //Future<SearchSuggestGet200Response> searchSuggestGet(String q) async
    test('test searchSuggestGet', () async {
      // TODO
    });
  });
}
