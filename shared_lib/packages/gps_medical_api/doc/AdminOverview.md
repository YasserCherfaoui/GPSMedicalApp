# gps_medical_api.model.AdminOverview

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**usersTotal** | **int** |  | [optional] 
**patientsActive** | **int** |  | [optional] 
**doctorsActive** | **int** |  | [optional] 
**doctorsPendingVerification** | **int** |  | [optional] 
**doctorsApprovedPendingActivation** | **int** | Effectif des médecins TN en quarantaine (`approved_pending_activation`). Compteur pipeline d'offre TN (B-14.2).  | [optional] 
**appointmentsLast30d** | **int** |  | [optional] 
**gmvDzdLast30d** | **int** |  | [optional] 
**avgAppointmentsPerActiveUser** | **double** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


