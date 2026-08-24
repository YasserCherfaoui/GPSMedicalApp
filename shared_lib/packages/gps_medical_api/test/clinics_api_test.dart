import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for ClinicsApi
void main() {
  final instance = GpsMedicalApi().getClinicsApi();

  group(ClinicsApi, () {
    // Ajouter un clinic_admin
    //
    // Réservé au `clinic_owner`. Passe le rôle du user cible à `clinic_admin`.
    //
    //Future<ClinicStaffMember> addClinicStaff(ClinicStaffCreate clinicStaffCreate) async
    test('test addClinicStaff', () async {
      // TODO
    });

    // Approuver un détachement demandé par le spécialiste
    //
    // detach_requested -> detached. Autre etat -> 409.
    //
    //Future<ClinicMembership> approveClinicDetach(String membershipId) async
    test('test approveClinicDetach', () async {
      // TODO
    });

    // Auto-enregistrement d'une clinique
    //
    // Crée une clinique `verification_status=pending`, `verified=false`. Accorde `clinic_owner` à l'utilisateur authentifié s'il ne l'est pas déjà. Un utilisateur ne peut posséder qu'une clinique (409 sinon). 
    //
    //Future<ClinicPrivate> createClinic(ClinicCreate clinicCreate) async
    test('test createClinic', () async {
      // TODO
    });

    // Créer un service
    //
    // Runtime 3.6 — `currency` autre que `DZD` → `422 currency_not_supported`.
    //
    //Future<ClinicService> createClinicService(ClinicServiceCreate clinicServiceCreate) async
    test('test createClinicService', () async {
      // TODO
    });

    // Désactiver un service (soft)
    //
    // Hard-delete interdit s'il existe des sessions futures. Sinon `active=false` (soft-deactivation). `409` si des RDV futurs existent et que le client exige une suppression définitive. 
    //
    //Future deleteClinicService(String serviceId) async
    test('test deleteClinicService', () async {
      // TODO
    });

    // Profil public d'une clinique
    //
    // 404 si non vérifiée / suspendue (pas de fuite de dossier).
    //
    //Future<Clinic> getClinic(String clinicId) async
    test('test getClinic', () async {
      // TODO
    });

    // URL signée du justificatif
    //
    //Future<Uint8List> getClinicCredentialFile(String credentialId, String token) async
    test('test getClinicCredentialFile', () async {
      // TODO
    });

    // Profil privé de la clinique de l'utilisateur courant
    //
    // clinic_owner ou clinic_admin rattache.
    //
    //Future<ClinicPrivate> getClinicMe() async
    test('test getClinicMe', () async {
      // TODO
    });

    // Inviter un spécialiste
    //
    // Transition → `invited`. Idempotent si déjà `invited`.
    //
    //Future<ClinicMembership> inviteClinicMembership(InviteClinicMembershipRequest inviteClinicMembershipRequest) async
    test('test inviteClinicMembership', () async {
      // TODO
    });

    // Catalogue de services (privé)
    //
    //Future<BuiltList<ClinicService>> listClinicMeServices() async
    test('test listClinicMeServices', () async {
      // TODO
    });

    // Roster (invitations, actifs, détachements)
    //
    //Future<BuiltList<ClinicMembership>> listClinicMemberships({ ClinicMembershipStatus status }) async
    test('test listClinicMemberships', () async {
      // TODO
    });

    // Services publics actifs
    //
    //Future<BuiltList<ClinicService>> listClinicServices(String clinicId) async
    test('test listClinicServices', () async {
      // TODO
    });

    // Administrateurs de la clinique
    //
    //Future<BuiltList<ClinicStaffMember>> listClinicStaff() async
    test('test listClinicStaff', () async {
      // TODO
    });

    // Spécialistes visibles sur le profil clinique
    //
    // Uniquement memberships `active` avec `visible_on_profile=true`.
    //
    //Future<BuiltList<ClinicSpecialistTeaser>> listClinicVisibleSpecialists(String clinicId) async
    test('test listClinicVisibleSpecialists', () async {
      // TODO
    });

    // Liste publique des cliniques vérifiées
    //
    // Uniquement `verified=true` et `status != suspended`, `deleted_at IS NULL`. Les cliniques non vérifiées (y compris G-3 quarantined) sont absentes. 
    //
    //Future<PaginatedClinics> listClinics({ int page, int pageSize, String wilayaCode, String q }) async
    test('test listClinics', () async {
      // TODO
    });

    // Mise à jour du profil clinique
    //
    //Future<ClinicPrivate> patchClinicMe(ClinicUpdate clinicUpdate) async
    test('test patchClinicMe', () async {
      // TODO
    });

    // Mettre à jour un service
    //
    //Future<ClinicService> patchClinicService(String serviceId, ClinicServiceUpdate clinicServiceUpdate) async
    test('test patchClinicService', () async {
      // TODO
    });

    // Dépôt d'un justificatif (registre, agrément)
    //
    // Multipart, même adaptateur de stockage et URL signée que les diplômes médecin.
    //
    //Future<ClinicCredential> postClinicCredential(MultipartFile file, String type, { int issuedYear }) async
    test('test postClinicCredential', () async {
      // TODO
    });

  });
}
