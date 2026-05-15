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
**ninVerificationStatus** | **String** | État courant de la vérification du NIN. `pending` si l'API gouvernementale est désactivée, indisponible ou n'a pas encore répondu ; `verified` si confirmée ; `failed` si l'API a répondu avec un rejet explicite (l'inscription a quand même abouti et le compte sera revu manuellement).  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


