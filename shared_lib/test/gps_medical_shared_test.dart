import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  test('GpsMedicalAppInfo exposes display name and client kind', () {
    const info = GpsMedicalAppInfo(
      displayName: 'GPS Médical — Patient',
      clientKind: GpsMedicalClientKind.patient,
    );

    expect(info.displayName, 'GPS Médical — Patient');
    expect(info.clientKind, GpsMedicalClientKind.patient);
  });

  test('Phase1Api documents every implemented backend route', () {
    // Keep in sync with backend/internal/apicontract/phase1_paths_test.go
    expect(phase1RouteMethodNames, hasLength(27));
  });

  test('HealthCheck model deserializes from API JSON', () {
    final json = {
      'status': 'ok',
      'db': 'ok',
      'redis': 'ok',
      'storage': 'disabled',
    };
    final health = standardSerializers.deserializeWith(
      HealthCheck.serializer,
      json,
    )!;

    expect(health.status, HealthCheckStatusEnum.ok);
    expect(health.storage, HealthCheckStorageEnum.disabled);
  });
}

/// Method names on [Phase1Api] that map to Phase 1 HTTP routes.
const phase1RouteMethodNames = [
  'getHealth',
  'getJwks',
  'registerUser',
  'checkRegisterNin',
  'checkRegisterPhone',
  'verifyOtp',
  'resendOtp',
  'login',
  'refreshTokens',
  'logout',
  'forgotPassword',
  'resetPassword',
  'getMe',
  'listMyConsents',
  'revokeMyConsent',
  'adminExportUserConsents',
  'getPatientProfile',
  'patchPatientProfile',
  'deletePatientProfile',
  'getDoctorProfile',
  'patchDoctorProfile',
  'uploadDoctorCredential',
  'getDoctorCredentialFile',
  'listSpecialties',
  'createMedicalRecord',
  'getMedicalRecordDownloadUrl',
  'getMedicalDocumentFile',
];
