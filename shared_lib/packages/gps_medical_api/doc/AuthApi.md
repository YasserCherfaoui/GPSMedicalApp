# gps_medical_api.api.AuthApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**forgotPassword**](AuthApi.md#forgotpassword) | **POST** /auth/password/forgot | Demande de réinitialisation du mot de passe
[**getJWKS**](AuthApi.md#getjwks) | **GET** /.well-known/jwks.json | Clés publiques RSA pour vérifier les JWT (RS256)
[**getMe**](AuthApi.md#getme) | **GET** /auth/me | Renvoie l&#39;utilisateur courant
[**listMyConsents**](AuthApi.md#listmyconsents) | **GET** /me/consents | Liste l&#39;historique des consentements ANPDP du compte connecté
[**login**](AuthApi.md#login) | **POST** /auth/login | Connexion par téléphone + mot de passe
[**logout**](AuthApi.md#logout) | **POST** /auth/logout | Déconnexion (révocation du refresh token)
[**refreshTokens**](AuthApi.md#refreshtokens) | **POST** /auth/refresh | Rafraîchissement du jeton d&#39;accès
[**registerUser**](AuthApi.md#registeruser) | **POST** /auth/register | Inscription d&#39;un nouvel utilisateur (patient ou médecin)
[**resendOtp**](AuthApi.md#resendotp) | **POST** /auth/otp/resend | Renvoi d&#39;un OTP (cooldown 60 s)
[**resetPassword**](AuthApi.md#resetpassword) | **POST** /auth/password/reset | Réinitialisation effective du mot de passe
[**revokeMyConsent**](AuthApi.md#revokemyconsent) | **POST** /me/consents/revoke | Révoque un consentement actif
[**verifyOtp**](AuthApi.md#verifyotp) | **POST** /auth/otp/verify | Vérification du code OTP reçu par SMS


# **forgotPassword**
> forgotPassword(resendOtpRequest)

Demande de réinitialisation du mot de passe

Envoie un OTP à 6 chiffres au numéro fourni. La réponse `202` est toujours retournée (si le numéro est valide), même si aucun compte n'existe, afin d'éviter l'énumération d'utilisateurs. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();
final ResendOtpRequest resendOtpRequest = ; // ResendOtpRequest | 

try {
    api.forgotPassword(resendOtpRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->forgotPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resendOtpRequest** | [**ResendOtpRequest**](ResendOtpRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getJWKS**
> JWKS getJWKS()

Clés publiques RSA pour vérifier les JWT (RS256)

Document JWKS (RFC 7517) exposant la clé publique utilisée pour signer les jetons d'accès et de rafraîchissement. Les clients peuvent mettre ce document en cache ; la rotation se fait via le champ `kid`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();

try {
    final response = api.getJWKS();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->getJWKS: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JWKS**](JWKS.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMe**
> User getMe()

Renvoie l'utilisateur courant

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();

try {
    final response = api.getMe();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->getMe: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**User**](User.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyConsents**
> BuiltList<ConsentGrant> listMyConsents()

Liste l'historique des consentements ANPDP du compte connecté

Renvoie toutes les entrées du registre (accord et révocation), du plus récent au plus ancien. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();

try {
    final response = api.listMyConsents();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->listMyConsents: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ConsentGrant&gt;**](ConsentGrant.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> TokenPair login(loginRequest)

Connexion par téléphone + mot de passe

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();
final LoginRequest loginRequest = ; // LoginRequest | 

try {
    final response = api.login(loginRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

[**TokenPair**](TokenPair.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **logout**
> logout()

Déconnexion (révocation du refresh token)

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();

try {
    api.logout();
} on DioException catch (e) {
    print('Exception when calling AuthApi->logout: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshTokens**
> TokenPair refreshTokens(refreshTokensRequest)

Rafraîchissement du jeton d'accès

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();
final RefreshTokensRequest refreshTokensRequest = ; // RefreshTokensRequest | 

try {
    final response = api.refreshTokens(refreshTokensRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->refreshTokens: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshTokensRequest** | [**RefreshTokensRequest**](RefreshTokensRequest.md)|  | 

### Return type

[**TokenPair**](TokenPair.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerUser**
> RegisterResponse registerUser(registerRequest)

Inscription d'un nouvel utilisateur (patient ou médecin)

Crée un compte et envoie un OTP à 6 chiffres par SMS au numéro fourni. Le compte reste à l'état `pending_verification` jusqu'à validation OTP. L'OTP expire au bout de 5 minutes.  Le NIN est validé localement (format à 18 chiffres, sexe, année de naissance plausible). La vérification auprès de l'API gouvernementale est *best-effort* — voir `RegisterResponse.nin_verification_status`.  `409 Conflict` est retourné si le numéro de téléphone **ou** le NIN est déjà associé à un compte existant.  Les consentements ANPDP obligatoires (`consent_data_processing`, `consent_health_data`, `consent_anpdp_terms`) doivent tous être `true` ; sinon la requête est rejetée avec `422`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();
final RegisterRequest registerRequest = ; // RegisterRequest | 

try {
    final response = api.registerUser(registerRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->registerUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerRequest** | [**RegisterRequest**](RegisterRequest.md)|  | 

### Return type

[**RegisterResponse**](RegisterResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resendOtp**
> resendOtp(resendOtpRequest)

Renvoi d'un OTP (cooldown 60 s)

Génère et envoie un nouveau code OTP. Un cooldown de 60 secondes est appliqué — toute requête avant expiration retourne `429` avec un en-tête `Retry-After`. Pour préserver la confidentialité, la réponse ne révèle pas si le numéro est associé à un compte existant. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();
final ResendOtpRequest resendOtpRequest = ; // ResendOtpRequest | 

try {
    api.resendOtp(resendOtpRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->resendOtp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resendOtpRequest** | [**ResendOtpRequest**](ResendOtpRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetPassword**
> resetPassword(passwordResetRequest)

Réinitialisation effective du mot de passe

Vérifie le code OTP envoyé via `/auth/password/forgot` et applique le nouveau mot de passe. Après 3 codes erronés, l'OTP est invalidé. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();
final PasswordResetRequest passwordResetRequest = ; // PasswordResetRequest | 

try {
    api.resetPassword(passwordResetRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->resetPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **passwordResetRequest** | [**PasswordResetRequest**](PasswordResetRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeMyConsent**
> revokeMyConsent(revokeConsentRequest)

Révoque un consentement actif

Révoque un consentement **non essentiel** (`marketing`) ou déclenche la suspension du compte si un consentement **essentiel** est retiré (`data_processing`, `health_data`, `anpdp_terms`). La révocation d'un essentiel révoque les trois essentiels actifs et passe le compte en `suspended`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();
final RevokeConsentRequest revokeConsentRequest = ; // RevokeConsentRequest | 

try {
    api.revokeMyConsent(revokeConsentRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->revokeMyConsent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **revokeConsentRequest** | [**RevokeConsentRequest**](RevokeConsentRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyOtp**
> TokenPair verifyOtp(otpVerifyRequest)

Vérification du code OTP reçu par SMS

Active le compte (`status=active`) et retourne un couple de jetons si le code est correct. Après 3 tentatives erronées, l'OTP est invalidé et un nouveau doit être demandé. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();
final OtpVerifyRequest otpVerifyRequest = ; // OtpVerifyRequest | 

try {
    final response = api.verifyOtp(otpVerifyRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->verifyOtp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **otpVerifyRequest** | [**OtpVerifyRequest**](OtpVerifyRequest.md)|  | 

### Return type

[**TokenPair**](TokenPair.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

