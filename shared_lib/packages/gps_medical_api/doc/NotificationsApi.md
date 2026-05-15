# gps_medical_api.api.NotificationsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**notificationsDevicesDeviceIdDelete**](NotificationsApi.md#notificationsdevicesdeviceiddelete) | **DELETE** /notifications/devices/{deviceId} | Désinscription d&#39;un device
[**notificationsDevicesPost**](NotificationsApi.md#notificationsdevicespost) | **POST** /notifications/devices | Enregistrement d&#39;un device pour les push (FCM)
[**notificationsGet**](NotificationsApi.md#notificationsget) | **GET** /notifications | Liste des notifications de l&#39;utilisateur
[**notificationsNotificationIdReadPost**](NotificationsApi.md#notificationsnotificationidreadpost) | **POST** /notifications/{notificationId}/read | Marquer comme lu
[**notificationsPreferencesGet**](NotificationsApi.md#notificationspreferencesget) | **GET** /notifications/preferences | Préférences de notification
[**notificationsPreferencesPut**](NotificationsApi.md#notificationspreferencesput) | **PUT** /notifications/preferences | Mise à jour des préférences
[**notificationsReadAllPost**](NotificationsApi.md#notificationsreadallpost) | **POST** /notifications/read-all | Marquer toutes les notifications comme lues


# **notificationsDevicesDeviceIdDelete**
> notificationsDevicesDeviceIdDelete(deviceId)

Désinscription d'un device

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.notificationsDevicesDeviceIdDelete(deviceId);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->notificationsDevicesDeviceIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationsDevicesPost**
> Device notificationsDevicesPost(deviceRegistration)

Enregistrement d'un device pour les push (FCM)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();
final DeviceRegistration deviceRegistration = ; // DeviceRegistration | 

try {
    final response = api.notificationsDevicesPost(deviceRegistration);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->notificationsDevicesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceRegistration** | [**DeviceRegistration**](DeviceRegistration.md)|  | 

### Return type

[**Device**](Device.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationsGet**
> PaginatedNotifications notificationsGet(unreadOnly, page, pageSize)

Liste des notifications de l'utilisateur

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();
final bool unreadOnly = true; // bool | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.notificationsGet(unreadOnly, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->notificationsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **unreadOnly** | **bool**|  | [optional] [default to false]
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedNotifications**](PaginatedNotifications.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationsNotificationIdReadPost**
> notificationsNotificationIdReadPost(notificationId)

Marquer comme lu

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();
final String notificationId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.notificationsNotificationIdReadPost(notificationId);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->notificationsNotificationIdReadPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **notificationId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationsPreferencesGet**
> NotificationPreferences notificationsPreferencesGet()

Préférences de notification

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();

try {
    final response = api.notificationsPreferencesGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->notificationsPreferencesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**NotificationPreferences**](NotificationPreferences.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationsPreferencesPut**
> NotificationPreferences notificationsPreferencesPut(notificationPreferences)

Mise à jour des préférences

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();
final NotificationPreferences notificationPreferences = ; // NotificationPreferences | 

try {
    final response = api.notificationsPreferencesPut(notificationPreferences);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->notificationsPreferencesPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **notificationPreferences** | [**NotificationPreferences**](NotificationPreferences.md)|  | 

### Return type

[**NotificationPreferences**](NotificationPreferences.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notificationsReadAllPost**
> notificationsReadAllPost()

Marquer toutes les notifications comme lues

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();

try {
    api.notificationsReadAllPost();
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->notificationsReadAllPost: $e\n');
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

