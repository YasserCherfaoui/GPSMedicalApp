# gps_medical_api.model.ClinicPrivate

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**name** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**address** | [**Address**](Address.md) |  | [optional] 
**countryCode** | **String** | ISO 3166-1 alpha-2. DZ, TN, et codes Schengen-UE. Activation `verified=true` hors DZ bloquée jusqu'à G-3.  | [optional] 
**verified** | **bool** |  | [optional] 
**ratingAverage** | **double** |  | [optional] 
**ratingCount** | **int** |  | [optional] 
**offersTelehealth** | **bool** |  | [optional] 
**serviceTeasers** | [**BuiltList&lt;ClinicServiceTeaser&gt;**](ClinicServiceTeaser.md) |  | [optional] 
**ownerUserId** | **String** |  | [optional] 
**legalName** | **String** |  | [optional] 
**registreCommerce** | **String** |  | [optional] 
**agrementSante** | **String** |  | [optional] 
**status** | [**ClinicStatus**](ClinicStatus.md) |  | [optional] 
**verificationStatus** | [**ClinicVerificationStatus**](ClinicVerificationStatus.md) |  | [optional] 
**verificationComment** | **String** |  | [optional] 
**confirmationPolicy** | **String** |  | [optional] 
**bookingWindowDays** | **int** |  | [optional] 
**credentials** | [**BuiltList&lt;ClinicCredential&gt;**](ClinicCredential.md) |  | [optional] 
**email** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


