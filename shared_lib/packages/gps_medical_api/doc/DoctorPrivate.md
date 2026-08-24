# gps_medical_api.model.DoctorPrivate

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**fullName** | **String** |  | [optional] 
**title** | **String** |  | [optional] 
**gender** | **String** |  | [optional] 
**photoUrl** | **String** |  | [optional] 
**bio** | **String** |  | [optional] 
**specialties** | [**BuiltList&lt;Specialty&gt;**](Specialty.md) |  | [optional] 
**languages** | **BuiltList&lt;String&gt;** |  | [optional] 
**consultationFeeDzd** | **int** |  | [optional] 
**acceptsCnas** | **bool** |  | [optional] 
**acceptsCasnos** | **bool** |  | [optional] 
**offersTelehealth** | **bool** |  | [optional] 
**practiceAddress** | [**Address**](Address.md) |  | [optional] 
**ratingAverage** | **double** |  | [optional] 
**ratingCount** | **int** |  | [optional] 
**verified** | **bool** |  | [optional] 
**clinicAffiliations** | [**BuiltList&lt;ClinicSpecialistAffiliation&gt;**](ClinicSpecialistAffiliation.md) |  | [optional] 
**phone** | **String** | Numéro mobile au format E.164 — Algérie (`+213[5-7]########`) ou Tunisie (`+216[2459]#######`). Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (`DZ` ↔ `+213`, `TN` ↔ `+216`) ; sinon `422 phone_country_mismatch`.  | [optional] 
**email** | **String** |  | [optional] 
**country** | [**CountryCode**](CountryCode.md) | Pays du compte médecin (lecture seule, issu de `auth.users`).  | [optional] 
**councilNumber** | **String** | N° au Conseil de l'Ordre | [optional] 
**verificationStatus** | [**DoctorVerificationStatus**](DoctorVerificationStatus.md) |  | [optional] 
**verificationComment** | **String** | Admin feedback from the verification decision (more_info / rejected). | [optional] 
**credentials** | [**BuiltList&lt;Credential&gt;**](Credential.md) |  | [optional] 
**confirmationPolicy** | **String** |  | [optional] 
**bookingWindowDays** | **int** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


