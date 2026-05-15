import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

/// tests for AdminApi
void main() {
  final instance = GpsMedicalApi().getAdminApi();

  group(AdminApi, () {
    // Journal d'audit
    //
    //Future<PaginatedAuditEntries> adminAuditLogGet({ String actorId, String action, DateTime from, DateTime to, int page, int pageSize }) async
    test('test adminAuditLogGet', () async {
      // TODO
    });

    // Validation d'un dossier médecin
    //
    //Future<DoctorPrivate> adminDoctorsDoctorIdVerifyPost(String doctorId, AdminDoctorsDoctorIdVerifyPostRequest adminDoctorsDoctorIdVerifyPostRequest) async
    test('test adminDoctorsDoctorIdVerifyPost', () async {
      // TODO
    });

    // Médecins en attente de vérification
    //
    //Future<PaginatedDoctorsPrivate> adminDoctorsPendingGet({ int page, int pageSize }) async
    test('test adminDoctorsPendingGet', () async {
      // TODO
    });

    // Export ANPDP — historique complet des consentements (Phase 1)
    //
    // Réservé aux administrateurs. Retourne l'historique brut des lignes `consent_grants` pour audit et conformité. Implémentation complète des exports signés / filtres en Phase 4.
    //
    //Future<BuiltList<ConsentGrant>> adminExportUserConsents(String userId) async
    test('test adminExportUserConsents', () async {
      // TODO
    });

    // File de modération des avis signalés
    //
    //Future<PaginatedReviews> adminReviewsQueueGet({ int page, int pageSize }) async
    test('test adminReviewsQueueGet', () async {
      // TODO
    });

    // Décision de modération
    //
    //Future<Review> adminReviewsReviewIdModeratePost(String reviewId, AdminReviewsReviewIdModeratePostRequest adminReviewsReviewIdModeratePostRequest) async
    test('test adminReviewsReviewIdModeratePost', () async {
      // TODO
    });

    // Création d'une spécialité (référentiel)
    //
    //Future<Specialty> adminSpecialtiesPost(SpecialtyCreate specialtyCreate) async
    test('test adminSpecialtiesPost', () async {
      // TODO
    });

    // Détail d'un utilisateur (vue admin)
    //
    //Future<UserAdmin> adminUsersUserIdGet(String userId) async
    test('test adminUsersUserIdGet', () async {
      // TODO
    });

    // Suspension / réactivation / changement de rôle
    //
    //Future<UserAdmin> adminUsersUserIdPatch(String userId, UserAdminUpdate userAdminUpdate) async
    test('test adminUsersUserIdPatch', () async {
      // TODO
    });
  });
}
