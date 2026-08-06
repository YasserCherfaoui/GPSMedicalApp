import 'dart:io';

/// Environment for Phase 3 specialist staging API smoke tests (A-12.6).
class StagingEnv {
  StagingEnv._();

  static const defaultApiRoot =
      'https://gpsmedicalgo-production.up.railway.app';

  /// Seeded specialist phones: +213551000001..050 (see backend/seeds/staging.sql).
  static const defaultPhone = '+213551000001';
  static const defaultPassword = 'StagingSeed2026!';

  static const skipReason =
      'Set STAGING_INTEGRATION=1 to run against the staging API.';

  static bool get enabled => Platform.environment['STAGING_INTEGRATION'] == '1';

  static String get apiRoot =>
      Platform.environment['STAGING_API_ROOT_URL'] ?? defaultApiRoot;

  static String get specialistPhone =>
      _nonEmptyEnv('STAGING_SPECIALIST_PHONE') ?? defaultPhone;

  static String get specialistPassword =>
      _nonEmptyEnv('STAGING_SPECIALIST_PASSWORD') ?? defaultPassword;

  static String? _nonEmptyEnv(String key) {
    final value = Platform.environment[key];
    if (value == null || value.isEmpty) return null;
    return value;
  }
}
