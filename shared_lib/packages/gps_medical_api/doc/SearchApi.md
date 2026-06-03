# gps_medical_api.api.SearchApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**searchDoctorsGet**](SearchApi.md#searchdoctorsget) | **GET** /search/doctors | Recherche multicritères de médecins
[**searchSuggestGet**](SearchApi.md#searchsuggestget) | **GET** /search/suggest | Suggestions auto-complétion (médecins, spécialités, communes)


# **searchDoctorsGet**
> PaginatedDoctors searchDoctorsGet(q, specialtyId, wilayaCode, communeId, gender, language, acceptsCnas, acceptsCasnos, maxFeeDzd, telehealth, availableWithinDays, lat, lng, sort, page, pageSize)

Recherche multicritères de médecins

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getSearchApi();
final String q = q_example; // String | Mot-clé libre (nom, spécialité, cabinet)
final String specialtyId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String wilayaCode = wilayaCode_example; // String | 
final String communeId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String gender = gender_example; // String | 
final BuiltList<String> language = ; // BuiltList<String> | Langue parlée (codes ISO 639-1)
final bool acceptsCnas = true; // bool | Conventionné CNAS
final bool acceptsCasnos = true; // bool | Conventionné CASNOS
final int maxFeeDzd = 56; // int | 
final bool telehealth = true; // bool | Propose la téléconsultation
final int availableWithinDays = 56; // int | 
final double lat = 1.2; // double | Latitude de l'utilisateur pour le tri par distance
final double lng = 1.2; // double | Longitude de l'utilisateur pour le tri par distance
final String sort = sort_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.searchDoctorsGet(q, specialtyId, wilayaCode, communeId, gender, language, acceptsCnas, acceptsCasnos, maxFeeDzd, telehealth, availableWithinDays, lat, lng, sort, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchDoctorsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String**| Mot-clé libre (nom, spécialité, cabinet) | [optional] 
 **specialtyId** | **String**|  | [optional] 
 **wilayaCode** | **String**|  | [optional] 
 **communeId** | **String**|  | [optional] 
 **gender** | **String**|  | [optional] [default to 'any']
 **language** | [**BuiltList&lt;String&gt;**](String.md)| Langue parlée (codes ISO 639-1) | [optional] 
 **acceptsCnas** | **bool**| Conventionné CNAS | [optional] 
 **acceptsCasnos** | **bool**| Conventionné CASNOS | [optional] 
 **maxFeeDzd** | **int**|  | [optional] 
 **telehealth** | **bool**| Propose la téléconsultation | [optional] 
 **availableWithinDays** | **int**|  | [optional] 
 **lat** | **double**| Latitude de l'utilisateur pour le tri par distance | [optional] 
 **lng** | **double**| Longitude de l'utilisateur pour le tri par distance | [optional] 
 **sort** | **String**|  | [optional] [default to 'relevance']
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**PaginatedDoctors**](PaginatedDoctors.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchSuggestGet**
> SearchSuggestGet200Response searchSuggestGet(q)

Suggestions auto-complétion (médecins, spécialités, communes)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getSearchApi();
final String q = q_example; // String | 

try {
    final response = api.searchSuggestGet(q);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SearchApi->searchSuggestGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String**|  | 

### Return type

[**SearchSuggestGet200Response**](SearchSuggestGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

