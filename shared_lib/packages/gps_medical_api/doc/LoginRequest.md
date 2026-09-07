# gps_medical_api.model.LoginRequest

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**phone** | **String** | Numéro mobile au format E.164. Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (validation libphonenumber pour les 29 `CountryCode`) ; sinon `422 phone_country_mismatch`.  | 
**password** | **String** |  | 
**client** | **String** | `dashboard` — connexion réservée au tableau de bord (`admin` / `moderator` / `clinic_owner` / `clinic_admin`).  | [optional] [default to 'mobile']

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


