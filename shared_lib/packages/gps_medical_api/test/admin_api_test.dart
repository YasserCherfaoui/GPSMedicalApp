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

    // Provisionner un compte concierge
    //
    // Crée un utilisateur `role=concierge` actif (sans OTP public). Chaque création écrit une ligne d'audit. 
    //
    //Future<ConciergeAccount> adminCreateConciergeAccount(ConciergeAccountCreate conciergeAccountCreate) async
    test('test adminCreateConciergeAccount', () async {
      // TODO
    });

    // Export ANPDP bulk (job async)
    //
    // Crée un job asynchrone qui agrège les consentements filtrés (multi-utilisateur) et produit un bundle signé téléchargeable via `GET .../download`. 
    //
    //Future<ConsentExportJob> adminCreateConsentExportJob(ConsentBulkExportRequest consentBulkExportRequest) async
    test('test adminCreateConsentExportJob', () async {
      // TODO
    });

    // Soft-delete
    //
    //Future adminDeleteClinic(String clinicId) async
    test('test adminDeleteClinic', () async {
      // TODO
    });

    // Télécharger le bundle signé d'un job terminé
    //
    //Future<ConsentExportBundle> adminDownloadConsentExportJob(String jobId) async
    test('test adminDownloadConsentExportJob', () async {
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

    // Export ANPDP signé et filtré (Phase 4)
    //
    // Retourne un bundle JSON signé (Ed25519 détachée) contenant uniquement les métadonnées `consent_grants` — jamais de PHI chiffrée côté client. Chaque export écrit une ligne d'audit avec le jeu de filtres. Voir `docs/compliance/consent-export-verification.md`. 
    //
    //Future<ConsentExportBundle> adminExportUserConsentsSigned(String userId, { DateTime from, DateTime to, String purpose }) async
    test('test adminExportUserConsentsSigned', () async {
      // TODO
    });

    // Détail admin d'une clinique
    //
    // Inclut membres actifs du roster, résumé des blocs donnés, capacité vs couverture, et avis de sous-effectif (additif Phase 4). 
    //
    //Future<ClinicAdminDetail> adminGetClinic(String clinicId) async
    test('test adminGetClinic', () async {
      // TODO
    });

    // Statut d'un job d'export bulk
    //
    //Future<ConsentExportJob> adminGetConsentExportJob(String jobId) async
    test('test adminGetConsentExportJob', () async {
      // TODO
    });

    // Liste admin des cliniques
    //
    //Future<PaginatedClinicsPrivate> adminListClinics({ int page, int pageSize, String q, ClinicStatus status, ClinicVerificationStatus verificationStatus, String countryCode, bool verified, String wilayaCode, bool underStaffed }) async
    test('test adminListClinics', () async {
      // TODO
    });

    // Liste des comptes concierge
    //
    //Future<PaginatedConciergeAccounts> adminListConciergeAccounts({ int page, int pageSize, String q }) async
    test('test adminListConciergeAccounts', () async {
      // TODO
    });

    // File ops — tous les dossiers concierge
    //
    //Future<PaginatedConciergeCases> adminListConciergeCases({ int page, int pageSize, ConciergeCaseStatus status, String conciergeUserId }) async
    test('test adminListConciergeCases', () async {
      // TODO
    });

    // File de vérification clinique
    //
    // Dossiers `pending` et `in_review` uniquement.
    //
    //Future<PaginatedClinicsPrivate> adminListPendingClinics({ int page, int pageSize, String q, String countryCode }) async
    test('test adminListPendingClinics', () async {
      // TODO
    });

    // Médecins en attente de vérification
    //
    // Dossiers `pending` et `in_review` uniquement. Les médecins en `approved_pending_activation` ont quitté cette file ; leur effectif est `AdminOverview.doctors_approved_pending_activation`. 
    //
    //Future<PaginatedDoctorsPrivate> adminListPendingDoctors({ int page, int pageSize, String q, CountryCode country }) async
    test('test adminListPendingDoctors', () async {
      // TODO
    });

    // Inventaire des spécialistes OSM non revendiqués
    //
    // Profils `verified=false` créés par le pipeline OSM (`SEEDED_NO_LOGIN`). Visibles admin uniquement — absents de la découverte patient. Attribution : © OpenStreetMap contributors (ODbL). 
    //
    //Future<PaginatedSeededSpecialists> adminListSeededSpecialists({ int page, int pageSize, String q, String wilayaCode, CountryCode country, SeededSpecialistClaimStatus claimStatus }) async
    test('test adminListSeededSpecialists', () async {
      // TODO
    });

    // Liste paginée des utilisateurs (vue admin)
    //
    // Réservé aux administrateurs (`admin` uniquement). Filtre par rôle, statut et pays (`country`) ; recherche texte (`q`) sur nom affiché et e-mail uniquement (pas de NIN/téléphone). Chaque appel est audité (`admin.users.list`). Voir addendum-week-10.md et addendum-1.1.0.md. 
    //
    //Future<PaginatedUserAdmin> adminListUsers({ String role, String status, CountryCode country, String q, int page, int pageSize }) async
    test('test adminListUsers', () async {
      // TODO
    });

    // Éditer / suspendre une clinique
    //
    //Future<ClinicPrivate> adminPatchClinic(String clinicId, ClinicAdminUpdate clinicAdminUpdate) async
    test('test adminPatchClinic', () async {
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

    // Envoyer une notification push de test (FCM)
    //
    // Réservé aux administrateurs (`admin`, audience `dashboard`). Envoie synchrone vers tous les devices FCM enregistrés de l'utilisateur cible (ignore quiet hours / `push_enabled`) et crée aussi une notification in-app. Utile pour valider le transport FCM depuis l'Espace développeur. `404` si aucun device n'est enregistré pour `user_id`. 
    //
    //Future<AdminTestPushResponse> adminTestPushNotification(AdminTestPushRequest adminTestPushRequest) async
    test('test adminTestPushNotification', () async {
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

    // Décision de vérification clinique
    //
    // `approved` + `country_code=DZ` → `verified=true`. `approved` + TN/UE → `approved_pending_activation` / `verified=false` (G-3). 
    //
    //Future<ClinicPrivate> adminVerifyClinic(String clinicId, VerifyClinicRequest verifyClinicRequest) async
    test('test adminVerifyClinic', () async {
      // TODO
    });

    // Validation d'un dossier médecin
    //
    // Décision `approved` : pour un médecin **DZ**, `verification_status=approved` et `verified=true`. Pour un médecin **TN**, tant que le flag serveur `TN_SPECIALIST_ACTIVATION` est **off** (défaut), le résultat est `approved_pending_activation` / `verified=false` ; une fois le flag **on**, même branche que DZ. `rejected` et `more_info` inchangés. Le corps 200 est le `DoctorPrivate` résultant (statut + `country`). Voir addendum-1.1.1.md. 
    //
    //Future<DoctorPrivate> adminVerifyDoctor(String doctorId, VerifyDoctorRequest verifyDoctorRequest) async
    test('test adminVerifyDoctor', () async {
      // TODO
    });

  });
}
