import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for DoctorsApi
void main() {
  final instance = GpsMedicalApi().getDoctorsApi();

  group(DoctorsApi, () {
    // Accepter une invitation
    //
    // invited -> active. Autre etat -> 409.
    //
    //Future<ClinicMembership> acceptClinicMembership(String membershipId) async
    test('test acceptClinicMembership', () async {
      // TODO
    });

    // Fiche publique d'un médecin
    //
    // **404** si le médecin n'est pas `verified=true` (dossiers `approved_pending_activation` inclus — pas de fuite d'offre en quarantaine). Voir addendum-1.1.1.md. 
    //
    //Future<Doctor> doctorsDoctorIdGet(String doctorId) async
    test('test doctorsDoctorIdGet', () async {
      // TODO
    });

    // Liste publique des médecins (annuaire)
    //
    // Par défaut `verified_only=true` : seuls les médecins `verified=true` (donc **pas** `approved_pending_activation`) apparaissent. Voir addendum-1.1.1.md (invariant découverte). 
    //
    //Future<PaginatedDoctors> doctorsGet({ int page, int pageSize, bool verifiedOnly }) async
    test('test doctorsGet', () async {
      // TODO
    });

    // Téléversement d'un diplôme ou justificatif (PDF/image)
    //
    // `multipart/form-data` : champs `file` et `type`. Fichier maximal **10 Mo** ; enveloppe multipart serveur **15 Mo**. PDF, JPEG ou PNG uniquement ; le contenu est contrôlé par magic bytes. 
    //
    //Future<Credential> doctorsMeCredentialsPost(MultipartFile file, String type, { int issuedYear }) async
    test('test doctorsMeCredentialsPost', () async {
      // TODO
    });

    // Profil du médecin connecté (vue privée)
    //
    //Future<DoctorPrivate> doctorsMeGet() async
    test('test doctorsMeGet', () async {
      // TODO
    });

    // Mise à jour du profil médecin
    //
    //Future<DoctorPrivate> doctorsMePatch(DoctorUpdate doctorUpdate) async
    test('test doctorsMePatch', () async {
      // TODO
    });

    // Aperçu du justificatif déchiffré (lien signé)
    //
    // Diffuse le fichier en clair après vérification du jeton HMAC (`exp`, `token`) émis dans `Credential.file_url` à la création ou via un flux équivalent. Accès sans en-tête `Authorization` : le secret est porté par la query. Le fichier est servi avec `Content-Disposition: inline` pour affichage dans l'onglet du navigateur (PDF, JPEG, PNG). 
    //
    //Future<Uint8List> getDoctorCredentialFile(String credentialId, int exp, String token) async
    test('test getDoctorCredentialFile', () async {
      // TODO
    });

    // Affiliations cliniques du spécialiste
    //
    //Future<BuiltList<ClinicMembership>> listDoctorMemberships() async
    test('test listDoctorMemberships', () async {
      // TODO
    });

    // Basculer la visibilité sur le profil public
    //
    //Future<ClinicMembership> patchDoctorMembership(String membershipId, PatchDoctorMembershipRequest patchDoctorMembershipRequest) async
    test('test patchDoctorMembership', () async {
      // TODO
    });

    // Refuser une invitation
    //
    // invited -> refused. Autre etat -> 409.
    //
    //Future<ClinicMembership> refuseClinicMembership(String membershipId) async
    test('test refuseClinicMembership', () async {
      // TODO
    });

    // Demander un détachement
    //
    // active -> detach_requested. Pas de detachement unilateral.
    //
    //Future<ClinicMembership> requestClinicDetach(String membershipId) async
    test('test requestClinicDetach', () async {
      // TODO
    });

    // Référentiel des spécialités médicales
    //
    //Future<BuiltList<Specialty>> specialtiesGet() async
    test('test specialtiesGet', () async {
      // TODO
    });

  });
}
