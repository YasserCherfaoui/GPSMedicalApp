# gps_medical_api.model.ClinicWithDistance

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**name** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**address** | [**Address**](Address.md) |  | [optional] 
**countryCode** | **String** | ISO 3166-1 alpha-2. DZ, TN, et codes UE-27. G-3 cleared (Amendment 2): approve active DZ + UE ; TN reste `approved_pending_activation` (G-2).  | [optional] 
**verified** | **bool** |  | [optional] 
**ratingAverage** | **double** |  | [optional] 
**ratingCount** | **int** |  | [optional] 
**offersTelehealth** | **bool** |  | [optional] 
**serviceTeasers** | [**BuiltList&lt;ClinicServiceTeaser&gt;**](ClinicServiceTeaser.md) |  | [optional] 
**distanceKm** | **double** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


