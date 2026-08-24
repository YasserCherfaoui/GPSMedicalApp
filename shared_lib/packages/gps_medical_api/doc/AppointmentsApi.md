# gps_medical_api.api.AppointmentsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**appointmentsAppointmentIdCancelPost**](AppointmentsApi.md#appointmentsappointmentidcancelpost) | **POST** /appointments/{appointmentId}/cancel | Annulation
[**appointmentsAppointmentIdConfirmPost**](AppointmentsApi.md#appointmentsappointmentidconfirmpost) | **POST** /appointments/{appointmentId}/confirm | Confirmation par le médecin (si politique manuelle)
[**appointmentsAppointmentIdGet**](AppointmentsApi.md#appointmentsappointmentidget) | **GET** /appointments/{appointmentId} | Détail d&#39;un rendez-vous
[**appointmentsAppointmentIdNoShowPost**](AppointmentsApi.md#appointmentsappointmentidnoshowpost) | **POST** /appointments/{appointmentId}/no-show | Marquer un patient absent (réservé au médecin)
[**appointmentsAppointmentIdPatch**](AppointmentsApi.md#appointmentsappointmentidpatch) | **PATCH** /appointments/{appointmentId} | Reprogrammation ou modification (motif, notes)
[**appointmentsGet**](AppointmentsApi.md#appointmentsget) | **GET** /appointments | Liste des rendez-vous de l&#39;utilisateur courant
[**appointmentsPost**](AppointmentsApi.md#appointmentspost) | **POST** /appointments | Création d&#39;un rendez-vous
[**assignAppointmentSpecialist**](AppointmentsApi.md#assignappointmentspecialist) | **POST** /appointments/{appointmentId}/assign-specialist | Assigner un spécialiste à une session clinique
[**listClinicAppointments**](AppointmentsApi.md#listclinicappointments) | **GET** /clinics/me/appointments | Boîte de réception des sessions cliniques


# **appointmentsAppointmentIdCancelPost**
> Appointment appointmentsAppointmentIdCancelPost(appointmentId, appointmentsAppointmentIdCancelPostRequest)

Annulation

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAppointmentsApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final AppointmentsAppointmentIdCancelPostRequest appointmentsAppointmentIdCancelPostRequest = ; // AppointmentsAppointmentIdCancelPostRequest | 

try {
    final response = api.appointmentsAppointmentIdCancelPost(appointmentId, appointmentsAppointmentIdCancelPostRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppointmentsApi->appointmentsAppointmentIdCancelPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 
 **appointmentsAppointmentIdCancelPostRequest** | [**AppointmentsAppointmentIdCancelPostRequest**](AppointmentsAppointmentIdCancelPostRequest.md)|  | [optional] 

### Return type

[**Appointment**](Appointment.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **appointmentsAppointmentIdConfirmPost**
> Appointment appointmentsAppointmentIdConfirmPost(appointmentId)

Confirmation par le médecin (si politique manuelle)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAppointmentsApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.appointmentsAppointmentIdConfirmPost(appointmentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppointmentsApi->appointmentsAppointmentIdConfirmPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 

### Return type

[**Appointment**](Appointment.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **appointmentsAppointmentIdGet**
> Appointment appointmentsAppointmentIdGet(appointmentId)

Détail d'un rendez-vous

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAppointmentsApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.appointmentsAppointmentIdGet(appointmentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppointmentsApi->appointmentsAppointmentIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 

### Return type

[**Appointment**](Appointment.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **appointmentsAppointmentIdNoShowPost**
> Appointment appointmentsAppointmentIdNoShowPost(appointmentId)

Marquer un patient absent (réservé au médecin)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAppointmentsApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.appointmentsAppointmentIdNoShowPost(appointmentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppointmentsApi->appointmentsAppointmentIdNoShowPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 

### Return type

[**Appointment**](Appointment.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **appointmentsAppointmentIdPatch**
> Appointment appointmentsAppointmentIdPatch(appointmentId, appointmentUpdate)

Reprogrammation ou modification (motif, notes)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAppointmentsApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final AppointmentUpdate appointmentUpdate = ; // AppointmentUpdate | 

try {
    final response = api.appointmentsAppointmentIdPatch(appointmentId, appointmentUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppointmentsApi->appointmentsAppointmentIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 
 **appointmentUpdate** | [**AppointmentUpdate**](AppointmentUpdate.md)|  | 

### Return type

[**Appointment**](Appointment.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **appointmentsGet**
> PaginatedAppointments appointmentsGet(status, from, to, page, pageSize)

Liste des rendez-vous de l'utilisateur courant

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAppointmentsApi();
final String status = status_example; // String | 
final Date from = 2013-10-20; // Date | 
final Date to = 2013-10-20; // Date | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.appointmentsGet(status, from, to, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppointmentsApi->appointmentsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **String**|  | [optional] 
 **from** | **Date**|  | [optional] 
 **to** | **Date**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedAppointments**](PaginatedAppointments.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **appointmentsPost**
> Appointment appointmentsPost(appointmentCreate)

Création d'un rendez-vous

Le créneau doit être disponible. Verrou optimiste sur le slot. `origin=doctor_direct` (défaut) : un médecin qui n'est pas `verified=true` n'est pas réservable → `404` ou `422`. `origin=clinic_service` : `clinic_id` + `service_id` + slot token ; `doctor_id` reste null jusqu'à `assign-specialist`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAppointmentsApi();
final AppointmentCreate appointmentCreate = ; // AppointmentCreate | 

try {
    final response = api.appointmentsPost(appointmentCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppointmentsApi->appointmentsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentCreate** | [**AppointmentCreate**](AppointmentCreate.md)|  | 

### Return type

[**Appointment**](Appointment.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **assignAppointmentSpecialist**
> Appointment assignAppointmentSpecialist(appointmentId, inviteClinicMembershipRequest)

Assigner un spécialiste à une session clinique

Réservé au staff de la clinique. Le spécialiste doit être `active` au roster. Conflit d'agenda (RDV direct ou autre session) → `409`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAppointmentsApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final InviteClinicMembershipRequest inviteClinicMembershipRequest = ; // InviteClinicMembershipRequest | 

try {
    final response = api.assignAppointmentSpecialist(appointmentId, inviteClinicMembershipRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppointmentsApi->assignAppointmentSpecialist: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 
 **inviteClinicMembershipRequest** | [**InviteClinicMembershipRequest**](InviteClinicMembershipRequest.md)|  | 

### Return type

[**Appointment**](Appointment.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listClinicAppointments**
> PaginatedAppointments listClinicAppointments(status, page, pageSize)

Boîte de réception des sessions cliniques

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAppointmentsApi();
final String status = status_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listClinicAppointments(status, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppointmentsApi->listClinicAppointments: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedAppointments**](PaginatedAppointments.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

