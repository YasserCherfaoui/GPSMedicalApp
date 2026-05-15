# gps_medical_api.api.GeolocationApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**geoDoctorsNearbyGet**](GeolocationApi.md#geodoctorsnearbyget) | **GET** /geo/doctors/nearby | Médecins à proximité d&#39;un point GPS
[**geoWilayasGet**](GeolocationApi.md#geowilayasget) | **GET** /geo/wilayas | Liste des 58 wilayas algériennes
[**geoWilayasWilayaCodeCommunesGet**](GeolocationApi.md#geowilayaswilayacodecommunesget) | **GET** /geo/wilayas/{wilayaCode}/communes | Communes d&#39;une wilaya donnée


# **geoDoctorsNearbyGet**
> PaginatedDoctorsWithDistance geoDoctorsNearbyGet(lat, lng, radiusKm, specialtyId, page, pageSize)

Médecins à proximité d'un point GPS

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getGeolocationApi();
final double lat = 1.2; // double | 
final double lng = 1.2; // double | 
final num radiusKm = 8.14; // num | 
final String specialtyId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.geoDoctorsNearbyGet(lat, lng, radiusKm, specialtyId, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GeolocationApi->geoDoctorsNearbyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lat** | **double**|  | 
 **lng** | **double**|  | 
 **radiusKm** | **num**|  | [optional] [default to 5]
 **specialtyId** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedDoctorsWithDistance**](PaginatedDoctorsWithDistance.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **geoWilayasGet**
> BuiltList<Wilaya> geoWilayasGet()

Liste des 58 wilayas algériennes

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getGeolocationApi();

try {
    final response = api.geoWilayasGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling GeolocationApi->geoWilayasGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Wilaya&gt;**](Wilaya.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **geoWilayasWilayaCodeCommunesGet**
> BuiltList<Commune> geoWilayasWilayaCodeCommunesGet(wilayaCode)

Communes d'une wilaya donnée

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getGeolocationApi();
final String wilayaCode = 16; // String | 

try {
    final response = api.geoWilayasWilayaCodeCommunesGet(wilayaCode);
    print(response);
} on DioException catch (e) {
    print('Exception when calling GeolocationApi->geoWilayasWilayaCodeCommunesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **wilayaCode** | **String**|  | 

### Return type

[**BuiltList&lt;Commune&gt;**](Commune.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

