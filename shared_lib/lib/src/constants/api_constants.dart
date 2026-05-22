import 'dart:io';
import 'package:flutter/foundation.dart';

/// OpenAPI security scheme name for JWT bearer auth (`components.securitySchemes`).
const String kBearerAuthSchemeName = 'bearerAuth';

/// Default API root (no `/v1` suffix) for local development.
String get kDefaultApiRootUrl {
  if (!kIsWeb && Platform.isAndroid) {
    return 'http://10.0.2.2:8080';
  }
  return 'http://localhost:8080';
}

/// Automatically rewrites `localhost` or `127.0.0.1` to `10.0.2.2` if running on Android.
String resolveApiUrl(String url) {
  if (!kIsWeb && Platform.isAndroid) {
    return url
        .replaceAll('localhost', '10.0.2.2')
        .replaceAll('127.0.0.1', '10.0.2.2');
  }
  return url;
}

/// Paths that must not trigger a refresh attempt on HTTP 401.
const Set<String> kAuthPathsWithoutRefresh = {
  '/auth/login',
  '/auth/register',
  '/auth/otp/verify',
  '/auth/otp/resend',
  '/auth/refresh',
  '/auth/password/forgot',
  '/auth/password/reset',
  '/auth/logout',
};
