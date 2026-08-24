# gps_medical_api.model.ClinicCreate

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** |  | 
**legalName** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**countryCode** | **String** | ISO 3166-1 alpha-2. DZ, TN, et codes Schengen-UE. Activation `verified=true` hors DZ bloquée jusqu'à G-3.  | 
**wilayaCode** | **String** |  | 
**communeId** | **String** |  | [optional] 
**addressLine1** | **String** |  | 
**addressLine2** | **String** |  | [optional] 
**latitude** | **double** |  | 
**longitude** | **double** |  | 
**email** | **String** |  | [optional] 
**registreCommerce** | **String** |  | [optional] 
**agrementSante** | **String** |  | [optional] 
**confirmationPolicy** | **String** |  | [optional] [default to 'manual']

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


