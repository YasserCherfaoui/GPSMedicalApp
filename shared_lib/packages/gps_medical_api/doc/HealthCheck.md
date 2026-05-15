# gps_medical_api.model.HealthCheck

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | **String** |  | 
**db** | **String** | `ok` si PostgreSQL répond au ping, sinon `error` | 
**redis** | **String** |  | 
**storage** | **String** | `disabled` si le stockage objet n'est pas configuré ; `ok` si le bucket répond ; `error` en cas d'échec de sonde.  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


