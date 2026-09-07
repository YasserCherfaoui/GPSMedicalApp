# gps_medical_api.model.ClinicScheduleTemplate

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**serviceId** | **String** |  | [optional] 
**weekday** | **int** |  | [optional] 
**startTime** | **String** |  | [optional] 
**endTime** | **String** |  | [optional] 
**slotDurationMinutes** | **int** |  | [optional] 
**mode** | **String** |  | [optional] 
**capacity** | **int** |  | [optional] 
**active** | **bool** |  | [optional] 
**understaffed** | **bool** | null = zero active roster (advisory N/A). true = capacity exceeds donated concurrent coverage. false = coverage adequate. Advisory only — never blocks writes.  | [optional] 
**understaffedShortfall** | [**ClinicUnderstaffedShortfall**](ClinicUnderstaffedShortfall.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


