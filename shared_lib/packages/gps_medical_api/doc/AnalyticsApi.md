# gps_medical_api.api.AnalyticsApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**analyticsAdminFunnelGet**](AnalyticsApi.md#analyticsadminfunnelget) | **GET** /analytics/admin/funnel | Entonnoir d&#39;acquisition (recherche → RDV → consultation)
[**analyticsAdminOverviewGet**](AnalyticsApi.md#analyticsadminoverviewget) | **GET** /analytics/admin/overview | Vue d&#39;ensemble plateforme (admin)
[**analyticsDoctorOverviewGet**](AnalyticsApi.md#analyticsdoctoroverviewget) | **GET** /analytics/doctor/overview | Vue d&#39;ensemble pour le médecin connecté
[**analyticsDoctorTimeseriesGet**](AnalyticsApi.md#analyticsdoctortimeseriesget) | **GET** /analytics/doctor/timeseries | Séries temporelles (RDV, revenus, no-show)


# **analyticsAdminFunnelGet**
> Funnel analyticsAdminFunnelGet(from, to)

Entonnoir d'acquisition (recherche → RDV → consultation)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAnalyticsApi();
final Date from = 2013-10-20; // Date | 
final Date to = 2013-10-20; // Date | 

try {
    final response = api.analyticsAdminFunnelGet(from, to);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalyticsApi->analyticsAdminFunnelGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **Date**|  | [optional] 
 **to** | **Date**|  | [optional] 

### Return type

[**Funnel**](Funnel.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **analyticsAdminOverviewGet**
> AdminOverview analyticsAdminOverviewGet()

Vue d'ensemble plateforme (admin)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAnalyticsApi();

try {
    final response = api.analyticsAdminOverviewGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalyticsApi->analyticsAdminOverviewGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AdminOverview**](AdminOverview.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **analyticsDoctorOverviewGet**
> DoctorOverview analyticsDoctorOverviewGet(from, to)

Vue d'ensemble pour le médecin connecté

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAnalyticsApi();
final Date from = 2013-10-20; // Date | 
final Date to = 2013-10-20; // Date | 

try {
    final response = api.analyticsDoctorOverviewGet(from, to);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalyticsApi->analyticsDoctorOverviewGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **Date**|  | [optional] 
 **to** | **Date**|  | [optional] 

### Return type

[**DoctorOverview**](DoctorOverview.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **analyticsDoctorTimeseriesGet**
> TimeSeries analyticsDoctorTimeseriesGet(metric, from, to, granularity)

Séries temporelles (RDV, revenus, no-show)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAnalyticsApi();
final String metric = metric_example; // String | 
final Date from = 2013-10-20; // Date | 
final Date to = 2013-10-20; // Date | 
final String granularity = granularity_example; // String | 

try {
    final response = api.analyticsDoctorTimeseriesGet(metric, from, to, granularity);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalyticsApi->analyticsDoctorTimeseriesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **metric** | **String**|  | 
 **from** | **Date**|  | 
 **to** | **Date**|  | 
 **granularity** | **String**|  | [optional] [default to 'day']

### Return type

[**TimeSeries**](TimeSeries.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

