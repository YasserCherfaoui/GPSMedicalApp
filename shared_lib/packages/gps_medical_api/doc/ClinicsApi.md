# gps_medical_api.api.ClinicsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addClinicStaff**](ClinicsApi.md#addclinicstaff) | **POST** /clinics/me/staff | Ajouter un clinic_admin
[**approveClinicDetach**](ClinicsApi.md#approveclinicdetach) | **POST** /clinics/me/memberships/{membershipId}/approve-detach | Approuver un détachement demandé par le spécialiste
[**createClinic**](ClinicsApi.md#createclinic) | **POST** /clinics | Auto-enregistrement d&#39;une clinique
[**createClinicService**](ClinicsApi.md#createclinicservice) | **POST** /clinics/me/services | Créer un service
[**deleteClinicService**](ClinicsApi.md#deleteclinicservice) | **DELETE** /clinics/me/services/{serviceId} | Désactiver un service (soft)
[**getClinic**](ClinicsApi.md#getclinic) | **GET** /clinics/{clinicId} | Profil public d&#39;une clinique
[**getClinicCredentialFile**](ClinicsApi.md#getcliniccredentialfile) | **GET** /clinics/me/credentials/{credentialId}/file | URL signée du justificatif
[**getClinicMe**](ClinicsApi.md#getclinicme) | **GET** /clinics/me | Profil privé de la clinique de l&#39;utilisateur courant
[**inviteClinicMembership**](ClinicsApi.md#inviteclinicmembership) | **POST** /clinics/me/memberships | Inviter un spécialiste
[**listClinicMeServices**](ClinicsApi.md#listclinicmeservices) | **GET** /clinics/me/services | Catalogue de services (privé)
[**listClinicMemberships**](ClinicsApi.md#listclinicmemberships) | **GET** /clinics/me/memberships | Roster (invitations, actifs, détachements)
[**listClinicServices**](ClinicsApi.md#listclinicservices) | **GET** /clinics/{clinicId}/services | Services publics actifs
[**listClinicStaff**](ClinicsApi.md#listclinicstaff) | **GET** /clinics/me/staff | Administrateurs de la clinique
[**listClinicVisibleSpecialists**](ClinicsApi.md#listclinicvisiblespecialists) | **GET** /clinics/{clinicId}/specialists | Spécialistes visibles sur le profil clinique
[**listClinics**](ClinicsApi.md#listclinics) | **GET** /clinics | Liste publique des cliniques vérifiées
[**patchClinicMe**](ClinicsApi.md#patchclinicme) | **PATCH** /clinics/me | Mise à jour du profil clinique
[**patchClinicService**](ClinicsApi.md#patchclinicservice) | **PATCH** /clinics/me/services/{serviceId} | Mettre à jour un service
[**postClinicCredential**](ClinicsApi.md#postcliniccredential) | **POST** /clinics/me/credentials | Dépôt d&#39;un justificatif (registre, agrément)


# **addClinicStaff**
> ClinicStaffMember addClinicStaff(clinicStaffCreate)

Ajouter un clinic_admin

Réservé au `clinic_owner`. Passe le rôle du user cible à `clinic_admin`.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final ClinicStaffCreate clinicStaffCreate = ; // ClinicStaffCreate | 

try {
    final response = api.addClinicStaff(clinicStaffCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->addClinicStaff: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicStaffCreate** | [**ClinicStaffCreate**](ClinicStaffCreate.md)|  | 

### Return type

[**ClinicStaffMember**](ClinicStaffMember.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **approveClinicDetach**
> ClinicMembership approveClinicDetach(membershipId)

Approuver un détachement demandé par le spécialiste

detach_requested -> detached. Autre etat -> 409.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final String membershipId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.approveClinicDetach(membershipId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->approveClinicDetach: $e\n');
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

# **createClinic**
> ClinicPrivate createClinic(clinicCreate)

Auto-enregistrement d'une clinique

Crée une clinique `verification_status=pending`, `verified=false`. Accorde `clinic_owner` à l'utilisateur authentifié s'il ne l'est pas déjà. Un utilisateur ne peut posséder qu'une clinique (409 sinon). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final ClinicCreate clinicCreate = ; // ClinicCreate | 

try {
    final response = api.createClinic(clinicCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->createClinic: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicCreate** | [**ClinicCreate**](ClinicCreate.md)|  | 

### Return type

[**ClinicPrivate**](ClinicPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createClinicService**
> ClinicService createClinicService(clinicServiceCreate)

Créer un service

Runtime 3.6 — `currency` autre que `DZD` → `422 currency_not_supported`.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final ClinicServiceCreate clinicServiceCreate = ; // ClinicServiceCreate | 

try {
    final response = api.createClinicService(clinicServiceCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->createClinicService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicServiceCreate** | [**ClinicServiceCreate**](ClinicServiceCreate.md)|  | 

### Return type

[**ClinicService**](ClinicService.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteClinicService**
> deleteClinicService(serviceId)

Désactiver un service (soft)

Hard-delete interdit s'il existe des sessions futures. Sinon `active=false` (soft-deactivation). `409` si des RDV futurs existent et que le client exige une suppression définitive. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final String serviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.deleteClinicService(serviceId);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->deleteClinicService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getClinic**
> Clinic getClinic(clinicId)

Profil public d'une clinique

404 si non vérifiée / suspendue (pas de fuite de dossier).

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final String clinicId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getClinic(clinicId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->getClinic: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicId** | **String**|  | 

### Return type

[**Clinic**](Clinic.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getClinicCredentialFile**
> Uint8List getClinicCredentialFile(credentialId, token)

URL signée du justificatif

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final String credentialId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String token = token_example; // String | 

try {
    final response = api.getClinicCredentialFile(credentialId, token);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->getClinicCredentialFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **credentialId** | **String**|  | 
 **token** | **String**|  | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getClinicMe**
> ClinicPrivate getClinicMe()

Profil privé de la clinique de l'utilisateur courant

clinic_owner ou clinic_admin rattache.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();

try {
    final response = api.getClinicMe();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->getClinicMe: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ClinicPrivate**](ClinicPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inviteClinicMembership**
> ClinicMembership inviteClinicMembership(inviteClinicMembershipRequest)

Inviter un spécialiste

Transition → `invited`. Idempotent si déjà `invited`.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final InviteClinicMembershipRequest inviteClinicMembershipRequest = ; // InviteClinicMembershipRequest | 

try {
    final response = api.inviteClinicMembership(inviteClinicMembershipRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->inviteClinicMembership: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inviteClinicMembershipRequest** | [**InviteClinicMembershipRequest**](InviteClinicMembershipRequest.md)|  | 

### Return type

[**ClinicMembership**](ClinicMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listClinicMeServices**
> BuiltList<ClinicService> listClinicMeServices()

Catalogue de services (privé)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();

try {
    final response = api.listClinicMeServices();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->listClinicMeServices: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ClinicService&gt;**](ClinicService.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listClinicMemberships**
> BuiltList<ClinicMembership> listClinicMemberships(status)

Roster (invitations, actifs, détachements)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final ClinicMembershipStatus status = ; // ClinicMembershipStatus | 

try {
    final response = api.listClinicMemberships(status);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->listClinicMemberships: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | [**ClinicMembershipStatus**](.md)|  | [optional] 

### Return type

[**BuiltList&lt;ClinicMembership&gt;**](ClinicMembership.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listClinicServices**
> BuiltList<ClinicService> listClinicServices(clinicId)

Services publics actifs

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final String clinicId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.listClinicServices(clinicId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->listClinicServices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicId** | **String**|  | 

### Return type

[**BuiltList&lt;ClinicService&gt;**](ClinicService.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listClinicStaff**
> BuiltList<ClinicStaffMember> listClinicStaff()

Administrateurs de la clinique

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();

try {
    final response = api.listClinicStaff();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->listClinicStaff: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ClinicStaffMember&gt;**](ClinicStaffMember.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listClinicVisibleSpecialists**
> BuiltList<ClinicSpecialistTeaser> listClinicVisibleSpecialists(clinicId)

Spécialistes visibles sur le profil clinique

Uniquement memberships `active` avec `visible_on_profile=true`.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final String clinicId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.listClinicVisibleSpecialists(clinicId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->listClinicVisibleSpecialists: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicId** | **String**|  | 

### Return type

[**BuiltList&lt;ClinicSpecialistTeaser&gt;**](ClinicSpecialistTeaser.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listClinics**
> PaginatedClinics listClinics(page, pageSize, wilayaCode, q)

Liste publique des cliniques vérifiées

Uniquement `verified=true` et `status != suspended`, `deleted_at IS NULL`. Les cliniques non vérifiées (y compris G-3 quarantined) sont absentes. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String wilayaCode = wilayaCode_example; // String | 
final String q = q_example; // String | 

try {
    final response = api.listClinics(page, pageSize, wilayaCode, q);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->listClinics: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]
 **wilayaCode** | **String**|  | [optional] 
 **q** | **String**|  | [optional] 

### Return type

[**PaginatedClinics**](PaginatedClinics.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchClinicMe**
> ClinicPrivate patchClinicMe(clinicUpdate)

Mise à jour du profil clinique

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final ClinicUpdate clinicUpdate = ; // ClinicUpdate | 

try {
    final response = api.patchClinicMe(clinicUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->patchClinicMe: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicUpdate** | [**ClinicUpdate**](ClinicUpdate.md)|  | 

### Return type

[**ClinicPrivate**](ClinicPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchClinicService**
> ClinicService patchClinicService(serviceId, clinicServiceUpdate)

Mettre à jour un service

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final String serviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ClinicServiceUpdate clinicServiceUpdate = ; // ClinicServiceUpdate | 

try {
    final response = api.patchClinicService(serviceId, clinicServiceUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->patchClinicService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceId** | **String**|  | 
 **clinicServiceUpdate** | [**ClinicServiceUpdate**](ClinicServiceUpdate.md)|  | 

### Return type

[**ClinicService**](ClinicService.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postClinicCredential**
> ClinicCredential postClinicCredential(file, type, issuedYear)

Dépôt d'un justificatif (registre, agrément)

Multipart, même adaptateur de stockage et URL signée que les diplômes médecin.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getClinicsApi();
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 
final String type = type_example; // String | 
final int issuedYear = 56; // int | 

try {
    final response = api.postClinicCredential(file, type, issuedYear);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClinicsApi->postClinicCredential: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **MultipartFile**|  | 
 **type** | **String**|  | 
 **issuedYear** | **int**|  | [optional] 

### Return type

[**ClinicCredential**](ClinicCredential.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

