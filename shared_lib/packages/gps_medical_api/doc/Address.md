# gps_medical_api.model.Address

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**line1** | **String** |  | [optional] 
**line2** | **String** |  | [optional] 
**country** | [**CountryCode**](CountryCode.md) | Pays de l'adresse (optionnel). | [optional] 
**city** | **String** | Ville en texte libre — utilisé pour l'offre non-DZ (UE) où wilaya / commune ne s'appliquent pas.  | [optional] 
**communeId** | **String** | Identifiant commune — **DZ uniquement** ; optionnel sinon. | [optional] 
**communeName** | **String** |  | [optional] 
**wilayaCode** | **String** | Code wilaya — **DZ uniquement** ; optionnel sinon. | [optional] 
**wilayaName** | **String** |  | [optional] 
**postalCode** | **String** |  | [optional] 
**latitude** | **double** |  | [optional] 
**longitude** | **double** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


