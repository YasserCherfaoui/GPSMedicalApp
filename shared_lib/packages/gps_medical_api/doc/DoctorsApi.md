# gps_medical_api.api.DoctorsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acceptClinicMembership**](DoctorsApi.md#acceptclinicmembership) | **POST** /doctors/me/memberships/{membershipId}/accept | Accepter une invitation
[**doctorsDoctorIdGet**](DoctorsApi.md#doctorsdoctoridget) | **GET** /doctors/{doctorId} | Fiche publique d&#39;un médecin
[**doctorsGet**](DoctorsApi.md#doctorsget) | **GET** /doctors | Liste publique des médecins (annuaire)
[**doctorsMeCredentialsPost**](DoctorsApi.md#doctorsmecredentialspost) | **POST** /doctors/me/credentials | Téléversement d&#39;un diplôme ou justificatif (PDF/image)
[**doctorsMeGet**](DoctorsApi.md#doctorsmeget) | **GET** /doctors/me | Profil du médecin connecté (vue privée)
[**doctorsMePatch**](DoctorsApi.md#doctorsmepatch) | **PATCH** /doctors/me | Mise à jour du profil médecin
[**getDoctorCredentialFile**](DoctorsApi.md#getdoctorcredentialfile) | **GET** /doctors/me/credentials/{credentialId}/file | Aperçu du justificatif déchiffré (lien signé)
[**listDoctorMemberships**](DoctorsApi.md#listdoctormemberships) | **GET** /doctors/me/memberships | Affiliations cliniques du spécialiste
[**patchDoctorMembership**](DoctorsApi.md#patchdoctormembership) | **PATCH** /doctors/me/memberships/{membershipId} | Basculer la visibilité sur le profil public
[**refuseClinicMembership**](DoctorsApi.md#refuseclinicmembership) | **POST** /doctors/me/memberships/{membershipId}/refuse | Refuser une invitation
[**requestClinicDetach**](DoctorsApi.md#requestclinicdetach) | **POST** /doctors/me/memberships/{membershipId}/request-detach | Demander un détachement
[**specialtiesGet**](DoctorsApi.md#specialtiesget) | **GET** /specialties | Référentiel des spécialités médicales


# **acceptClinicMembership**
> ClinicMembership acceptClinicMembership(membershipId)

Accepter une invitation

invited -> active. Autre etat -> 409.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();
final String membershipId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.acceptClinicMembership(membershipId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->acceptClinicMembership: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **membershipId** | **String**|  | 

### Return type

[**ClinicMembership**](ClinicMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsDoctorIdGet**
> Doctor doctorsDoctorIdGet(doctorId)

Fiche publique d'un médecin

**404** si le médecin n'est pas `verified=true` (dossiers `approved_pending_activation` inclus — pas de fuite d'offre en quarantaine). Voir addendum-1.1.1.md. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();
final String doctorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.doctorsDoctorIdGet(doctorId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->doctorsDoctorIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **doctorId** | **String**|  | 

### Return type

[**Doctor**](Doctor.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsGet**
> PaginatedDoctors doctorsGet(page, pageSize, verifiedOnly)

Liste publique des médecins (annuaire)

Par défaut `verified_only=true` : seuls les médecins `verified=true` (donc **pas** `approved_pending_activation`) apparaissent. Voir addendum-1.1.1.md (invariant découverte). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final bool verifiedOnly = true; // bool | 

try {
    final response = api.doctorsGet(page, pageSize, verifiedOnly);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->doctorsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]
 **verifiedOnly** | **bool**|  | [optional] [default to true]

### Return type

[**PaginatedDoctors**](PaginatedDoctors.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsMeCredentialsPost**
> Credential doctorsMeCredentialsPost(file, type, issuedYear)

Téléversement d'un diplôme ou justificatif (PDF/image)

`multipart/form-data` : champs `file` et `type`. Fichier maximal **10 Mo** ; enveloppe multipart serveur **15 Mo**. PDF, JPEG ou PNG uniquement ; le contenu est contrôlé par magic bytes. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 
final String type = type_example; // String | 
final int issuedYear = 56; // int | 

try {
    final response = api.doctorsMeCredentialsPost(file, type, issuedYear);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->doctorsMeCredentialsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **MultipartFile**|  | 
 **type** | **String**|  | 
 **issuedYear** | **int**|  | [optional] 

### Return type

[**Credential**](Credential.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsMeGet**
> DoctorPrivate doctorsMeGet()

Profil du médecin connecté (vue privée)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();

try {
    final response = api.doctorsMeGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->doctorsMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DoctorPrivate**](DoctorPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsMePatch**
> DoctorPrivate doctorsMePatch(doctorUpdate)

Mise à jour du profil médecin

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();
final DoctorUpdate doctorUpdate = ; // DoctorUpdate | 

try {
    final response = api.doctorsMePatch(doctorUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->doctorsMePatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **doctorUpdate** | [**DoctorUpdate**](DoctorUpdate.md)|  | 

### Return type

[**DoctorPrivate**](DoctorPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDoctorCredentialFile**
> Uint8List getDoctorCredentialFile(credentialId, exp, token)

Aperçu du justificatif déchiffré (lien signé)

Diffuse le fichier en clair après vérification du jeton HMAC (`exp`, `token`) émis dans `Credential.file_url` à la création ou via un flux équivalent. Accès sans en-tête `Authorization` : le secret est porté par la query. Le fichier est servi avec `Content-Disposition: inline` pour affichage dans l'onglet du navigateur (PDF, JPEG, PNG). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();
final String credentialId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int exp = 789; // int | 
final String token = token_example; // String | 

try {
    final response = api.getDoctorCredentialFile(credentialId, exp, token);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->getDoctorCredentialFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credentialId** | **String**|  | 
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

# **listDoctorMemberships**
> BuiltList<ClinicMembership> listDoctorMemberships()

Affiliations cliniques du spécialiste

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();

try {
    final response = api.listDoctorMemberships();
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->listDoctorMemberships: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ClinicMembership&gt;**](ClinicMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchDoctorMembership**
> ClinicMembership patchDoctorMembership(membershipId, patchDoctorMembershipRequest)

Basculer la visibilité sur le profil public

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();
final String membershipId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final PatchDoctorMembershipRequest patchDoctorMembershipRequest = ; // PatchDoctorMembershipRequest | 

try {
    final response = api.patchDoctorMembership(membershipId, patchDoctorMembershipRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->patchDoctorMembership: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **membershipId** | **String**|  | 
 **patchDoctorMembershipRequest** | [**PatchDoctorMembershipRequest**](PatchDoctorMembershipRequest.md)|  | 

### Return type

[**ClinicMembership**](ClinicMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refuseClinicMembership**
> ClinicMembership refuseClinicMembership(membershipId)

Refuser une invitation

invited -> refused. Autre etat -> 409.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();
final String membershipId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.refuseClinicMembership(membershipId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->refuseClinicMembership: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **membershipId** | **String**|  | 

### Return type

[**ClinicMembership**](ClinicMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **requestClinicDetach**
> ClinicMembership requestClinicDetach(membershipId)

Demander un détachement

active -> detach_requested. Pas de detachement unilateral.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();
final String membershipId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.requestClinicDetach(membershipId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->requestClinicDetach: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **membershipId** | **String**|  | 

### Return type

[**ClinicMembership**](ClinicMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **specialtiesGet**
> BuiltList<Specialty> specialtiesGet()

Référentiel des spécialités médicales

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getDoctorsApi();

try {
    final response = api.specialtiesGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling DoctorsApi->specialtiesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Specialty&gt;**](Specialty.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

