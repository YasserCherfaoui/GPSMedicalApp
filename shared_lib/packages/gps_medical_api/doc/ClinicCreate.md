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
**countryCode** | **String** | ISO 3166-1 alpha-2. DZ, TN, et codes UE-27. G-3 cleared (Amendment 2): approve active DZ + UE ; TN reste `approved_pending_activation` (G-2).  | 
**wilayaCode** | **String** | Requis pour `country_code=DZ` ; ignorer / omettre sinon. | [optional] 
**communeId** | **String** | DZ uniquement ; optionnel sinon. | [optional] 
**city** | **String** | Ville libre — recommandée hors DZ (persistée comme libellé géo). | [optional] 
**addressLine1** | **String** |  | 
**addressLine2** | **String** |  | [optional] 
**latitude** | **double** |  | 
**longitude** | **double** |  | 
**email** | **String** |  | [optional] 
**registreCommerce** | **String** |  | [optional] 
**agrementSante** | **String** |  | [optional] 
**confirmationPolicy** | **String** |  | [optional] [default to 'manual']

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


