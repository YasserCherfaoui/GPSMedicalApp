# gps_medical_api.api.ReviewsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createReview**](ReviewsApi.md#createreview) | **POST** /reviews | Publication d&#39;un avis (uniquement après RDV terminé)
[**deleteReview**](ReviewsApi.md#deletereview) | **DELETE** /reviews/{reviewId} | Suppression d&#39;un avis (auteur)
[**listDoctorReviews**](ReviewsApi.md#listdoctorreviews) | **GET** /doctors/{doctorId}/reviews | Avis publics d&#39;un médecin
[**reportReview**](ReviewsApi.md#reportreview) | **POST** /reviews/{reviewId}/report | Signalement d&#39;un avis abusif
[**updateReview**](ReviewsApi.md#updatereview) | **PATCH** /reviews/{reviewId} | Modification d&#39;un avis (auteur uniquement, &lt; 7 jours)


# **createReview**
> Review createReview(reviewCreate)

Publication d'un avis (uniquement après RDV terminé)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getReviewsApi();
final ReviewCreate reviewCreate = ; // ReviewCreate | 

try {
    final response = api.createReview(reviewCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->createReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewCreate** | [**ReviewCreate**](ReviewCreate.md)|  | 

### Return type

[**Review**](Review.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteReview**
> deleteReview(reviewId)

Suppression d'un avis (auteur)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getReviewsApi();
final String reviewId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.deleteReview(reviewId);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->deleteReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDoctorReviews**
> PaginatedReviews listDoctorReviews(doctorId, page, pageSize)

Avis publics d'un médecin

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getReviewsApi();
final String doctorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listDoctorReviews(doctorId, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->listDoctorReviews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **doctorId** | **String**|  | 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedReviews**](PaginatedReviews.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportReview**
> reportReview(reviewId, reportReviewRequest)

Signalement d'un avis abusif

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getReviewsApi();
final String reviewId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ReportReviewRequest reportReviewRequest = ; // ReportReviewRequest | 

try {
    api.reportReview(reviewId, reportReviewRequest);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->reportReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewId** | **String**|  | 
 **reportReviewRequest** | [**ReportReviewRequest**](ReportReviewRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateReview**
> Review updateReview(reviewId, reviewUpdate)

Modification d'un avis (auteur uniquement, < 7 jours)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getReviewsApi();
final String reviewId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ReviewUpdate reviewUpdate = ; // ReviewUpdate | 

try {
    final response = api.updateReview(reviewId, reviewUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->updateReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewId** | **String**|  | 
 **reviewUpdate** | [**ReviewUpdate**](ReviewUpdate.md)|  | 

### Return type

[**Review**](Review.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

