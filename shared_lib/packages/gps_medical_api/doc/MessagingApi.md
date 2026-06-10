# gps_medical_api.api.MessagingApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createMessagingThreadMessage**](MessagingApi.md#createmessagingthreadmessage) | **POST** /messaging/threads/{threadId}/messages | Envoi d&#39;un message
[**getMessagingThread**](MessagingApi.md#getmessagingthread) | **GET** /messaging/threads/{threadId} | Détail d&#39;une conversation
[**listMessagingThreadMessages**](MessagingApi.md#listmessagingthreadmessages) | **GET** /messaging/threads/{threadId}/messages | Messages d&#39;une conversation
[**listMessagingThreads**](MessagingApi.md#listmessagingthreads) | **GET** /messaging/threads | Liste des conversations
[**markMessagingMessageRead**](MessagingApi.md#markmessagingmessageread) | **POST** /messaging/messages/{messageId}/read | Marquer un message comme lu


# **createMessagingThreadMessage**
> Message createMessagingThreadMessage(threadId, messageCreate)

Envoi d'un message

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMessagingApi();
final String threadId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Thread UUID. For the first message in a new conversation, patients may pass the specialist `doctor_id`; specialists may pass the `patient_id` (medical.patients row). The server auto-creates the thread when a shared appointment exists. 
final MessageCreate messageCreate = ; // MessageCreate | 

try {
    final response = api.createMessagingThreadMessage(threadId, messageCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MessagingApi->createMessagingThreadMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threadId** | **String**| Thread UUID. For the first message in a new conversation, patients may pass the specialist `doctor_id`; specialists may pass the `patient_id` (medical.patients row). The server auto-creates the thread when a shared appointment exists.  | 
 **messageCreate** | [**MessageCreate**](MessageCreate.md)|  | 

### Return type

[**Message**](Message.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMessagingThread**
> Thread getMessagingThread(threadId)

Détail d'une conversation

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMessagingApi();
final String threadId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getMessagingThread(threadId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MessagingApi->getMessagingThread: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threadId** | **String**|  | 

### Return type

[**Thread**](Thread.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMessagingThreadMessages**
> BuiltList<Message> listMessagingThreadMessages(threadId, before, limit)

Messages d'une conversation

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMessagingApi();
final String threadId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Thread UUID. For the first message in a new conversation, patients may pass the specialist `doctor_id`; specialists may pass the `patient_id` (medical.patients row). The server auto-creates the thread when a shared appointment exists. 
final DateTime before = 2013-10-20T19:20:30+01:00; // DateTime | 
final int limit = 56; // int | 

try {
    final response = api.listMessagingThreadMessages(threadId, before, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MessagingApi->listMessagingThreadMessages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threadId** | **String**| Thread UUID. For the first message in a new conversation, patients may pass the specialist `doctor_id`; specialists may pass the `patient_id` (medical.patients row). The server auto-creates the thread when a shared appointment exists.  | 
 **before** | **DateTime**|  | [optional] 
 **limit** | **int**|  | [optional] [default to 50]

### Return type

[**BuiltList&lt;Message&gt;**](Message.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMessagingThreads**
> PaginatedThreads listMessagingThreads(page, pageSize)

Liste des conversations

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMessagingApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listMessagingThreads(page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MessagingApi->listMessagingThreads: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedThreads**](PaginatedThreads.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **markMessagingMessageRead**
> markMessagingMessageRead(messageId)

Marquer un message comme lu

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMessagingApi();
final String messageId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.markMessagingMessageRead(messageId);
} on DioException catch (e) {
    print('Exception when calling MessagingApi->markMessagingMessageRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **messageId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

