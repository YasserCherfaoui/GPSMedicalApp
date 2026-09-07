# gps_medical_api.api.ConciergeApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createConciergeCase**](ConciergeApi.md#createconciergecase) | **POST** /concierge/cases | Ouvrir un dossier patient → concierge
[**getConciergeCase**](ConciergeApi.md#getconciergecase) | **GET** /concierge/cases/{caseId} | Détail d&#39;un dossier (patient + RDV à venir)
[**listMyConciergeCases**](ConciergeApi.md#listmyconciergecases) | **GET** /concierge/me/cases | Dossiers assignés au concierge connecté
[**patchConciergeCase**](ConciergeApi.md#patchconciergecase) | **PATCH** /concierge/cases/{caseId} | Mettre à jour statut / note / réassignation


# **createConciergeCase**
> ConciergeCase createConciergeCase(conciergeCaseCreate)

Ouvrir un dossier patient → concierge

Admin : doit fournir `concierge_user_id` (ou laisse vide pour assignation auto). Concierge : s'auto-assigne ; `concierge_user_id` ignoré. Crée le fil de messagerie lié (`thread_id`). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getConciergeApi();
final ConciergeCaseCreate conciergeCaseCreate = ; // ConciergeCaseCreate | 

try {
    final response = api.createConciergeCase(conciergeCaseCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ConciergeApi->createConciergeCase: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **conciergeCaseCreate** | [**ConciergeCaseCreate**](ConciergeCaseCreate.md)|  | 

### Return type

[**ConciergeCase**](ConciergeCase.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getConciergeCase**
> ConciergeCaseDetail getConciergeCase(caseId)

Détail d'un dossier (patient + RDV à venir)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getConciergeApi();
final String caseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getConciergeCase(caseId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ConciergeApi->getConciergeCase: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **caseId** | **String**|  | 

### Return type

[**ConciergeCaseDetail**](ConciergeCaseDetail.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyConciergeCases**
> PaginatedConciergeCases listMyConciergeCases(page, pageSize, status)

Dossiers assignés au concierge connecté

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getConciergeApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final ConciergeCaseStatus status = ; // ConciergeCaseStatus | 

try {
    final response = api.listMyConciergeCases(page, pageSize, status);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ConciergeApi->listMyConciergeCases: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]
 **status** | [**ConciergeCaseStatus**](.md)|  | [optional] 

### Return type

[**PaginatedConciergeCases**](PaginatedConciergeCases.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchConciergeCase**
> ConciergeCase patchConciergeCase(caseId, conciergeCasePatch)

Mettre à jour statut / note / réassignation

Concierge assigné ou admin. Toute mutation est auditée. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getConciergeApi();
final String caseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ConciergeCasePatch conciergeCasePatch = ; // ConciergeCasePatch | 

try {
    final response = api.patchConciergeCase(caseId, conciergeCasePatch);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ConciergeApi->patchConciergeCase: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **caseId** | **String**|  | 
 **conciergeCasePatch** | [**ConciergeCasePatch**](ConciergeCasePatch.md)|  | 

### Return type

[**ConciergeCase**](ConciergeCase.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

