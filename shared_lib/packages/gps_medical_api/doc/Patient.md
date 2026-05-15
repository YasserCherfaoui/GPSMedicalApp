# gps_medical_api.model.Patient

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**phone** | **String** | Numéro algérien au format E.164 | [optional] 
**email** | **String** |  | [optional] 
**role** | **String** |  | [optional] 
**fullName** | **String** |  | [optional] 
**status** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**birthDate** | [**Date**](Date.md) |  | [optional] 
**gender** | **String** |  | [optional] 
**bloodType** | **String** |  | [optional] 
**address** | [**Address**](Address.md) |  | [optional] 
**allergies** | **BuiltList&lt;String&gt;** |  | [optional] 
**chronicConditions** | **BuiltList&lt;String&gt;** |  | [optional] 
**insurance** | [**PatientAllOfInsurance**](PatientAllOfInsurance.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


