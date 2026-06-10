# gps_medical_api.api.MedicalRecordsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMedicalDocumentFile**](MedicalRecordsApi.md#getmedicaldocumentfile) | **GET** /medical-records/{documentId}/file | Téléchargement du document déchiffré (lien signé)
[**medicalRecordsDocumentIdDelete**](MedicalRecordsApi.md#medicalrecordsdocumentiddelete) | **DELETE** /medical-records/{documentId} | Suppression d&#39;un document (auteur uniquement)
[**medicalRecordsDocumentIdDownloadGet**](MedicalRecordsApi.md#medicalrecordsdocumentiddownloadget) | **GET** /medical-records/{documentId}/download | URL signée de téléchargement (expire 5 min)
[**medicalRecordsDocumentIdGet**](MedicalRecordsApi.md#medicalrecordsdocumentidget) | **GET** /medical-records/{documentId} | Métadonnées d&#39;un document
[**medicalRecordsGet**](MedicalRecordsApi.md#medicalrecordsget) | **GET** /medical-records | Documents accessibles à l&#39;utilisateur (patient ou médecin)
[**medicalRecordsPost**](MedicalRecordsApi.md#medicalrecordspost) | **POST** /medical-records | Téléversement d&#39;un document (médecin ou patient)
[**prescriptionsPost**](MedicalRecordsApi.md#prescriptionspost) | **POST** /prescriptions | Création d&#39;une ordonnance numérique structurée


# **getMedicalDocumentFile**
> Uint8List getMedicalDocumentFile(documentId, exp, token)

Téléchargement du document déchiffré (lien signé)

Diffuse le fichier en clair après vérification du jeton HMAC (`exp`, `token`) renvoyé dans l'URL de `GET /medical-records/{documentId}/download`. L'objet stocké reste en ciphertext (ADR 0006). Accès journalisé (`medical_record.download`). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMedicalRecordsApi();
final String documentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int exp = 789; // int | 
final String token = token_example; // String | 

try {
    final response = api.getMedicalDocumentFile(documentId, exp, token);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MedicalRecordsApi->getMedicalDocumentFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **documentId** | **String**|  | 
 **exp** | **int**|  | 
 **token** | **String**|  | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **medicalRecordsDocumentIdDelete**
> medicalRecordsDocumentIdDelete(documentId)

Suppression d'un document (auteur uniquement)

Suppression logique (`deleted_at`). Seul `author_id` (JWT `sub`) peut supprimer. Le blob chiffré est supprimé du stockage objet en arrière-plan (retries). Journalisation `medical_record.delete` puis `medical_record.blob_purged`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMedicalRecordsApi();
final String documentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.medicalRecordsDocumentIdDelete(documentId);
} on DioException catch (e) {
    print('Exception when calling MedicalRecordsApi->medicalRecordsDocumentIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **documentId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **medicalRecordsDocumentIdDownloadGet**
> MedicalRecordsDocumentIdDownloadGet200Response medicalRecordsDocumentIdDownloadGet(documentId)

URL signée de téléchargement (expire 5 min)

Renvoie une URL API signée (TTL 5 minutes, query `exp` + `token`) vers `GET /v1/medical-records/{documentId}/file`, qui diffuse le fichier déchiffré. L'objet dans le stockage reste en ciphertext (ADR 0006). Accès réservé au patient propriétaire ou à un médecin ayant un parrainage (`referrals`) avec ce patient. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMedicalRecordsApi();
final String documentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.medicalRecordsDocumentIdDownloadGet(documentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MedicalRecordsApi->medicalRecordsDocumentIdDownloadGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **documentId** | **String**|  | 

### Return type

[**MedicalRecordsDocumentIdDownloadGet200Response**](MedicalRecordsDocumentIdDownloadGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **medicalRecordsDocumentIdGet**
> MedicalDocument medicalRecordsDocumentIdGet(documentId)

Métadonnées d'un document

Même projection que la liste, sans `storage_key` ni champs de chiffrement. RBAC identique à `GET /medical-records` ; `404` si absent ou supprimé. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMedicalRecordsApi();
final String documentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.medicalRecordsDocumentIdGet(documentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MedicalRecordsApi->medicalRecordsDocumentIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **documentId** | **String**|  | 

### Return type

[**MedicalDocument**](MedicalDocument.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **medicalRecordsGet**
> PaginatedMedicalDocuments medicalRecordsGet(patientId, type, page, pageSize)

Documents accessibles à l'utilisateur (patient ou médecin)

Métadonnées uniquement (pas de fichier). Pagination `page` (défaut 1), `page_size` (défaut 20, max 100). Sans `patient_id` : dossier du patient connecté ou uploads du médecin (auteur). Avec `patient_id` : patient (soi-même), médecin (parrainage), admin (tout patient). Documents supprimés (`deleted_at`) exclus. Tri `created_at DESC`, `id DESC`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMedicalRecordsApi();
final String patientId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Réservé aux médecins ayant traité ce patient
final String type = type_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.medicalRecordsGet(patientId, type, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MedicalRecordsApi->medicalRecordsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **patientId** | **String**| Réservé aux médecins ayant traité ce patient | [optional] 
 **type** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedMedicalDocuments**](PaginatedMedicalDocuments.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **medicalRecordsPost**
> MedicalDocument medicalRecordsPost(file, type, appointmentId, patientId, title, notes)

Téléversement d'un document (médecin ou patient)

`multipart/form-data` avec champ fichier `file` (PDF, JPEG ou PNG). Fichier maximal **20 Mo** ; enveloppe multipart serveur **25 Mo** (métadonnées incluses). Le type MIME réel est vérifié (magic bytes) en plus du `Content-Type` déclaré. Ciphertext stocké sous `{patient_id}/{document_id}.enc` (ADR 0006). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMedicalRecordsApi();
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 
final String type = type_example; // String | 
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String patientId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String title = title_example; // String | 
final String notes = notes_example; // String | 

try {
    final response = api.medicalRecordsPost(file, type, appointmentId, patientId, title, notes);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MedicalRecordsApi->medicalRecordsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **MultipartFile**|  | 
 **type** | **String**|  | 
 **appointmentId** | **String**|  | [optional] 
 **patientId** | **String**|  | [optional] 
 **title** | **String**|  | [optional] 
 **notes** | **String**|  | [optional] 

### Return type

[**MedicalDocument**](MedicalDocument.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **prescriptionsPost**
> Prescription prescriptionsPost(prescriptionCreate)

Création d'une ordonnance numérique structurée

Réservé aux **médecins** (JWT specialist) pour un rendez-vous dont ils sont le praticien. Génère un PDF (gofpdf, corps en français, libellés d'en-tête FR/AR), le chiffre et le stocke comme `medical.documents` (`type=prescription`), puis crée une ligne `medical.prescriptions` avec `pdf_document_id`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMedicalRecordsApi();
final PrescriptionCreate prescriptionCreate = ; // PrescriptionCreate | 

try {
    final response = api.prescriptionsPost(prescriptionCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MedicalRecordsApi->prescriptionsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prescriptionCreate** | [**PrescriptionCreate**](PrescriptionCreate.md)|  | 

### Return type

[**Prescription**](Prescription.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

