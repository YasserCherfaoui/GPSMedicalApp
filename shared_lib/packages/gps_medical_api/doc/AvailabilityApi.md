# gps_medical_api.api.AvailabilityApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**doctorsDoctorIdAvailabilityGet**](AvailabilityApi.md#doctorsdoctoridavailabilityget) | **GET** /doctors/{doctorId}/availability | Créneaux disponibles d&#39;un médecin
[**doctorsMeScheduleExceptionsGet**](AvailabilityApi.md#doctorsmescheduleexceptionsget) | **GET** /doctors/me/schedule/exceptions | Congés et exceptions ponctuelles
[**doctorsMeScheduleExceptionsPost**](AvailabilityApi.md#doctorsmescheduleexceptionspost) | **POST** /doctors/me/schedule/exceptions | Ajout d&#39;un congé / blocage de créneau
[**doctorsMeScheduleTemplatesGet**](AvailabilityApi.md#doctorsmescheduletemplatesget) | **GET** /doctors/me/schedule/templates | Modèles d&#39;agenda hebdomadaires (récurrents)
[**doctorsMeScheduleTemplatesPost**](AvailabilityApi.md#doctorsmescheduletemplatespost) | **POST** /doctors/me/schedule/templates | Création d&#39;un modèle hebdomadaire
[**doctorsMeScheduleTemplatesTemplateIdDelete**](AvailabilityApi.md#doctorsmescheduletemplatestemplateiddelete) | **DELETE** /doctors/me/schedule/templates/{templateId} | Suppression d&#39;un modèle
[**doctorsMeScheduleTemplatesTemplateIdPut**](AvailabilityApi.md#doctorsmescheduletemplatestemplateidput) | **PUT** /doctors/me/schedule/templates/{templateId} | Remplacement d&#39;un modèle


# **doctorsDoctorIdAvailabilityGet**
> BuiltList<AvailabilitySlot> doctorsDoctorIdAvailabilityGet(doctorId, from, to, mode)

Créneaux disponibles d'un médecin

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAvailabilityApi();
final String doctorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final Date from = 2013-10-20; // Date | 
final Date to = 2013-10-20; // Date | 
final String mode = mode_example; // String | 

try {
    final response = api.doctorsDoctorIdAvailabilityGet(doctorId, from, to, mode);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AvailabilityApi->doctorsDoctorIdAvailabilityGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **doctorId** | **String**|  | 
 **from** | **Date**|  | 
 **to** | **Date**|  | 
 **mode** | **String**|  | [optional] [default to 'both']

### Return type

[**BuiltList&lt;AvailabilitySlot&gt;**](AvailabilitySlot.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsMeScheduleExceptionsGet**
> BuiltList<ScheduleException> doctorsMeScheduleExceptionsGet()

Congés et exceptions ponctuelles

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAvailabilityApi();

try {
    final response = api.doctorsMeScheduleExceptionsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AvailabilityApi->doctorsMeScheduleExceptionsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ScheduleException&gt;**](ScheduleException.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsMeScheduleExceptionsPost**
> ScheduleException doctorsMeScheduleExceptionsPost(scheduleExceptionCreate)

Ajout d'un congé / blocage de créneau

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAvailabilityApi();
final ScheduleExceptionCreate scheduleExceptionCreate = ; // ScheduleExceptionCreate | 

try {
    final response = api.doctorsMeScheduleExceptionsPost(scheduleExceptionCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AvailabilityApi->doctorsMeScheduleExceptionsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **scheduleExceptionCreate** | [**ScheduleExceptionCreate**](ScheduleExceptionCreate.md)|  | 

### Return type

[**ScheduleException**](ScheduleException.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsMeScheduleTemplatesGet**
> BuiltList<ScheduleTemplate> doctorsMeScheduleTemplatesGet()

Modèles d'agenda hebdomadaires (récurrents)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAvailabilityApi();

try {
    final response = api.doctorsMeScheduleTemplatesGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AvailabilityApi->doctorsMeScheduleTemplatesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ScheduleTemplate&gt;**](ScheduleTemplate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsMeScheduleTemplatesPost**
> ScheduleTemplate doctorsMeScheduleTemplatesPost(scheduleTemplateCreate)

Création d'un modèle hebdomadaire

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAvailabilityApi();
final ScheduleTemplateCreate scheduleTemplateCreate = ; // ScheduleTemplateCreate | 

try {
    final response = api.doctorsMeScheduleTemplatesPost(scheduleTemplateCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AvailabilityApi->doctorsMeScheduleTemplatesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **scheduleTemplateCreate** | [**ScheduleTemplateCreate**](ScheduleTemplateCreate.md)|  | 

### Return type

[**ScheduleTemplate**](ScheduleTemplate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsMeScheduleTemplatesTemplateIdDelete**
> doctorsMeScheduleTemplatesTemplateIdDelete(templateId)

Suppression d'un modèle

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAvailabilityApi();
final String templateId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.doctorsMeScheduleTemplatesTemplateIdDelete(templateId);
} on DioException catch (e) {
    print('Exception when calling AvailabilityApi->doctorsMeScheduleTemplatesTemplateIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **doctorsMeScheduleTemplatesTemplateIdPut**
> ScheduleTemplate doctorsMeScheduleTemplatesTemplateIdPut(templateId, scheduleTemplateCreate)

Remplacement d'un modèle

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAvailabilityApi();
final String templateId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ScheduleTemplateCreate scheduleTemplateCreate = ; // ScheduleTemplateCreate | 

try {
    final response = api.doctorsMeScheduleTemplatesTemplateIdPut(templateId, scheduleTemplateCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AvailabilityApi->doctorsMeScheduleTemplatesTemplateIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateId** | **String**|  | 
 **scheduleTemplateCreate** | [**ScheduleTemplateCreate**](ScheduleTemplateCreate.md)|  | 

### Return type

[**ScheduleTemplate**](ScheduleTemplate.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

