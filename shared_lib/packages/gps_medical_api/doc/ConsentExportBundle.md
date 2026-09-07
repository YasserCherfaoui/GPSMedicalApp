# gps_medical_api.model.ConsentExportBundle

## Load the model package
```dart
import 'package:gps_medical_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exportId** | **String** |  | 
**generatedAt** | [**DateTime**](DateTime.md) |  | 
**userId** | **String** |  | [optional] 
**filters** | [**ConsentExportFilters**](ConsentExportFilters.md) |  | 
**grants** | [**BuiltList&lt;ConsentGrant&gt;**](ConsentGrant.md) |  | 
**signature** | **String** | Signature Ed25519 détachée (base64) | 
**verification** | [**ConsentExportVerification**](ConsentExportVerification.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


