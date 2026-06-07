import 'dart:io';

/// Environment for booking tests against the staging API (task 7.6).
class StagingEnv {
  StagingEnv._();

  static const defaultApiRoot =
      'https://gpsmedicalgo-production.up.railway.app';
  static const defaultPhone = '+21355009999';
  static const defaultPassword = 'StagingSeed2026!';
  static const defaultWilayaCode = '16';

  static const skipReason =
      'Set STAGING_INTEGRATION=1 to run against the staging API.';

  static bool get enabled => Platform.environment['STAGING_INTEGRATION'] == '1';

  static String get apiRoot =>
      Platform.environment['STAGING_API_ROOT_URL'] ?? defaultApiRoot;

  static String get patientPhone => _nonEmptyEnv('STAGING_PATIENT_PHONE') ?? defaultPhone;

  static String get patientPassword =>
      _nonEmptyEnv('STAGING_PATIENT_PASSWORD') ?? defaultPassword;

  static String? _nonEmptyEnv(String key) {
    final value = Platform.environment[key];
    if (value == null || value.isEmpty) return null;
    return value;
  }

  static String? get doctorId => Platform.environment['STAGING_DOCTOR_ID'];
}
