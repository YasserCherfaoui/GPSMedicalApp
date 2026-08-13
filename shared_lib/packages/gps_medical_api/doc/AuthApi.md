# gps_medical_api.api.AuthApi

## Load the API package
```dart
import 'package:gps_medical_api/api.dart';
```

All URIs are relative to *https://api.gpsmedical.dz/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkRegisterNin**](AuthApi.md#checkregisternin) | **POST** /auth/register/check-nin | Vérifier le format et la disponibilité d&#39;un NIN avant inscription
[**checkRegisterPhone**](AuthApi.md#checkregisterphone) | **POST** /auth/register/check-phone | Vérifier le format et la disponibilité d&#39;un numéro avant inscription
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


# **checkRegisterNin**
> checkRegisterNin(checkNinRequest)

Vérifier le format et la disponibilité d'un NIN avant inscription

Réservé aux inscriptions **DZ**. Valide le NIN (règles locales, voir `NINAlgerian`) et vérifie qu'aucun compte existant n'utilise déjà ce numéro. Les clients TN ne doivent pas appeler cet endpoint (le parcours NIN est sauté pour `country=TN`). 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();
final CheckNinRequest checkNinRequest = ; // CheckNinRequest | 

try {
    api.checkRegisterNin(checkNinRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->checkRegisterNin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **checkNinRequest** | [**CheckNinRequest**](CheckNinRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkRegisterPhone**
> checkRegisterPhone(checkPhoneRequest)

Vérifier le format et la disponibilité d'un numéro avant inscription

Valide le numéro E.164 (DZ `+213` ou TN `+216`) et vérifie qu'aucun compte existant n'utilise déjà ce téléphone. `country` est obligatoire : un indicatif qui ne correspond pas au pays déclaré renvoie `422` avec `phone_country_mismatch`. 

### Example
```dart
import 'package:gps_medical_api/api.dart';

final api = GpsMedicalApi().getAuthApi();
final CheckPhoneRequest checkPhoneRequest = ; // CheckPhoneRequest | 

try {
    api.checkRegisterPhone(checkPhoneRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->checkRegisterPhone: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **checkPhoneRequest** | [**CheckPhoneRequest**](CheckPhoneRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

Les applications mobiles omettent `client` (équivalent à `mobile`).  Avec `client=dashboard`, seuls les comptes `admin` et `moderator` reçoivent un couple de jetons. Les autres rôles obtiennent `401` avec le même message que des identifiants invalides (pas d'énumération de rôle). Les jetons émis portent la claim JWT `aud=dashboard` et sont requis pour les routes `/v1/admin/…`. 

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

Crée un compte et envoie un OTP à 6 chiffres par SMS au numéro fourni. Le compte reste à l'état `pending_verification` jusqu'à validation OTP. L'OTP expire au bout de 5 minutes.  **Pays (v1.1.0):** `country` est obligatoire (`DZ` | `TN`) et **immuable** après vérification OTP. Le numéro E.164 doit correspondre à l'indicatif du pays déclaré (`+213` ↔ `DZ`, `+216` ↔ `TN`) — sinon `422` avec `phone_country_mismatch`.  **NIN:** obligatoire si `country=DZ` (validation locale + vérification gouvernementale *best-effort* — voir `RegisterResponse.nin_verification_status`). Doit être **absent** si `country=TN` (`422 nin_not_applicable` s'il est fourni ; `422 nin_required` s'il manque pour DZ). Pour TN, `nin_verification_status = not_required`.  **Rôle:** `role=specialist` avec `country=TN` est rejeté (`422 country_not_supported_for_role`) — l'onboarding médecin TN est hors périmètre Phase 3.5.  `409 Conflict` est retourné si le numéro de téléphone **ou** le NIN (lorsque fourni) est déjà associé à un compte existant.  Les consentements obligatoires (`consent_data_processing`, `consent_health_data`, `consent_anpdp_terms`) doivent tous être `true` ; sinon la requête est rejetée avec `422`. Les versions de consentement sont scopées par pays (ex. `dz-1.2`, `tn-1.0`). 

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

