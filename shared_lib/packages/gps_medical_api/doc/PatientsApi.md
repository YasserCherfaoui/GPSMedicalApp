# gps_medical_api.api.PatientsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**patientsMeDelete**](PatientsApi.md#patientsmedelete) | **DELETE** /patients/me | Suppression du compte patient (RGPD — droit à l&#39;effacement)
[**patientsMeDependentsDependentIdDelete**](PatientsApi.md#patientsmedependentsdependentiddelete) | **DELETE** /patients/me/dependents/{dependentId} | Suppression d&#39;un ayant droit
[**patientsMeDependentsDependentIdPatch**](PatientsApi.md#patientsmedependentsdependentidpatch) | **PATCH** /patients/me/dependents/{dependentId} | Modification d&#39;un ayant droit
[**patientsMeDependentsGet**](PatientsApi.md#patientsmedependentsget) | **GET** /patients/me/dependents | Liste des ayants droit (enfants, conjoint…)
[**patientsMeDependentsPost**](PatientsApi.md#patientsmedependentspost) | **POST** /patients/me/dependents | Ajout d&#39;un ayant droit
[**patientsMeGet**](PatientsApi.md#patientsmeget) | **GET** /patients/me | Profil du patient connecté
[**patientsMePatch**](PatientsApi.md#patientsmepatch) | **PATCH** /patients/me | Mise à jour partielle du profil patient


# **patientsMeDelete**
> patientsMeDelete()

Suppression du compte patient (RGPD — droit à l'effacement)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPatientsApi();

try {
    api.patientsMeDelete();
} on DioException catch (e) {
    print('Exception when calling PatientsApi->patientsMeDelete: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patientsMeDependentsDependentIdDelete**
> patientsMeDependentsDependentIdDelete(dependentId)

Suppression d'un ayant droit

Suppression logique (`deleted_at`). Les rendez-vous existants conservent `dependent_id`.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPatientsApi();
final String dependentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.patientsMeDependentsDependentIdDelete(dependentId);
} on DioException catch (e) {
    print('Exception when calling PatientsApi->patientsMeDependentsDependentIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dependentId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patientsMeDependentsDependentIdPatch**
> Dependent patientsMeDependentsDependentIdPatch(dependentId, dependentCreate)

Modification d'un ayant droit

Mise à jour partielle : seuls les champs présents dans le corps sont modifiés. Les champs absents restent inchangés (le schéma `DependentCreate` sert de modèle, pas de remplacement complet). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPatientsApi();
final String dependentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final DependentCreate dependentCreate = ; // DependentCreate | 

try {
    final response = api.patientsMeDependentsDependentIdPatch(dependentId, dependentCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PatientsApi->patientsMeDependentsDependentIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dependentId** | **String**|  | 
 **dependentCreate** | [**DependentCreate**](DependentCreate.md)|  | 

### Return type

[**Dependent**](Dependent.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patientsMeDependentsGet**
> BuiltList<Dependent> patientsMeDependentsGet()

Liste des ayants droit (enfants, conjoint…)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPatientsApi();

try {
    final response = api.patientsMeDependentsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling PatientsApi->patientsMeDependentsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Dependent&gt;**](Dependent.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patientsMeDependentsPost**
> Dependent patientsMeDependentsPost(dependentCreate)

Ajout d'un ayant droit

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPatientsApi();
final DependentCreate dependentCreate = ; // DependentCreate | 

try {
    final response = api.patientsMeDependentsPost(dependentCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PatientsApi->patientsMeDependentsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dependentCreate** | [**DependentCreate**](DependentCreate.md)|  | 

### Return type

[**Dependent**](Dependent.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patientsMeGet**
> Patient patientsMeGet()

Profil du patient connecté

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPatientsApi();

try {
    final response = api.patientsMeGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling PatientsApi->patientsMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Patient**](Patient.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patientsMePatch**
> Patient patientsMePatch(patientUpdate)

Mise à jour partielle du profil patient

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPatientsApi();
final PatientUpdate patientUpdate = ; // PatientUpdate | 

try {
    final response = api.patientsMePatch(patientUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PatientsApi->patientsMePatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **patientUpdate** | [**PatientUpdate**](PatientUpdate.md)|  | 

### Return type

[**Patient**](Patient.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

