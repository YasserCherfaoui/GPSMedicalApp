import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

import '../auth/auth_user_snapshot.dart';
import '../auth/token_store.dart';
import '../constants/api_constants.dart';

const String _retriedExtraKey = 'gps_auth_retried';
const Duration _refreshLeadTime = Duration(seconds: 90);

/// Refreshes an access token using a refresh token (typically `POST /auth/refresh`).
typedef TokenRefresher = Future<TokenPair?> Function(String refreshToken);

/// Injects `Authorization: Bearer …` and refreshes tokens once on HTTP 401.
class AuthRefreshInterceptor extends Interceptor {
  AuthRefreshInterceptor({
    required this.dio,
    required this.tokenStore,
    required TokenRefresher refreshTokens,
    this.onSessionExpired,
    this.onTokensRefreshed,
  }) : _refreshTokens = refreshTokens;

  factory AuthRefreshInterceptor.withDio({
    required Dio dio,
    required TokenStore tokenStore,
    required Dio refreshDio,
    Future<void> Function()? onSessionExpired,
    void Function(TokenPair pair)? onTokensRefreshed,
    Serializers? serializers,
  }) {
    final resolvedSerializers = serializers ?? standardSerializers;
    return AuthRefreshInterceptor(
      dio: dio,
      tokenStore: tokenStore,
      onSessionExpired: onSessionExpired,
      onTokensRefreshed: onTokensRefreshed,
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
  final void Function(TokenPair pair)? onTokensRefreshed;

  /// Process-wide lock so two Dio stacks cannot rotate the same refresh JWT.
  static Future<TokenPair?>? _sharedRefreshInFlight;

  @visibleForTesting
  static void debugResetSharedRefresh() {
    _sharedRefreshInFlight = null;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    unawaited(_prepareRequest(options, handler));
  }

  Future<void> _prepareRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      if (_shouldRefreshProactively(options)) {
        final refreshToken = tokenStore.refreshToken;
        if (refreshToken != null && refreshToken.isNotEmpty) {
          await _refreshShared(refreshToken);
        }
      }
    } catch (_) {
      // Attach whatever token we still have; 401 handling can retry.
    }
    _attachAccessToken(options);
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    try {
      final retried = await _retryAfterRefresh(err.requestOptions);
      if (retried != null) {
        handler.resolve(retried);
        return;
      }
      handler.next(err);
    } on DioException catch (e) {
      handler.next(e);
    } catch (e) {
      handler.next(err);
    }
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

    try {
      final retried = await _retryAfterRefresh(response.requestOptions);
      if (retried != null) {
        handler.resolve(retried);
        return;
      }
      handler.next(response);
    } on DioException catch (e) {
      handler.reject(e);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.unknown,
          error: e,
        ),
      );
    }
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

    final pair = await _refreshShared(refreshToken);
    if (pair == null || pair.accessToken == null || pair.accessToken!.isEmpty) {
      return null;
    }

    final retryOptions = requestOptions;
    retryOptions.extra = Map<String, dynamic>.from(retryOptions.extra)
      ..[_retriedExtraKey] = true;
    retryOptions.headers['Authorization'] = 'Bearer ${pair.accessToken}';

    final retryDio = Dio(dio.options)
      ..httpClientAdapter = dio.httpClientAdapter;
    return await retryDio.fetch<dynamic>(retryOptions);
  }

  Future<TokenPair?> _refreshShared(String refreshToken) {
    final existing = _pairFromStore();
    if (existing != null && existing.refreshToken != refreshToken) {
      return Future<TokenPair?>.value(existing);
    }

    final inFlight = _sharedRefreshInFlight;
    if (inFlight != null) {
      return inFlight;
    }

    final done = Completer<TokenPair?>();
    _sharedRefreshInFlight = done.future;
    unawaited(
      Future<void>(() async {
        try {
          done.complete(await _refreshAndStore(refreshToken));
        } catch (_) {
          if (!done.isCompleted) {
            done.complete(null);
          }
        } finally {
          if (identical(_sharedRefreshInFlight, done.future)) {
            _sharedRefreshInFlight = null;
          }
        }
      }),
    );
    return done.future;
  }

  Future<TokenPair?> _refreshAndStore(String refreshToken) async {
    final existing = _pairFromStore();
    if (existing != null && existing.refreshToken != refreshToken) {
      return existing;
    }

    try {
      final refreshed = await _refreshTokens(refreshToken);
      if (refreshed == null ||
          refreshed.accessToken == null ||
          refreshed.refreshToken == null) {
        return _pairFromStore();
      }
      await tokenStore.saveTokens(refreshed);
      onTokensRefreshed?.call(refreshed);
      return refreshed;
    } on DioException catch (e) {
      final rotated = _pairFromStore();
      if (rotated != null && rotated.refreshToken != refreshToken) {
        return rotated;
      }
      if (_isDefinitiveAuthFailure(e)) {
        await onSessionExpired?.call();
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  TokenPair? _pairFromStore() {
    final access = tokenStore.accessToken;
    final refresh = tokenStore.refreshToken;
    if (access == null ||
        access.isEmpty ||
        refresh == null ||
        refresh.isEmpty) {
      return null;
    }
    return TokenPair(
      (b) => b
        ..accessToken = access
        ..refreshToken = refresh
        ..expiresIn = 0,
    );
  }

  bool _isDefinitiveAuthFailure(DioException error) {
    final status = error.response?.statusCode;
    return status == 401 || status == 403;
  }

  bool _shouldRefreshProactively(RequestOptions options) {
    if (!_shouldAttachAccessToken(options) || _isPublicPath(options.uri.path)) {
      return false;
    }
    final access = tokenStore.accessToken;
    if (access == null || access.isEmpty) {
      return false;
    }
    final expiry = AuthUserSnapshot.expiryFromJwt(access);
    if (expiry == null) {
      return false;
    }
    return !expiry.isAfter(DateTime.now().toUtc().add(_refreshLeadTime));
  }

  void _attachAccessToken(RequestOptions options) {
    final accessToken = tokenStore.accessToken;
    if (accessToken != null && _shouldAttachAccessToken(options)) {
      options.headers['Authorization'] = 'Bearer $accessToken';
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
