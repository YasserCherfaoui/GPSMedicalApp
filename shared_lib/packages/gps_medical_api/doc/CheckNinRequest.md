# gps_medical_api.model.CheckNinRequest

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**nin** | **String** | **Deprecated (v1.2.8).** Conservé pour lectures historiques uniquement. La collecte NIN est retirée — le serveur ignore `nin` à l'inscription.  Numéro d'Identification National (NIN) algérien — 18 chiffres, institué par le décret exécutif n° 10-210 (2010) et reconduit par le décret de 2023. La structure officielle des 18 chiffres est :  | Positions | Lg | Signification | |---|---|---| | 1 | 1 | Sexe (`1` = homme, `2` = femme) | | 2 | 1 | Code mention (naissance régulière, transcription, naturalisation, …) | | 3–5 | 3 | Trois derniers chiffres de l'année d'inscription au registre | | 6–9 | 4 | Code commune (ou pays, pour les naissances à l'étranger) | | 10–14 | 5 | Numéro d'acte de naissance | | 15–16 | 2 | Numéro de série du registre pour l'année | | 17–18 | 2 | Clé de contrôle |  Le format était validé côté serveur ; la vérification gouvernementale *best-effort* (ADR 0005) est désactivée opérationnellement (ADR 0026).  | 
**country** | [**CountryCode**](CountryCode.md) | Ignoré (v1.2.8). L'endpoint `check-nin` est un no-op `204`.  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


