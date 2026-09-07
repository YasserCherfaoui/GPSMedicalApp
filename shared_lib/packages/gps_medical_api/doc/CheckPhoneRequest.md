# gps_medical_api.model.CheckPhoneRequest

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**phone** | **String** | Numéro mobile au format E.164. Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (validation libphonenumber pour les 29 `CountryCode`) ; sinon `422 phone_country_mismatch`.  | 
**country** | [**CountryCode**](CountryCode.md) | Doit correspondre à l'indicatif du `phone` (libphonenumber) — sinon `422 phone_country_mismatch`.  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


