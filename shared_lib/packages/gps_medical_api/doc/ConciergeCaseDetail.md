# gps_medical_api.model.ConciergeCaseDetail

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**patient** | [**ConciergePatientSummary**](ConciergePatientSummary.md) |  | 
**conciergeUserId** | **String** |  | 
**conciergeName** | **String** |  | [optional] 
**threadId** | **String** |  | 
**status** | [**ConciergeCaseStatus**](ConciergeCaseStatus.md) |  | 
**note** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**updatedAt** | [**DateTime**](DateTime.md) |  | 
**upcomingAppointments** | [**BuiltList&lt;ConciergeUpcomingAppointment&gt;**](ConciergeUpcomingAppointment.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


