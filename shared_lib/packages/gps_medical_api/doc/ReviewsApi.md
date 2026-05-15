# gps_medical_api.api.ReviewsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**doctorsDoctorIdReviewsGet**](ReviewsApi.md#doctorsdoctoridreviewsget) | **GET** /doctors/{doctorId}/reviews | Avis publics d&#39;un médecin
[**reviewsPost**](ReviewsApi.md#reviewspost) | **POST** /reviews | Publication d&#39;un avis (uniquement après RDV terminé)
[**reviewsReviewIdDelete**](ReviewsApi.md#reviewsreviewiddelete) | **DELETE** /reviews/{reviewId} | Suppression d&#39;un avis (auteur)
[**reviewsReviewIdPatch**](ReviewsApi.md#reviewsreviewidpatch) | **PATCH** /reviews/{reviewId} | Modification d&#39;un avis (auteur uniquement, &lt; 7 jours)
[**reviewsReviewIdReportPost**](ReviewsApi.md#reviewsreviewidreportpost) | **POST** /reviews/{reviewId}/report | Signalement d&#39;un avis abusif


# **doctorsDoctorIdReviewsGet**
> PaginatedReviews doctorsDoctorIdReviewsGet(doctorId, page, pageSize)

Avis publics d'un médecin

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getReviewsApi();
final String doctorId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.doctorsDoctorIdReviewsGet(doctorId, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->doctorsDoctorIdReviewsGet: $e\n');
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

# **reviewsPost**
> Review reviewsPost(reviewCreate)

Publication d'un avis (uniquement après RDV terminé)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getReviewsApi();
final ReviewCreate reviewCreate = ; // ReviewCreate | 

try {
    final response = api.reviewsPost(reviewCreate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->reviewsPost: $e\n');
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

# **reviewsReviewIdDelete**
> reviewsReviewIdDelete(reviewId)

Suppression d'un avis (auteur)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getReviewsApi();
final String reviewId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.reviewsReviewIdDelete(reviewId);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->reviewsReviewIdDelete: $e\n');
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

# **reviewsReviewIdPatch**
> Review reviewsReviewIdPatch(reviewId, reviewUpdate)

Modification d'un avis (auteur uniquement, < 7 jours)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getReviewsApi();
final String reviewId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ReviewUpdate reviewUpdate = ; // ReviewUpdate | 

try {
    final response = api.reviewsReviewIdPatch(reviewId, reviewUpdate);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->reviewsReviewIdPatch: $e\n');
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

# **reviewsReviewIdReportPost**
> reviewsReviewIdReportPost(reviewId, reviewsReviewIdReportPostRequest)

Signalement d'un avis abusif

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getReviewsApi();
final String reviewId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final ReviewsReviewIdReportPostRequest reviewsReviewIdReportPostRequest = ; // ReviewsReviewIdReportPostRequest | 

try {
    api.reviewsReviewIdReportPost(reviewId, reviewsReviewIdReportPostRequest);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->reviewsReviewIdReportPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewId** | **String**|  | 
 **reviewsReviewIdReportPostRequest** | [**ReviewsReviewIdReportPostRequest**](ReviewsReviewIdReportPostRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

