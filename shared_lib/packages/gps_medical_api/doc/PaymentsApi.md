# gps_medical_api.api.PaymentsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**confirmPaymentIntent**](PaymentsApi.md#confirmpaymentintent) | **POST** /payments/intents/{intentId}/confirm | Confirmation côté client (token gateway)
[**createPaymentIntent**](PaymentsApi.md#createpaymentintent) | **POST** /payments/intents | Création d&#39;une intention de paiement (acompte ou téléconsultation)
[**createRefund**](PaymentsApi.md#createrefund) | **POST** /payments/refunds | Demande de remboursement
[**getPaymentIntent**](PaymentsApi.md#getpaymentintent) | **GET** /payments/intents/{intentId} | État d&#39;une intention
[**paymentWebhook**](PaymentsApi.md#paymentwebhook) | **POST** /payments/webhooks/{provider} | Webhook entrant des prestataires de paiement


# **confirmPaymentIntent**
> confirmPaymentIntent(intentId, confirmPaymentIntentRequest)

Confirmation côté client (token gateway)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPaymentsApi();
final String intentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ConfirmPaymentIntentRequest confirmPaymentIntentRequest = ; // ConfirmPaymentIntentRequest | 

try {
    api.confirmPaymentIntent(intentId, confirmPaymentIntentRequest);
} on DioException catch (e) {
    print('Exception when calling PaymentsApi->confirmPaymentIntent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **intentId** | **String**|  | 
 **confirmPaymentIntentRequest** | [**ConfirmPaymentIntentRequest**](ConfirmPaymentIntentRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPaymentIntent**
> PaymentIntent createPaymentIntent(paymentIntentCreate)

Création d'une intention de paiement (acompte ou téléconsultation)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPaymentsApi();
final PaymentIntentCreate paymentIntentCreate = ; // PaymentIntentCreate | 

try {
    final response = api.createPaymentIntent(paymentIntentCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentsApi->createPaymentIntent: $e\n');
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

# **createRefund**
> Refund createRefund(refundRequest)

Demande de remboursement

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPaymentsApi();
final RefundRequest refundRequest = ; // RefundRequest | 

try {
    final response = api.createRefund(refundRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentsApi->createRefund: $e\n');
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

# **getPaymentIntent**
> PaymentIntent getPaymentIntent(intentId)

État d'une intention

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPaymentsApi();
final String intentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getPaymentIntent(intentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentsApi->getPaymentIntent: $e\n');
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

# **paymentWebhook**
> paymentWebhook(provider, requestBody)

Webhook entrant des prestataires de paiement

Validation HMAC du payload selon `provider` (en-tête `X-GPS-Signature`, préfixe `sha256=`).

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getPaymentsApi();
final String provider = provider_example; // String | 
final BuiltMap<String, JsonObject> requestBody = Object; // BuiltMap<String, JsonObject> | 

try {
    api.paymentWebhook(provider, requestBody);
} on DioException catch (e) {
    print('Exception when calling PaymentsApi->paymentWebhook: $e\n');
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

