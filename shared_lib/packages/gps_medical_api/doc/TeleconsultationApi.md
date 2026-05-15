# gps_medical_api.api.TeleconsultationApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**teleconsultationsAppointmentIdEndPost**](TeleconsultationApi.md#teleconsultationsappointmentidendpost) | **POST** /teleconsultations/{appointmentId}/end | Clôture explicite de la session (côté médecin)
[**teleconsultationsAppointmentIdSessionPost**](TeleconsultationApi.md#teleconsultationsappointmentidsessionpost) | **POST** /teleconsultations/{appointmentId}/session | Création / récupération de la session WebRTC liée à un RDV
[**teleconsultationsTurnCredentialsGet**](TeleconsultationApi.md#teleconsultationsturncredentialsget) | **GET** /teleconsultations/turn-credentials | Identifiants TURN éphémères


# **teleconsultationsAppointmentIdEndPost**
> TeleSession teleconsultationsAppointmentIdEndPost(appointmentId, teleconsultationsAppointmentIdEndPostRequest)

Clôture explicite de la session (côté médecin)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final TeleconsultationsAppointmentIdEndPostRequest teleconsultationsAppointmentIdEndPostRequest = ; // TeleconsultationsAppointmentIdEndPostRequest | 

try {
    final response = api.teleconsultationsAppointmentIdEndPost(appointmentId, teleconsultationsAppointmentIdEndPostRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->teleconsultationsAppointmentIdEndPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 
 **teleconsultationsAppointmentIdEndPostRequest** | [**TeleconsultationsAppointmentIdEndPostRequest**](TeleconsultationsAppointmentIdEndPostRequest.md)|  | [optional] 

### Return type

[**TeleSession**](TeleSession.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **teleconsultationsAppointmentIdSessionPost**
> TeleSession teleconsultationsAppointmentIdSessionPost(appointmentId)

Création / récupération de la session WebRTC liée à un RDV

Disponible 15 min avant l'heure du RDV jusqu'à `end_at + 30 min`. Renvoie un jeton ICE/TURN à durée limitée. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.teleconsultationsAppointmentIdSessionPost(appointmentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->teleconsultationsAppointmentIdSessionPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 

### Return type

[**TeleSession**](TeleSession.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **teleconsultationsTurnCredentialsGet**
> TurnCredentials teleconsultationsTurnCredentialsGet()

Identifiants TURN éphémères

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();

try {
    final response = api.teleconsultationsTurnCredentialsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->teleconsultationsTurnCredentialsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**TurnCredentials**](TurnCredentials.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

