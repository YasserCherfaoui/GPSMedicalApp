# gps_medical_api.api.MessagingApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**messagingMessagesMessageIdReadPost**](MessagingApi.md#messagingmessagesmessageidreadpost) | **POST** /messaging/messages/{messageId}/read | Marquer un message comme lu
[**messagingThreadsGet**](MessagingApi.md#messagingthreadsget) | **GET** /messaging/threads | Liste des conversations
[**messagingThreadsThreadIdGet**](MessagingApi.md#messagingthreadsthreadidget) | **GET** /messaging/threads/{threadId} | Détail d&#39;une conversation
[**messagingThreadsThreadIdMessagesGet**](MessagingApi.md#messagingthreadsthreadidmessagesget) | **GET** /messaging/threads/{threadId}/messages | Messages d&#39;une conversation
[**messagingThreadsThreadIdMessagesPost**](MessagingApi.md#messagingthreadsthreadidmessagespost) | **POST** /messaging/threads/{threadId}/messages | Envoi d&#39;un message


# **messagingMessagesMessageIdReadPost**
> messagingMessagesMessageIdReadPost(messageId)

Marquer un message comme lu

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMessagingApi();
final String messageId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.messagingMessagesMessageIdReadPost(messageId);
} on DioException catch (e) {
    print('Exception when calling MessagingApi->messagingMessagesMessageIdReadPost: $e\n');
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

# **messagingThreadsGet**
> PaginatedThreads messagingThreadsGet(page, pageSize)

Liste des conversations

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMessagingApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.messagingThreadsGet(page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MessagingApi->messagingThreadsGet: $e\n');
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

# **messagingThreadsThreadIdGet**
> Thread messagingThreadsThreadIdGet(threadId)

Détail d'une conversation

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMessagingApi();
final String threadId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.messagingThreadsThreadIdGet(threadId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MessagingApi->messagingThreadsThreadIdGet: $e\n');
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

# **messagingThreadsThreadIdMessagesGet**
> BuiltList<Message> messagingThreadsThreadIdMessagesGet(threadId, before, limit)

Messages d'une conversation

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMessagingApi();
final String threadId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final DateTime before = 2013-10-20T19:20:30+01:00; // DateTime | 
final int limit = 56; // int | 

try {
    final response = api.messagingThreadsThreadIdMessagesGet(threadId, before, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MessagingApi->messagingThreadsThreadIdMessagesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threadId** | **String**|  | 
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

# **messagingThreadsThreadIdMessagesPost**
> Message messagingThreadsThreadIdMessagesPost(threadId, messageCreate)

Envoi d'un message

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getMessagingApi();
final String threadId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final MessageCreate messageCreate = ; // MessageCreate | 

try {
    final response = api.messagingThreadsThreadIdMessagesPost(threadId, messageCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MessagingApi->messagingThreadsThreadIdMessagesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threadId** | **String**|  | 
 **messageCreate** | [**MessageCreate**](MessageCreate.md)|  | 

### Return type

[**Message**](Message.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

