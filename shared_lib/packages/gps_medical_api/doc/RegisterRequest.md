# gps_medical_api.model.RegisterRequest

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**phone** | **String** | Numéro algérien au format E.164 | 
**nin** | **String** | Numéro d'Identification National (NIN) algérien — 18 chiffres, institué par le décret exécutif n° 10-210 (2010) et reconduit par le décret de 2023. La structure officielle des 18 chiffres est :  | Positions | Lg | Signification | |---|---|---| | 1 | 1 | Sexe (`1` = homme, `2` = femme) | | 2 | 1 | Code mention (naissance régulière, transcription, naturalisation, …) | | 3–5 | 3 | Trois derniers chiffres de l'année d'inscription au registre | | 6–9 | 4 | Code commune (ou pays, pour les naissances à l'étranger) | | 10–14 | 5 | Numéro d'acte de naissance | | 15–16 | 2 | Numéro de série du registre pour l'année | | 17–18 | 2 | Clé de contrôle |  Le format est validé côté serveur (longueur, chiffres uniquement, sexe, année d'inscription résolvable en `19xx`/`20xx`, code commune non nul, pas de chiffre répété). La clé de contrôle n'est **pas** vérifiée localement : l'algorithme officiel est de la responsabilité de l'API gouvernementale.  La vérification auprès de l'API gouvernementale est *best-effort* : en cas d'indisponibilité, l'inscription est acceptée et le compte reste avec `nin_verification_status = pending` jusqu'à validation ultérieure (voir ADR 0005).  | 
**password** | **String** |  | 
**role** | **String** |  | 
**fullName** | **String** |  | 
**email** | **String** |  | [optional] 
**consentDataProcessing** | **bool** | Consentement obligatoire au traitement des données personnelles (ANPDP). | 
**consentHealthData** | **bool** | Consentement obligatoire au traitement des données de santé. | 
**consentAnpdpTerms** | **bool** | Acceptation des conditions légales / politique ANPDP. | 
**consentMarketing** | **bool** | Optionnel — communications marketing (révocable sans suspension de compte). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


