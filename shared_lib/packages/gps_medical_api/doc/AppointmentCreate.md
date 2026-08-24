# gps_medical_api.model.AppointmentCreate

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**origin** | **String** |  | [optional] [default to 'doctor_direct']
**doctorId** | **String** |  | [optional] 
**clinicId** | **String** |  | [optional] 
**serviceId** | **String** |  | [optional] 
**dependentId** | **String** |  | [optional] 
**startAt** | [**DateTime**](DateTime.md) |  | 
**mode** | **String** |  | 
**reason** | **String** |  | [optional] 
**slotLockToken** | **String** | Jeton de verrou optimiste obtenu via /availability | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


