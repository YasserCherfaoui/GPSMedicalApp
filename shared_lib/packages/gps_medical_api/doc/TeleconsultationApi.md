# gps_medical_api.api.TeleconsultationApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getTeleconsultLabPage**](TeleconsultationApi.md#getteleconsultlabpage) | **GET** /call/{roomId} | Page HTML de l&#39;appel de test (lien à partager)
[**joinTeleconsultLabCall**](TeleconsultationApi.md#jointeleconsultlabcall) | **POST** /call/{roomId}/join | Rejoint la salle de test et émet les identifiants ICE/TURN
[**listTeleconsultLabSignals**](TeleconsultationApi.md#listteleconsultlabsignals) | **GET** /call/{roomId}/signals | Signaux WebRTC du pair dans la salle de test
[**listTeleconsultationSignals**](TeleconsultationApi.md#listteleconsultationsignals) | **GET** /teleconsultations/{appointmentId}/signals | Récupère les signaux WebRTC du pair depuis un curseur
[**postTeleconsultLabSignal**](TeleconsultationApi.md#postteleconsultlabsignal) | **POST** /call/{roomId}/signals | Publie un signal WebRTC dans la salle de test
[**postTeleconsultationSignal**](TeleconsultationApi.md#postteleconsultationsignal) | **POST** /teleconsultations/{appointmentId}/signals | Publie un message de signalisation WebRTC (SDP ou ICE)
[**startTeleconsultLabCall**](TeleconsultationApi.md#startteleconsultlabcall) | **GET** /call | Crée une salle de test et redirige vers le lien partageable
[**teleconsultationsAppointmentIdEndPost**](TeleconsultationApi.md#teleconsultationsappointmentidendpost) | **POST** /teleconsultations/{appointmentId}/end | Clôture explicite de la session (côté médecin)
[**teleconsultationsAppointmentIdSessionPost**](TeleconsultationApi.md#teleconsultationsappointmentidsessionpost) | **POST** /teleconsultations/{appointmentId}/session | Création / récupération de la session WebRTC liée à un RDV
[**teleconsultationsTurnCredentialsGet**](TeleconsultationApi.md#teleconsultationsturncredentialsget) | **GET** /teleconsultations/turn-credentials | Identifiants TURN éphémères


# **getTeleconsultLabPage**
> String getTeleconsultLabPage(roomId)

Page HTML de l'appel de test (lien à partager)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.getTeleconsultLabPage(roomId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->getTeleconsultLabPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **String**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/html, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **joinTeleconsultLabCall**
> TeleconsultLabJoin joinTeleconsultLabCall(roomId, teleconsultLabJoinWrite)

Rejoint la salle de test et émet les identifiants ICE/TURN

Le premier pair est l'offreur WebRTC ; le second répond. Maximum deux participants. Crée une session lab éphémère (mémoire, pas de RDV). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final TeleconsultLabJoinWrite teleconsultLabJoinWrite = ; // TeleconsultLabJoinWrite | 

try {
    final response = api.joinTeleconsultLabCall(roomId, teleconsultLabJoinWrite);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->joinTeleconsultLabCall: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **String**|  | 
 **teleconsultLabJoinWrite** | [**TeleconsultLabJoinWrite**](TeleconsultLabJoinWrite.md)|  | [optional] 

### Return type

[**TeleconsultLabJoin**](TeleconsultLabJoin.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listTeleconsultLabSignals**
> TeleconsultLabSignalList listTeleconsultLabSignals(roomId, peerId, since, waitMs)

Signaux WebRTC du pair dans la salle de test

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final String peerId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int since = 789; // int | 
final int waitMs = 56; // int | 

try {
    final response = api.listTeleconsultLabSignals(roomId, peerId, since, waitMs);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->listTeleconsultLabSignals: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **String**|  | 
 **peerId** | **String**|  | 
 **since** | **int**|  | [optional] [default to 0]
 **waitMs** | **int**|  | [optional] [default to 0]

### Return type

[**TeleconsultLabSignalList**](TeleconsultLabSignalList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listTeleconsultationSignals**
> TeleconsultSignalList listTeleconsultationSignals(appointmentId, since, waitMs)

Récupère les signaux WebRTC du pair depuis un curseur

Retourne uniquement les signaux émis par l'autre participant, avec `seq` strictement supérieur à `since`. Aucun média n'est stocké. `wait_ms` active un long-poll (jusqu'à 10 s) pour éviter un polling HTTP agressif pendant l'appel. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int since = 789; // int | Curseur — signaux du pair avec `seq` > since.
final int waitMs = 56; // int | Si > 0, le serveur attend jusqu'à `wait_ms` millisecondes qu'un signal arrive. 0 = réponse immédiate. 

try {
    final response = api.listTeleconsultationSignals(appointmentId, since, waitMs);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->listTeleconsultationSignals: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 
 **since** | **int**| Curseur — signaux du pair avec `seq` > since. | [optional] [default to 0]
 **waitMs** | **int**| Si > 0, le serveur attend jusqu'à `wait_ms` millisecondes qu'un signal arrive. 0 = réponse immédiate.  | [optional] [default to 0]

### Return type

[**TeleconsultSignalList**](TeleconsultSignalList.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postTeleconsultLabSignal**
> TeleconsultSignal postTeleconsultLabSignal(roomId, teleconsultLabSignalWrite)

Publie un signal WebRTC dans la salle de test

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final TeleconsultLabSignalWrite teleconsultLabSignalWrite = ; // TeleconsultLabSignalWrite | 

try {
    final response = api.postTeleconsultLabSignal(roomId, teleconsultLabSignalWrite);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->postTeleconsultLabSignal: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **String**|  | 
 **teleconsultLabSignalWrite** | [**TeleconsultLabSignalWrite**](TeleconsultLabSignalWrite.md)|  | 

### Return type

[**TeleconsultSignal**](TeleconsultSignal.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postTeleconsultationSignal**
> TeleconsultSignal postTeleconsultationSignal(appointmentId, teleconsultSignalWrite)

Publie un message de signalisation WebRTC (SDP ou ICE)

Relais REST pour l'échange d'offre/réponse SDP et de candidats ICE entre le patient et le médecin du rendez-vous. Les messages ne contiennent pas de média (ADR 0012). Un nouvel `offer` remplace l'offre, la réponse et les candidats ICE précédents de la session. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final TeleconsultSignalWrite teleconsultSignalWrite = ; // TeleconsultSignalWrite | 

try {
    final response = api.postTeleconsultationSignal(appointmentId, teleconsultSignalWrite);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->postTeleconsultationSignal: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 
 **teleconsultSignalWrite** | [**TeleconsultSignalWrite**](TeleconsultSignalWrite.md)|  | 

### Return type

[**TeleconsultSignal**](TeleconsultSignal.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startTeleconsultLabCall**
> startTeleconsultLabCall()

Crée une salle de test et redirige vers le lien partageable

Page d'essai WebRTC (deux navigateurs, même URL). Activée par défaut en `ENV=development`, sinon uniquement si `TELECONSULT_LAB=true`. Aucun média n'est stocké (ADR 0012). Utilise le même driver TURN que la téléconsultation (`TURN_DRIVER`). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();

try {
    api.startTeleconsultLabCall();
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->startTeleconsultLabCall: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **teleconsultationsAppointmentIdEndPost**
> TeleSession teleconsultationsAppointmentIdEndPost(appointmentId, teleconsultationsAppointmentIdEndPostRequest)

Clôture explicite de la session (côté médecin)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final TeleconsultationsAppointmentIdEndPostRequest teleconsultationsAppointmentIdEndPostRequest = ; // TeleconsultationsAppointmentIdEndPostRequest | 

try {
    final response = api.teleconsultationsAppointmentIdEndPost(appointmentId, teleconsultationsAppointmentIdEndPostRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->teleconsultationsAppointmentIdEndPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 
 **teleconsultationsAppointmentIdEndPostRequest** | [**TeleconsultationsAppointmentIdEndPostRequest**](TeleconsultationsAppointmentIdEndPostRequest.md)|  | [optional] 

### Return type

[**TeleSession**](TeleSession.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **teleconsultationsAppointmentIdSessionPost**
> TeleSession teleconsultationsAppointmentIdSessionPost(appointmentId)

Création / récupération de la session WebRTC liée à un RDV

Disponible 15 min avant l'heure du RDV jusqu'à `end_at + 30 min`. Renvoie un jeton ICE/TURN à durée limitée. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();
final String appointmentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.teleconsultationsAppointmentIdSessionPost(appointmentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->teleconsultationsAppointmentIdSessionPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appointmentId** | **String**|  | 

### Return type

[**TeleSession**](TeleSession.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **teleconsultationsTurnCredentialsGet**
> TurnCredentials teleconsultationsTurnCredentialsGet()

Identifiants TURN éphémères

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getTeleconsultationApi();

try {
    final response = api.teleconsultationsTurnCredentialsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling TeleconsultationApi->teleconsultationsTurnCredentialsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**TurnCredentials**](TurnCredentials.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

