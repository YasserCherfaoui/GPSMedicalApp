# gps_medical_api.api.NotificationsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteNotificationDevice**](NotificationsApi.md#deletenotificationdevice) | **DELETE** /notifications/devices/{deviceId} | Désinscription d&#39;un device
[**getNotificationPreferences**](NotificationsApi.md#getnotificationpreferences) | **GET** /notifications/preferences | Préférences de notification
[**listNotifications**](NotificationsApi.md#listnotifications) | **GET** /notifications | Liste des notifications de l&#39;utilisateur
[**markAllNotificationsRead**](NotificationsApi.md#markallnotificationsread) | **POST** /notifications/read-all | Marquer toutes les notifications comme lues
[**markNotificationRead**](NotificationsApi.md#marknotificationread) | **POST** /notifications/{notificationId}/read | Marquer comme lu
[**registerNotificationDevice**](NotificationsApi.md#registernotificationdevice) | **POST** /notifications/devices | Enregistrement d&#39;un device pour les push (FCM)
[**updateNotificationPreferences**](NotificationsApi.md#updatenotificationpreferences) | **PUT** /notifications/preferences | Mise à jour des préférences


# **deleteNotificationDevice**
> deleteNotificationDevice(deviceId)

Désinscription d'un device

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();
final String deviceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.deleteNotificationDevice(deviceId);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->deleteNotificationDevice: $e\n');
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

# **getNotificationPreferences**
> NotificationPreferences getNotificationPreferences()

Préférences de notification

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();

try {
    final response = api.getNotificationPreferences();
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->getNotificationPreferences: $e\n');
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

# **listNotifications**
> PaginatedNotifications listNotifications(unreadOnly, page, pageSize)

Liste des notifications de l'utilisateur

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();
final bool unreadOnly = true; // bool | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listNotifications(unreadOnly, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->listNotifications: $e\n');
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

# **markAllNotificationsRead**
> markAllNotificationsRead()

Marquer toutes les notifications comme lues

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();

try {
    api.markAllNotificationsRead();
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->markAllNotificationsRead: $e\n');
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

# **markNotificationRead**
> markNotificationRead(notificationId)

Marquer comme lu

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();
final String notificationId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.markNotificationRead(notificationId);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->markNotificationRead: $e\n');
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

# **registerNotificationDevice**
> Device registerNotificationDevice(deviceRegistration)

Enregistrement d'un device pour les push (FCM)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();
final DeviceRegistration deviceRegistration = ; // DeviceRegistration | 

try {
    final response = api.registerNotificationDevice(deviceRegistration);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->registerNotificationDevice: $e\n');
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

# **updateNotificationPreferences**
> NotificationPreferences updateNotificationPreferences(notificationPreferences)

Mise à jour des préférences

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getNotificationsApi();
final NotificationPreferences notificationPreferences = ; // NotificationPreferences | 

try {
    final response = api.updateNotificationPreferences(notificationPreferences);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->updateNotificationPreferences: $e\n');
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

