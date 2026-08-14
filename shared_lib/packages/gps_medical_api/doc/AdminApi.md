# gps_medical_api.api.AdminApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminAuditLogGet**](AdminApi.md#adminauditlogget) | **GET** /admin/audit-log | Journal d&#39;audit
[**adminExportUserConsents**](AdminApi.md#adminexportuserconsents) | **GET** /admin/users/{userId}/consents | Export ANPDP — historique complet des consentements (Phase 1)
[**adminListPendingDoctors**](AdminApi.md#adminlistpendingdoctors) | **GET** /admin/doctors/pending | Médecins en attente de vérification
[**adminListUsers**](AdminApi.md#adminlistusers) | **GET** /admin/users | Liste paginée des utilisateurs (vue admin)
[**adminReviewsQueueGet**](AdminApi.md#adminreviewsqueueget) | **GET** /admin/reviews/queue | File de modération des avis signalés
[**adminReviewsReviewIdModeratePost**](AdminApi.md#adminreviewsreviewidmoderatepost) | **POST** /admin/reviews/{reviewId}/moderate | Décision de modération
[**adminSpecialtiesPost**](AdminApi.md#adminspecialtiespost) | **POST** /admin/specialties | Création d&#39;une spécialité (référentiel)
[**adminUsersUserIdGet**](AdminApi.md#adminusersuseridget) | **GET** /admin/users/{userId} | Détail d&#39;un utilisateur (vue admin)
[**adminUsersUserIdPatch**](AdminApi.md#adminusersuseridpatch) | **PATCH** /admin/users/{userId} | Suspension / réactivation / changement de rôle
[**adminVerifyDoctor**](AdminApi.md#adminverifydoctor) | **POST** /admin/doctors/{doctorId}/verify | Validation d&#39;un dossier médecin


# **adminAuditLogGet**
> PaginatedAuditEntries adminAuditLogGet(actorId, action, from, to, page, pageSize)

Journal d'audit

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String actorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String action = action_example; // String | 
final DateTime from = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime to = 2013-10-20T19:20:30+01:00; // DateTime | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.adminAuditLogGet(actorId, action, from, to, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminAuditLogGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **actorId** | **String**|  | [optional] 
 **action** | **String**|  | [optional] 
 **from** | **DateTime**|  | [optional] 
 **to** | **DateTime**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedAuditEntries**](PaginatedAuditEntries.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminExportUserConsents**
> BuiltList<ConsentGrant> adminExportUserConsents(userId)

Export ANPDP — historique complet des consentements (Phase 1)

Réservé aux administrateurs. Retourne l'historique brut des lignes `consent_grants` pour audit et conformité. Implémentation complète des exports signés / filtres en Phase 4. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.adminExportUserConsents(userId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminExportUserConsents: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**BuiltList&lt;ConsentGrant&gt;**](ConsentGrant.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminListPendingDoctors**
> PaginatedDoctorsPrivate adminListPendingDoctors(page, pageSize, country)

Médecins en attente de vérification

Dossiers `pending` et `in_review` uniquement. Les médecins en `approved_pending_activation` ont quitté cette file ; leur effectif est `AdminOverview.doctors_approved_pending_activation`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final CountryCode country = ; // CountryCode | Filtre ISO 3166-1 alpha-2 (`DZ` | `TN`)

try {
    final response = api.adminListPendingDoctors(page, pageSize, country);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminListPendingDoctors: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]
 **country** | [**CountryCode**](.md)| Filtre ISO 3166-1 alpha-2 (`DZ` | `TN`) | [optional] 

### Return type

[**PaginatedDoctorsPrivate**](PaginatedDoctorsPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminListUsers**
> PaginatedUserAdmin adminListUsers(role, status, country, q, page, pageSize)

Liste paginée des utilisateurs (vue admin)

Réservé aux administrateurs (`admin` uniquement). Filtre par rôle, statut et pays (`country`) ; recherche texte (`q`) sur nom affiché et e-mail uniquement (pas de NIN/téléphone). Chaque appel est audité (`admin.users.list`). Voir addendum-week-10.md et addendum-1.1.0.md. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String role = role_example; // String | 
final String status = status_example; // String | 
final CountryCode country = ; // CountryCode | Filtre ISO 3166-1 alpha-2 (`DZ` | `TN`)
final String q = q_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.adminListUsers(role, status, country, q, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminListUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **role** | **String**|  | [optional] 
 **status** | **String**|  | [optional] 
 **country** | [**CountryCode**](.md)| Filtre ISO 3166-1 alpha-2 (`DZ` | `TN`) | [optional] 
 **q** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedUserAdmin**](PaginatedUserAdmin.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminReviewsQueueGet**
> PaginatedReviews adminReviewsQueueGet(page, pageSize)

File de modération des avis signalés

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.adminReviewsQueueGet(page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminReviewsQueueGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedReviews**](PaginatedReviews.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminReviewsReviewIdModeratePost**
> Review adminReviewsReviewIdModeratePost(reviewId, adminReviewsReviewIdModeratePostRequest)

Décision de modération

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String reviewId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final AdminReviewsReviewIdModeratePostRequest adminReviewsReviewIdModeratePostRequest = ; // AdminReviewsReviewIdModeratePostRequest | 

try {
    final response = api.adminReviewsReviewIdModeratePost(reviewId, adminReviewsReviewIdModeratePostRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminReviewsReviewIdModeratePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewId** | **String**|  | 
 **adminReviewsReviewIdModeratePostRequest** | [**AdminReviewsReviewIdModeratePostRequest**](AdminReviewsReviewIdModeratePostRequest.md)|  | 

### Return type

[**Review**](Review.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminSpecialtiesPost**
> Specialty adminSpecialtiesPost(specialtyCreate)

Création d'une spécialité (référentiel)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final SpecialtyCreate specialtyCreate = ; // SpecialtyCreate | 

try {
    final response = api.adminSpecialtiesPost(specialtyCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminSpecialtiesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **specialtyCreate** | [**SpecialtyCreate**](SpecialtyCreate.md)|  | 

### Return type

[**Specialty**](Specialty.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminUsersUserIdGet**
> UserAdmin adminUsersUserIdGet(userId)

Détail d'un utilisateur (vue admin)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.adminUsersUserIdGet(userId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminUsersUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**UserAdmin**](UserAdmin.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminUsersUserIdPatch**
> UserAdmin adminUsersUserIdPatch(userId, userAdminUpdate)

Suspension / réactivation / changement de rôle

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final UserAdminUpdate userAdminUpdate = ; // UserAdminUpdate | 

try {
    final response = api.adminUsersUserIdPatch(userId, userAdminUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminUsersUserIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **userAdminUpdate** | [**UserAdminUpdate**](UserAdminUpdate.md)|  | 

### Return type

[**UserAdmin**](UserAdmin.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminVerifyDoctor**
> DoctorPrivate adminVerifyDoctor(doctorId, verifyDoctorRequest)

Validation d'un dossier médecin

Décision `approved` : pour un médecin **DZ**, `verification_status=approved` et `verified=true`. Pour un médecin **TN**, tant que le flag serveur `TN_SPECIALIST_ACTIVATION` est **off** (défaut), le résultat est `approved_pending_activation` / `verified=false` ; une fois le flag **on**, même branche que DZ. `rejected` et `more_info` inchangés. Le corps 200 est le `DoctorPrivate` résultant (statut + `country`). Voir addendum-1.1.1.md. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String doctorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final VerifyDoctorRequest verifyDoctorRequest = ; // VerifyDoctorRequest | 

try {
    final response = api.adminVerifyDoctor(doctorId, verifyDoctorRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminVerifyDoctor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **doctorId** | **String**|  | 
 **verifyDoctorRequest** | [**VerifyDoctorRequest**](VerifyDoctorRequest.md)|  | 

### Return type

[**DoctorPrivate**](DoctorPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

