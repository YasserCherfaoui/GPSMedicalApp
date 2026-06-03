//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:gps_medical_api/src/serializers.dart';
import 'package:gps_medical_api/src/auth/api_key_auth.dart';
import 'package:gps_medical_api/src/auth/basic_auth.dart';
import 'package:gps_medical_api/src/auth/bearer_auth.dart';
import 'package:gps_medical_api/src/auth/oauth.dart';
import 'package:gps_medical_api/src/api/admin_api.dart';
import 'package:gps_medical_api/src/api/analytics_api.dart';
import 'package:gps_medical_api/src/api/appointments_api.dart';
import 'package:gps_medical_api/src/api/auth_api.dart';
import 'package:gps_medical_api/src/api/availability_api.dart';
import 'package:gps_medical_api/src/api/doctors_api.dart';
import 'package:gps_medical_api/src/api/geolocation_api.dart';
import 'package:gps_medical_api/src/api/medical_records_api.dart';
import 'package:gps_medical_api/src/api/messaging_api.dart';
import 'package:gps_medical_api/src/api/notifications_api.dart';
import 'package:gps_medical_api/src/api/patients_api.dart';
import 'package:gps_medical_api/src/api/payments_api.dart';
import 'package:gps_medical_api/src/api/reviews_api.dart';
import 'package:gps_medical_api/src/api/search_api.dart';
import 'package:gps_medical_api/src/api/system_api.dart';
import 'package:gps_medical_api/src/api/teleconsultation_api.dart';

class GpsMedicalApi {
  static const String basePath = r'https://api.gpsmedical.dz/v1';

  final Dio dio;
  final Serializers serializers;

  GpsMedicalApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the OAuth token associated with the given [name].
  ///
  /// If no [OAuthInterceptor] is registered or no token exists for the given
  /// [name], this method has no effect.
  void removeOAuthToken(String name) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens.remove(name);
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the bearer authentication token associated with the given [name].
  ///
  /// If no [BearerAuthInterceptor] is registered or no token exists for the
  /// given [name], this method has no effect.
  void removeBearerAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens.remove(name);
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  /// Removes the basic authentication credentials associated with the given [name].
  ///
  /// If no [BasicAuthInterceptor] is registered or no credentials exist for the
  /// given [name], this method has no effect.
  void removeBasicAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo.remove(name);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Removes the API key associated with the given [name].
  ///
  /// If no [ApiKeyAuthInterceptor] is registered or no API key exists for the
  /// given [name], this method has no effect.
  void removeApiKey(String name) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys.remove(name);
    }
  }

  /// Get AdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AdminApi getAdminApi() {
    return AdminApi(dio, serializers);
  }

  /// Get AnalyticsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AnalyticsApi getAnalyticsApi() {
    return AnalyticsApi(dio, serializers);
  }

  /// Get AppointmentsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AppointmentsApi getAppointmentsApi() {
    return AppointmentsApi(dio, serializers);
  }

  /// Get AuthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthApi getAuthApi() {
    return AuthApi(dio, serializers);
  }

  /// Get AvailabilityApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AvailabilityApi getAvailabilityApi() {
    return AvailabilityApi(dio, serializers);
  }

  /// Get DoctorsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DoctorsApi getDoctorsApi() {
    return DoctorsApi(dio, serializers);
  }

  /// Get GeolocationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GeolocationApi getGeolocationApi() {
    return GeolocationApi(dio, serializers);
  }

  /// Get MedicalRecordsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MedicalRecordsApi getMedicalRecordsApi() {
    return MedicalRecordsApi(dio, serializers);
  }

  /// Get MessagingApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MessagingApi getMessagingApi() {
    return MessagingApi(dio, serializers);
  }

  /// Get NotificationsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NotificationsApi getNotificationsApi() {
    return NotificationsApi(dio, serializers);
  }

  /// Get PatientsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PatientsApi getPatientsApi() {
    return PatientsApi(dio, serializers);
  }

  /// Get PaymentsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PaymentsApi getPaymentsApi() {
    return PaymentsApi(dio, serializers);
  }

  /// Get ReviewsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ReviewsApi getReviewsApi() {
    return ReviewsApi(dio, serializers);
  }

  /// Get SearchApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SearchApi getSearchApi() {
    return SearchApi(dio, serializers);
  }

  /// Get SystemApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SystemApi getSystemApi() {
    return SystemApi(dio, serializers);
  }

  /// Get TeleconsultationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TeleconsultationApi getTeleconsultationApi() {
    return TeleconsultationApi(dio, serializers);
  }
}
