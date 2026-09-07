# gps_medical_api.model.RegisterResponse

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**userId** | **String** |  | 
**otpExpiresAt** | [**DateTime**](DateTime.md) |  | 
**ninVerificationStatus** | **String** | Pour les nouvelles inscriptions (v1.2.8) : toujours `not_required` (collecte NIN retirée). Valeurs historiques `pending` / `verified` / `failed` peuvent encore apparaître sur d'anciens comptes.  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


