import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for ConciergeApi
void main() {
  final instance = GpsMedicalApi().getConciergeApi();

  group(ConciergeApi, () {
    // Ouvrir un dossier patient → concierge
    //
    // Admin : doit fournir `concierge_user_id` (ou laisse vide pour assignation auto). Concierge : s'auto-assigne ; `concierge_user_id` ignoré. Crée le fil de messagerie lié (`thread_id`). 
    //
    //Future<ConciergeCase> createConciergeCase(ConciergeCaseCreate conciergeCaseCreate) async
    test('test createConciergeCase', () async {
      // TODO
    });

    // Détail d'un dossier (patient + RDV à venir)
    //
    //Future<ConciergeCaseDetail> getConciergeCase(String caseId) async
    test('test getConciergeCase', () async {
      // TODO
    });

    // Dossiers assignés au concierge connecté
    //
    //Future<PaginatedConciergeCases> listMyConciergeCases({ int page, int pageSize, ConciergeCaseStatus status }) async
    test('test listMyConciergeCases', () async {
      // TODO
    });

    // Mettre à jour statut / note / réassignation
    //
    // Concierge assigné ou admin. Toute mutation est auditée. 
    //
    //Future<ConciergeCase> patchConciergeCase(String caseId, ConciergeCasePatch conciergeCasePatch) async
    test('test patchConciergeCase', () async {
      // TODO
    });

  });
}
