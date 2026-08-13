# gps_medical_api.model.UserAdmin

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**phone** | **String** | Numéro mobile au format E.164 — Algérie (`+213[5-7]########`) ou Tunisie (`+216[2459]#######`). Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (`DZ` ↔ `+213`, `TN` ↔ `+216`) ; sinon `422 phone_country_mismatch`.  | [optional] 
**email** | **String** |  | [optional] 
**role** | **String** |  | [optional] 
**fullName** | **String** |  | [optional] 
**status** | **String** |  | [optional] 
**country** | [**CountryCode**](CountryCode.md) | Fixé à l'inscription ; jamais mutable via l'API. | [optional] 
**dataResidencyMode** | [**DataResidencyMode**](DataResidencyMode.md) | Dérivé de `country` : `DZ` → `device_only`, `TN` → `server`.  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**lastLoginAt** | [**DateTime**](DateTime.md) |  | [optional] 
**loginCount** | **int** |  | [optional] 
**suspendedUntil** | [**DateTime**](DateTime.md) |  | [optional] 
**suspensionReason** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


