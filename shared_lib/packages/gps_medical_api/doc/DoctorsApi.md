# gps_medical_api.api.DoctorsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**doctorsDoctorIdGet**](DoctorsApi.md#doctorsdoctoridget) | **GET** /doctors/{doctorId} | Fiche publique d&#39;un médecin
[**doctorsGet**](DoctorsApi.md#doctorsget) | **GET** /doctors | Liste publique des médecins (annuaire)
[**doctorsMeCredentialsPost**](DoctorsApi.md#doctorsmecredentialspost) | **POST** /doctors/me/credentials | Téléversement d&#39;un diplôme ou justificatif (PDF/image)
[**doctorsMeGet**](DoctorsApi.md#doctorsmeget) | **GET** /doctors/me | Profil du médecin connecté (vue privée)
[**doctorsMePatch**](DoctorsApi.md#doctorsmepatch) | **PATCH** /doctors/me | Mise à jour du profil médecin
[**getDoctorCredentialFile**](DoctorsApi.md#getdoctorcredentialfile) | **GET** /doctors/me/credentials/{credentialId}/file | Téléchargement du justificatif déchiffré (lien signé)
[**specialtiesGet**](DoctorsApi.md#specialtiesget) | **GET** /specialties | Référentiel des spécialités médicales


# **doctorsDoctorIdGet**
> Doctor doctorsDoctorIdGet(doctorId)

Fiche publique d'un médecin

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

`multipart/form-data` : champs `file` et `type`. Taille maximale **10 Mo**. PDF, JPEG ou PNG uniquement ; le contenu est contrôlé par magic bytes. 

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

Téléchargement du justificatif déchiffré (lien signé)

Diffuse le fichier en clair après vérification du jeton HMAC (`exp`, `token`) émis dans `Credential.file_url` à la création ou via un flux équivalent. Accès sans en-tête `Authorization` : le secret est porté par la query. 

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

