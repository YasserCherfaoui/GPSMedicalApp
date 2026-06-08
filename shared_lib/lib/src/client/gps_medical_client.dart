import 'package:dio/dio.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

import '../auth/token_store.dart';
import '../constants/api_constants.dart';
import 'auth_refresh_interceptor.dart';
import 'phase1_api.dart';

/// Configured HTTP client for GPS Médical (v1 API + root-level system routes).
class GpsMedicalClient {
  GpsMedicalClient({
    required this.tokenStore,
    this.onSessionExpired,
    String? apiRootUrl,
    Dio? v1Dio,
    Duration connectTimeout = const Duration(seconds: 15),
    Duration receiveTimeout = const Duration(seconds: 30),
  }) : apiRootUrl = resolveApiUrl(
         apiRootUrl ?? kDefaultApiRootUrl,
       ).replaceAll(RegExp(r'/+$'), ''),
       v1BaseUrl =
           '${resolveApiUrl(apiRootUrl ?? kDefaultApiRootUrl).replaceAll(RegExp(r'/+$'), '')}/v1' {
    final refreshDio = Dio(
      BaseOptions(
        baseUrl: v1BaseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: const {'Accept': 'application/json'},
      ),
    );

    final authenticatedDio =
        v1Dio ??
        Dio(
          BaseOptions(
            baseUrl: v1BaseUrl,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout,
            headers: const {'Accept': 'application/json'},
          ),
        );

    authenticatedDio.interceptors.add(
      AuthRefreshInterceptor.withDio(
        dio: authenticatedDio,
        tokenStore: tokenStore,
        refreshDio: refreshDio,
        onSessionExpired: onSessionExpired,
      ),
    );

    _v1 = GpsMedicalApi(
      dio: authenticatedDio,
      serializers: standardSerializers,
      interceptors: const [],
    );

    _root = GpsMedicalApi(
      dio: Dio(
        BaseOptions(
          baseUrl: this.apiRootUrl,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
          headers: const {'Accept': 'application/json'},
        ),
      ),
      serializers: standardSerializers,
      interceptors: const [],
    );
  }

  final String apiRootUrl;
  final String v1BaseUrl;
  final TokenStore tokenStore;
  final Future<void> Function()? onSessionExpired;

  late final GpsMedicalApi _v1;
  late final GpsMedicalApi _root;

  /// OpenAPI-generated client scoped to `/v1` (authenticated routes).
  GpsMedicalApi get v1 => _v1;

  /// OpenAPI-generated client scoped to API root (`/health`, JWKS).
  GpsMedicalApi get root => _root;

  /// Typed accessors for every Phase 1 backend route.
  Phase1Api get phase1 => Phase1Api(v1: _v1, root: _root);

  AuthApi get auth => _v1.getAuthApi();

  AdminApi get admin => _v1.getAdminApi();

  DoctorsApi get doctors => _v1.getDoctorsApi();

  MedicalRecordsApi get medicalRecords => _v1.getMedicalRecordsApi();

  PatientsApi get patients => _v1.getPatientsApi();

  SystemApi get system => _root.getSystemApi();

  GeolocationApi get geolocation => _v1.getGeolocationApi();

  AvailabilityApi get availability => _v1.getAvailabilityApi();

  AppointmentsApi get appointments => _v1.getAppointmentsApi();

  MessagingApi get messaging => _v1.getMessagingApi();

  NotificationsApi get notifications => _v1.getNotificationsApi();

  ReviewsApi get reviews => _v1.getReviewsApi();

  PaymentsApi get payments => _v1.getPaymentsApi();

  /// Sets the bearer token on the generated client's interceptor map.
  void applyBearerToken(String accessToken) {
    _v1.setBearerAuth(kBearerAuthSchemeName, accessToken);
  }

  /// Clears stored tokens and removes the bearer token from the Dio client.
  Future<void> signOut() async {
    await tokenStore.clearTokens();
    _v1.removeBearerAuth(kBearerAuthSchemeName);
  }
}
