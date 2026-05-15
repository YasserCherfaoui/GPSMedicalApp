import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

/// tests for MedicalRecordsApi
void main() {
  final instance = GpsMedicalApi().getMedicalRecordsApi();

  group(MedicalRecordsApi, () {
    // Téléchargement du document déchiffré (lien signé)
    //
    // Diffuse le fichier en clair après vérification du jeton HMAC (`exp`, `token`) renvoyé dans l'URL de `GET /medical-records/{documentId}/download`. L'objet stocké reste en ciphertext (ADR 0006).
    //
    //Future<Uint8List> getMedicalDocumentFile(String documentId, int exp, String token) async
    test('test getMedicalDocumentFile', () async {
      // TODO
    });

    // Suppression d'un document (auteur uniquement)
    //
    //Future medicalRecordsDocumentIdDelete(String documentId) async
    test('test medicalRecordsDocumentIdDelete', () async {
      // TODO
    });

    // URL signée de téléchargement (expire 5 min)
    //
    // Renvoie une URL API signée (TTL 5 minutes, query `exp` + `token`) vers `GET /v1/medical-records/{documentId}/file`, qui diffuse le fichier déchiffré. L'objet dans le stockage reste en ciphertext (ADR 0006). Accès réservé au patient propriétaire ou à un médecin ayant un parrainage (`referrals`) avec ce patient.
    //
    //Future<MedicalRecordsDocumentIdDownloadGet200Response> medicalRecordsDocumentIdDownloadGet(String documentId) async
    test('test medicalRecordsDocumentIdDownloadGet', () async {
      // TODO
    });

    // Métadonnées d'un document
    //
    //Future<MedicalDocument> medicalRecordsDocumentIdGet(String documentId) async
    test('test medicalRecordsDocumentIdGet', () async {
      // TODO
    });

    // Documents accessibles à l'utilisateur (patient ou médecin)
    //
    //Future<PaginatedMedicalDocuments> medicalRecordsGet({ String patientId, String type, int page, int pageSize }) async
    test('test medicalRecordsGet', () async {
      // TODO
    });

    // Téléversement d'un document (médecin ou patient)
    //
    // `multipart/form-data` avec champ fichier `file` (PDF, JPEG ou PNG). Taille maximale **20 Mo** pour les patients et médecins autorisés. Le type MIME réel est vérifié (magic bytes) en plus du `Content-Type` déclaré.
    //
    //Future<MedicalDocument> medicalRecordsPost(MultipartFile file, String type, { String appointmentId, String patientId, String title, String notes }) async
    test('test medicalRecordsPost', () async {
      // TODO
    });

    // Création d'une ordonnance numérique structurée
    //
    //Future<Prescription> prescriptionsPost(PrescriptionCreate prescriptionCreate) async
    test('test prescriptionsPost', () async {
      // TODO
    });
  });
}
