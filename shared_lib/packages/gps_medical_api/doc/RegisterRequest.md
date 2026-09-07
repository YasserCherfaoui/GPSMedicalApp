# gps_medical_api.model.RegisterRequest

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**country** | [**CountryCode**](CountryCode.md) | Pays du compte. Obligatoire. Immuable après OTP.  | 
**phone** | **String** | Numéro mobile au format E.164. Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (validation libphonenumber pour les 29 `CountryCode`) ; sinon `422 phone_country_mismatch`.  | 
**nin** | **String** | **Deprecated / ignored (v1.2.8).** Optionnel ; si présent, le serveur l'ignore (pas de validation, pas de persistance pour les nouvelles inscriptions). Conservé pour compatibilité des clients stragglers.  | [optional] 
**password** | **String** |  | 
**role** | **String** | `patient`, `specialist`, ou `clinic_owner`. `clinic_owner` peut aussi être accordé à `POST /clinics`. `specialist` + `country=TN` est accepté (v1.1.1) ; l'activation marché est une étape séparée.  | 
**fullName** | **String** |  | 
**email** | **String** |  | [optional] 
**consentDataProcessing** | **bool** | Consentement obligatoire au traitement des données personnelles (termes légaux du pays). | 
**consentHealthData** | **bool** | Consentement obligatoire au traitement des données de santé. | 
**consentAnpdpTerms** | **bool** | Acceptation des conditions légales applicables au pays de l'utilisateur (libellé historique `anpdp_terms` — rename cosmétique différé).  | 
**consentMarketing** | **bool** | Optionnel — communications marketing (révocable sans suspension de compte). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


