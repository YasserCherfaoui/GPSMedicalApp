# gps_medical_api.api.SystemApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getHealth**](SystemApi.md#gethealth) | **GET** /health | Santé de l&#39;&#39;API — PostgreSQL et Redis


# **getHealth**
> HealthCheck getHealth()

Santé de l''API — PostgreSQL et Redis

Vérifie la disponibilité de PostgreSQL (`db`), de Redis (`redis`) et, si configuré, du stockage objet (`storage`). `storage=disabled` lorsque `STORAGE_PROVIDER` est vide ou `disabled` (uploads désactivés) ; cela ne dégrade pas le statut global. Une réponse `200` indique une plateforme prête (`status=ok`). Une réponse `503` indique une perte ou refus (`status=degraded`). Une corrélation requête/réponse est toujours possible via **X-Request-ID** renvoyé dans l''en-tête de réponse. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getSystemApi();

try {
    final response = api.getHealth();
    print(response);
} on DioException catch (e) {
    print('Exception when calling SystemApi->getHealth: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**HealthCheck**](HealthCheck.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

