# gps_medical_api.model.ClinicAdminDetail

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
**countryCode** | **String** | ISO 3166-1 alpha-2. DZ, TN, et codes UE-27. G-3 cleared (Amendment 2): approve active DZ + UE ; TN reste `approved_pending_activation` (G-2).  | [optional] 
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
**underStaffed** | **bool** | Présent sur les réponses admin — `true` si au moins un créneau de capacité est sous-couvert par les blocs donnés du roster.  | [optional] 
**members** | [**BuiltList&lt;ClinicRosterMemberSummary&gt;**](ClinicRosterMemberSummary.md) |  | [optional] 
**donatedBlocksSummary** | [**ClinicDonatedBlocksSummary**](ClinicDonatedBlocksSummary.md) |  | [optional] 
**capacityVsDonatedHours** | [**ClinicCapacityVsDonatedHours**](ClinicCapacityVsDonatedHours.md) |  | [optional] 
**underStaffedAdvisory** | [**ClinicUnderStaffedAdvisory**](ClinicUnderStaffedAdvisory.md) |  | [optional] 
**ownerIsSeededStub** | **bool** | `true` si le propriétaire a `password_hash=SEEDED_NO_LOGIN` (profil OSM non revendiqué — hotfix 3.6).  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


