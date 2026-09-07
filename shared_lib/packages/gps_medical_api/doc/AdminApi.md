# gps_medical_api.api.AdminApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminAuditLogGet**](AdminApi.md#adminauditlogget) | **GET** /admin/audit-log | Journal d&#39;audit
[**adminCreateConciergeAccount**](AdminApi.md#admincreateconciergeaccount) | **POST** /admin/concierge/accounts | Provisionner un compte concierge
[**adminCreateConsentExportJob**](AdminApi.md#admincreateconsentexportjob) | **POST** /admin/consents/export | Export ANPDP bulk (job async)
[**adminDeleteClinic**](AdminApi.md#admindeleteclinic) | **DELETE** /admin/clinics/{clinicId} | Soft-delete
[**adminDownloadConsentExportJob**](AdminApi.md#admindownloadconsentexportjob) | **GET** /admin/consents/export/{jobId}/download | Télécharger le bundle signé d&#39;un job terminé
[**adminExportUserConsents**](AdminApi.md#adminexportuserconsents) | **GET** /admin/users/{userId}/consents | Export ANPDP — historique complet des consentements (Phase 1)
[**adminExportUserConsentsSigned**](AdminApi.md#adminexportuserconsentssigned) | **GET** /admin/users/{userId}/consents/export | Export ANPDP signé et filtré (Phase 4)
[**adminGetClinic**](AdminApi.md#admingetclinic) | **GET** /admin/clinics/{clinicId} | Détail admin d&#39;une clinique
[**adminGetConsentExportJob**](AdminApi.md#admingetconsentexportjob) | **GET** /admin/consents/export/{jobId} | Statut d&#39;un job d&#39;export bulk
[**adminListClinics**](AdminApi.md#adminlistclinics) | **GET** /admin/clinics | Liste admin des cliniques
[**adminListConciergeAccounts**](AdminApi.md#adminlistconciergeaccounts) | **GET** /admin/concierge/accounts | Liste des comptes concierge
[**adminListConciergeCases**](AdminApi.md#adminlistconciergecases) | **GET** /admin/concierge/cases | File ops — tous les dossiers concierge
[**adminListPendingClinics**](AdminApi.md#adminlistpendingclinics) | **GET** /admin/clinics/pending | File de vérification clinique
[**adminListPendingDoctors**](AdminApi.md#adminlistpendingdoctors) | **GET** /admin/doctors/pending | Médecins en attente de vérification
[**adminListSeededSpecialists**](AdminApi.md#adminlistseededspecialists) | **GET** /admin/specialists/seeded | Inventaire des spécialistes OSM non revendiqués
[**adminListUsers**](AdminApi.md#adminlistusers) | **GET** /admin/users | Liste paginée des utilisateurs (vue admin)
[**adminPatchClinic**](AdminApi.md#adminpatchclinic) | **PATCH** /admin/clinics/{clinicId} | Éditer / suspendre une clinique
[**adminReviewsQueueGet**](AdminApi.md#adminreviewsqueueget) | **GET** /admin/reviews/queue | File de modération des avis signalés
[**adminReviewsReviewIdModeratePost**](AdminApi.md#adminreviewsreviewidmoderatepost) | **POST** /admin/reviews/{reviewId}/moderate | Décision de modération
[**adminSpecialtiesPost**](AdminApi.md#adminspecialtiespost) | **POST** /admin/specialties | Création d&#39;une spécialité (référentiel)
[**adminTestPushNotification**](AdminApi.md#admintestpushnotification) | **POST** /admin/notifications/test-push | Envoyer une notification push de test (FCM)
[**adminUsersUserIdGet**](AdminApi.md#adminusersuseridget) | **GET** /admin/users/{userId} | Détail d&#39;un utilisateur (vue admin)
[**adminUsersUserIdPatch**](AdminApi.md#adminusersuseridpatch) | **PATCH** /admin/users/{userId} | Suspension / réactivation / changement de rôle
[**adminVerifyClinic**](AdminApi.md#adminverifyclinic) | **POST** /admin/clinics/{clinicId}/verify | Décision de vérification clinique
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

# **adminCreateConciergeAccount**
> ConciergeAccount adminCreateConciergeAccount(conciergeAccountCreate)

Provisionner un compte concierge

Crée un utilisateur `role=concierge` actif (sans OTP public). Chaque création écrit une ligne d'audit. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final ConciergeAccountCreate conciergeAccountCreate = ; // ConciergeAccountCreate | 

try {
    final response = api.adminCreateConciergeAccount(conciergeAccountCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminCreateConciergeAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **conciergeAccountCreate** | [**ConciergeAccountCreate**](ConciergeAccountCreate.md)|  | 

### Return type

[**ConciergeAccount**](ConciergeAccount.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminCreateConsentExportJob**
> ConsentExportJob adminCreateConsentExportJob(consentBulkExportRequest)

Export ANPDP bulk (job async)

Crée un job asynchrone qui agrège les consentements filtrés (multi-utilisateur) et produit un bundle signé téléchargeable via `GET .../download`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final ConsentBulkExportRequest consentBulkExportRequest = ; // ConsentBulkExportRequest | 

try {
    final response = api.adminCreateConsentExportJob(consentBulkExportRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminCreateConsentExportJob: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **consentBulkExportRequest** | [**ConsentBulkExportRequest**](ConsentBulkExportRequest.md)|  | 

### Return type

[**ConsentExportJob**](ConsentExportJob.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminDeleteClinic**
> adminDeleteClinic(clinicId)

Soft-delete

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String clinicId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.adminDeleteClinic(clinicId);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminDeleteClinic: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminDownloadConsentExportJob**
> ConsentExportBundle adminDownloadConsentExportJob(jobId)

Télécharger le bundle signé d'un job terminé

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String jobId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.adminDownloadConsentExportJob(jobId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminDownloadConsentExportJob: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jobId** | **String**|  | 

### Return type

[**ConsentExportBundle**](ConsentExportBundle.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

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

# **adminExportUserConsentsSigned**
> ConsentExportBundle adminExportUserConsentsSigned(userId, from, to, purpose)

Export ANPDP signé et filtré (Phase 4)

Retourne un bundle JSON signé (Ed25519 détachée) contenant uniquement les métadonnées `consent_grants` — jamais de PHI chiffrée côté client. Chaque export écrit une ligne d'audit avec le jeu de filtres. Voir `docs/compliance/consent-export-verification.md`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final DateTime from = 2013-10-20T19:20:30+01:00; // DateTime | Inclus — filtre sur `granted_at`
final DateTime to = 2013-10-20T19:20:30+01:00; // DateTime | Exclus — filtre sur `granted_at`
final String purpose = purpose_example; // String | Filtre sur `consent_type`

try {
    final response = api.adminExportUserConsentsSigned(userId, from, to, purpose);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminExportUserConsentsSigned: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **from** | **DateTime**| Inclus — filtre sur `granted_at` | [optional] 
 **to** | **DateTime**| Exclus — filtre sur `granted_at` | [optional] 
 **purpose** | **String**| Filtre sur `consent_type` | [optional] 

### Return type

[**ConsentExportBundle**](ConsentExportBundle.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminGetClinic**
> ClinicAdminDetail adminGetClinic(clinicId)

Détail admin d'une clinique

Inclut membres actifs du roster, résumé des blocs donnés, capacité vs couverture, et avis de sous-effectif (additif Phase 4). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String clinicId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.adminGetClinic(clinicId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminGetClinic: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicId** | **String**|  | 

### Return type

[**ClinicAdminDetail**](ClinicAdminDetail.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminGetConsentExportJob**
> ConsentExportJob adminGetConsentExportJob(jobId)

Statut d'un job d'export bulk

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String jobId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.adminGetConsentExportJob(jobId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminGetConsentExportJob: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jobId** | **String**|  | 

### Return type

[**ConsentExportJob**](ConsentExportJob.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminListClinics**
> PaginatedClinicsPrivate adminListClinics(page, pageSize, q, status, verificationStatus, countryCode, verified, wilayaCode, underStaffed)

Liste admin des cliniques

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String q = q_example; // String | 
final ClinicStatus status = ; // ClinicStatus | 
final ClinicVerificationStatus verificationStatus = ; // ClinicVerificationStatus | 
final String countryCode = countryCode_example; // String | 
final bool verified = true; // bool | 
final String wilayaCode = wilayaCode_example; // String | Filtre sur le code wilaya (ex. `16` pour Alger)
final bool underStaffed = true; // bool | Si `true`, ne retourne que les cliniques avec au moins un créneau de capacité publiée sous-couvert par les blocs donnés du roster. 

try {
    final response = api.adminListClinics(page, pageSize, q, status, verificationStatus, countryCode, verified, wilayaCode, underStaffed);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminListClinics: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]
 **q** | **String**|  | [optional] 
 **status** | [**ClinicStatus**](.md)|  | [optional] 
 **verificationStatus** | [**ClinicVerificationStatus**](.md)|  | [optional] 
 **countryCode** | **String**|  | [optional] 
 **verified** | **bool**|  | [optional] 
 **wilayaCode** | **String**| Filtre sur le code wilaya (ex. `16` pour Alger) | [optional] 
 **underStaffed** | **bool**| Si `true`, ne retourne que les cliniques avec au moins un créneau de capacité publiée sous-couvert par les blocs donnés du roster.  | [optional] 

### Return type

[**PaginatedClinicsPrivate**](PaginatedClinicsPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminListConciergeAccounts**
> PaginatedConciergeAccounts adminListConciergeAccounts(page, pageSize, q)

Liste des comptes concierge

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String q = q_example; // String | 

try {
    final response = api.adminListConciergeAccounts(page, pageSize, q);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminListConciergeAccounts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]
 **q** | **String**|  | [optional] 

### Return type

[**PaginatedConciergeAccounts**](PaginatedConciergeAccounts.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminListConciergeCases**
> PaginatedConciergeCases adminListConciergeCases(page, pageSize, status, conciergeUserId)

File ops — tous les dossiers concierge

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final ConciergeCaseStatus status = ; // ConciergeCaseStatus | 
final String conciergeUserId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.adminListConciergeCases(page, pageSize, status, conciergeUserId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminListConciergeCases: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]
 **status** | [**ConciergeCaseStatus**](.md)|  | [optional] 
 **conciergeUserId** | **String**|  | [optional] 

### Return type

[**PaginatedConciergeCases**](PaginatedConciergeCases.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminListPendingClinics**
> PaginatedClinicsPrivate adminListPendingClinics(page, pageSize, q, countryCode)

File de vérification clinique

Dossiers `pending` et `in_review` uniquement.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String q = q_example; // String | Recherche sur le nom, la raison sociale et la wilaya.
final String countryCode = countryCode_example; // String | 

try {
    final response = api.adminListPendingClinics(page, pageSize, q, countryCode);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminListPendingClinics: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]
 **q** | **String**| Recherche sur le nom, la raison sociale et la wilaya. | [optional] 
 **countryCode** | **String**|  | [optional] 

### Return type

[**PaginatedClinicsPrivate**](PaginatedClinicsPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminListPendingDoctors**
> PaginatedDoctorsPrivate adminListPendingDoctors(page, pageSize, q, country)

Médecins en attente de vérification

Dossiers `pending` et `in_review` uniquement. Les médecins en `approved_pending_activation` ont quitté cette file ; leur effectif est `AdminOverview.doctors_approved_pending_activation`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String q = q_example; // String | Recherche sur le nom affiché et le n° d'ordre.
final CountryCode country = ; // CountryCode | Filtre ISO 3166-1 alpha-2 (`DZ` | `TN`)

try {
    final response = api.adminListPendingDoctors(page, pageSize, q, country);
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
 **q** | **String**| Recherche sur le nom affiché et le n° d'ordre. | [optional] 
 **country** | [**CountryCode**](.md)| Filtre ISO 3166-1 alpha-2 (`DZ` | `TN`) | [optional] 

### Return type

[**PaginatedDoctorsPrivate**](PaginatedDoctorsPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminListSeededSpecialists**
> PaginatedSeededSpecialists adminListSeededSpecialists(page, pageSize, q, wilayaCode, country, claimStatus)

Inventaire des spécialistes OSM non revendiqués

Profils `verified=false` créés par le pipeline OSM (`SEEDED_NO_LOGIN`). Visibles admin uniquement — absents de la découverte patient. Attribution : © OpenStreetMap contributors (ODbL). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String q = q_example; // String | 
final String wilayaCode = wilayaCode_example; // String | 
final CountryCode country = ; // CountryCode | 
final SeededSpecialistClaimStatus claimStatus = ; // SeededSpecialistClaimStatus | 

try {
    final response = api.adminListSeededSpecialists(page, pageSize, q, wilayaCode, country, claimStatus);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminListSeededSpecialists: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]
 **q** | **String**|  | [optional] 
 **wilayaCode** | **String**|  | [optional] 
 **country** | [**CountryCode**](.md)|  | [optional] 
 **claimStatus** | [**SeededSpecialistClaimStatus**](.md)|  | [optional] 

### Return type

[**PaginatedSeededSpecialists**](PaginatedSeededSpecialists.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

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

# **adminPatchClinic**
> ClinicPrivate adminPatchClinic(clinicId, clinicAdminUpdate)

Éditer / suspendre une clinique

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String clinicId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ClinicAdminUpdate clinicAdminUpdate = ; // ClinicAdminUpdate | 

try {
    final response = api.adminPatchClinic(clinicId, clinicAdminUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminPatchClinic: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicId** | **String**|  | 
 **clinicAdminUpdate** | [**ClinicAdminUpdate**](ClinicAdminUpdate.md)|  | 

### Return type

[**ClinicPrivate**](ClinicPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
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

# **adminTestPushNotification**
> AdminTestPushResponse adminTestPushNotification(adminTestPushRequest)

Envoyer une notification push de test (FCM)

Réservé aux administrateurs (`admin`, audience `dashboard`). Envoie synchrone vers tous les devices FCM enregistrés de l'utilisateur cible (ignore quiet hours / `push_enabled`) et crée aussi une notification in-app. Utile pour valider le transport FCM depuis l'Espace développeur. `404` si aucun device n'est enregistré pour `user_id`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final AdminTestPushRequest adminTestPushRequest = ; // AdminTestPushRequest | 

try {
    final response = api.adminTestPushNotification(adminTestPushRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminTestPushNotification: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **adminTestPushRequest** | [**AdminTestPushRequest**](AdminTestPushRequest.md)|  | 

### Return type

[**AdminTestPushResponse**](AdminTestPushResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

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

# **adminVerifyClinic**
> ClinicPrivate adminVerifyClinic(clinicId, verifyClinicRequest)

Décision de vérification clinique

`approved` + `country_code=DZ` → `verified=true`. `approved` + TN/UE → `approved_pending_activation` / `verified=false` (G-3). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAdminApi();
final String clinicId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final VerifyClinicRequest verifyClinicRequest = ; // VerifyClinicRequest | 

try {
    final response = api.adminVerifyClinic(clinicId, verifyClinicRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->adminVerifyClinic: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clinicId** | **String**|  | 
 **verifyClinicRequest** | [**VerifyClinicRequest**](VerifyClinicRequest.md)|  | 

### Return type

[**ClinicPrivate**](ClinicPrivate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

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

