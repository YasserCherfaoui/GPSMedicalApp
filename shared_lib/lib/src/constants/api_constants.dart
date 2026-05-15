/// OpenAPI security scheme name for JWT bearer auth (`components.securitySchemes`).
const String kBearerAuthSchemeName = 'bearerAuth';

/// Default API root (no `/v1` suffix) for local development.
const String kDefaultApiRootUrl = 'http://localhost:8080';

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
