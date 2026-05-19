import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

import '../auth/token_store.dart';
import '../constants/api_constants.dart';

const String _retriedExtraKey = 'gps_auth_retried';

/// Refreshes an access token using a refresh token (typically `POST /auth/refresh`).
typedef TokenRefresher = Future<TokenPair?> Function(String refreshToken);

/// Injects `Authorization: Bearer …` and refreshes tokens once on HTTP 401.
class AuthRefreshInterceptor extends Interceptor {
  AuthRefreshInterceptor({
    required this.dio,
    required this.tokenStore,
    required TokenRefresher refreshTokens,
    this.onSessionExpired,
  }) : _refreshTokens = refreshTokens;

  factory AuthRefreshInterceptor.withDio({
    required Dio dio,
    required TokenStore tokenStore,
    required Dio refreshDio,
    Future<void> Function()? onSessionExpired,
    Serializers? serializers,
  }) {
    final resolvedSerializers = serializers ?? standardSerializers;
    return AuthRefreshInterceptor(
      dio: dio,
      tokenStore: tokenStore,
      onSessionExpired: onSessionExpired,
      refreshTokens: (refreshToken) async {
        final response = await AuthApi(refreshDio, resolvedSerializers)
            .refreshTokens(
              refreshTokensRequest: RefreshTokensRequest(
                (b) => b..refreshToken = refreshToken,
              ),
            );
        return response.data;
      },
    );
  }

  final Dio dio;
  final TokenStore tokenStore;
  final TokenRefresher _refreshTokens;
  final Future<void> Function()? onSessionExpired;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = tokenStore.accessToken;
    if (accessToken != null && _shouldAttachAccessToken(options)) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final retried = await _retryAfterRefresh(err.requestOptions);
    if (retried != null) {
      handler.resolve(retried);
      return;
    }
    handler.next(err);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode != 401) {
      handler.next(response);
      return;
    }

    final retried = await _retryAfterRefresh(response.requestOptions);
    if (retried != null) {
      handler.resolve(retried);
      return;
    }
    handler.next(response);
  }

  Future<Response<dynamic>?> _retryAfterRefresh(
    RequestOptions requestOptions,
  ) async {
    if (!_shouldAttemptRefresh(requestOptions)) {
      return null;
    }

    final refreshToken = tokenStore.refreshToken;
    if (refreshToken == null || refreshToken.isEmpty) {
      await onSessionExpired?.call();
      return null;
    }

    try {
      final pair = await _refreshTokens(refreshToken);
      if (pair == null ||
          pair.accessToken == null ||
          pair.refreshToken == null) {
        await onSessionExpired?.call();
        return null;
      }

      await tokenStore.saveTokens(pair);

      final retryOptions = requestOptions;
      retryOptions.extra = Map<String, dynamic>.from(retryOptions.extra)
        ..[_retriedExtraKey] = true;
      retryOptions.headers['Authorization'] = 'Bearer ${pair.accessToken}';

      final retryDio = Dio(dio.options)
        ..httpClientAdapter = dio.httpClientAdapter;
      return retryDio.fetch<dynamic>(retryOptions);
    } on DioException {
      await onSessionExpired?.call();
      return null;
    } catch (_) {
      await onSessionExpired?.call();
      return null;
    }
  }

  bool _shouldAttachAccessToken(RequestOptions options) {
    final secure = options.extra['secure'];
    if (secure is List) {
      if (secure.isEmpty) {
        return false;
      }
      return secure.any(
        (entry) =>
            entry is Map &&
            entry['type'] == 'http' &&
            entry['scheme']?.toString().toLowerCase() == 'bearer',
      );
    }
    return !_isPublicPath(options.uri.path);
  }

  bool _shouldAttemptRefresh(RequestOptions options) {
    if (options.extra[_retriedExtraKey] == true) {
      return false;
    }
    final path = _normalizedPath(options.uri.path);
    if (kAuthPathsWithoutRefresh.contains(path) ||
        _isPublicPath(options.uri.path)) {
      return false;
    }
    return tokenStore.refreshToken != null;
  }

  bool _isPublicPath(String path) {
    final normalized = _normalizedPath(path);
    if (normalized == '/health' || normalized == '/.well-known/jwks.json') {
      return true;
    }
    return kAuthPathsWithoutRefresh.contains(normalized);
  }

  String _normalizedPath(String path) {
    if (path.startsWith('/v1/')) {
      return path.substring(3);
    }
    if (path == '/v1') {
      return '/';
    }
    return path;
  }
}
