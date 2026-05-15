# gps_medical_api.api.PaymentsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**paymentsIntentsIntentIdConfirmPost**](PaymentsApi.md#paymentsintentsintentidconfirmpost) | **POST** /payments/intents/{intentId}/confirm | Confirmation côté client (token gateway)
[**paymentsIntentsIntentIdGet**](PaymentsApi.md#paymentsintentsintentidget) | **GET** /payments/intents/{intentId} | État d&#39;une intention
[**paymentsIntentsPost**](PaymentsApi.md#paymentsintentspost) | **POST** /payments/intents | Création d&#39;une intention de paiement (acompte ou téléconsultation)
[**paymentsRefundsPost**](PaymentsApi.md#paymentsrefundspost) | **POST** /payments/refunds | Demande de remboursement
[**paymentsWebhooksProviderPost**](PaymentsApi.md#paymentswebhooksproviderpost) | **POST** /payments/webhooks/{provider} | Webhook entrant des prestataires de paiement


# **paymentsIntentsIntentIdConfirmPost**
> PaymentIntent paymentsIntentsIntentIdConfirmPost(intentId, paymentsIntentsIntentIdConfirmPostRequest)

Confirmation côté client (token gateway)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPaymentsApi();
final String intentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final PaymentsIntentsIntentIdConfirmPostRequest paymentsIntentsIntentIdConfirmPostRequest = ; // PaymentsIntentsIntentIdConfirmPostRequest | 

try {
    final response = api.paymentsIntentsIntentIdConfirmPost(intentId, paymentsIntentsIntentIdConfirmPostRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentsApi->paymentsIntentsIntentIdConfirmPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **intentId** | **String**|  | 
 **paymentsIntentsIntentIdConfirmPostRequest** | [**PaymentsIntentsIntentIdConfirmPostRequest**](PaymentsIntentsIntentIdConfirmPostRequest.md)|  | 

### Return type

[**PaymentIntent**](PaymentIntent.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **paymentsIntentsIntentIdGet**
> PaymentIntent paymentsIntentsIntentIdGet(intentId)

État d'une intention

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPaymentsApi();
final String intentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.paymentsIntentsIntentIdGet(intentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentsApi->paymentsIntentsIntentIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **intentId** | **String**|  | 

### Return type

[**PaymentIntent**](PaymentIntent.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **paymentsIntentsPost**
> PaymentIntent paymentsIntentsPost(paymentIntentCreate)

Création d'une intention de paiement (acompte ou téléconsultation)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPaymentsApi();
final PaymentIntentCreate paymentIntentCreate = ; // PaymentIntentCreate | 

try {
    final response = api.paymentsIntentsPost(paymentIntentCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentsApi->paymentsIntentsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentIntentCreate** | [**PaymentIntentCreate**](PaymentIntentCreate.md)|  | 

### Return type

[**PaymentIntent**](PaymentIntent.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **paymentsRefundsPost**
> Refund paymentsRefundsPost(refundRequest)

Demande de remboursement

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPaymentsApi();
final RefundRequest refundRequest = ; // RefundRequest | 

try {
    final response = api.paymentsRefundsPost(refundRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentsApi->paymentsRefundsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refundRequest** | [**RefundRequest**](RefundRequest.md)|  | 

### Return type

[**Refund**](Refund.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **paymentsWebhooksProviderPost**
> paymentsWebhooksProviderPost(provider, requestBody)

Webhook entrant des prestataires de paiement

Validation HMAC du payload selon `provider`.

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPaymentsApi();
final String provider = provider_example; // String | 
final BuiltMap<String, JsonObject> requestBody = Object; // BuiltMap<String, JsonObject> | 

try {
    api.paymentsWebhooksProviderPost(provider, requestBody);
} on DioException catch (e) {
    print('Exception when calling PaymentsApi->paymentsWebhooksProviderPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **provider** | **String**|  | 
 **requestBody** | [**BuiltMap&lt;String, JsonObject&gt;**](JsonObject.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

