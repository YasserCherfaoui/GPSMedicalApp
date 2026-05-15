import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

/// Typed methods for every HTTP route implemented in Phase 1 (see backend
/// `internal/apicontract/phase1_paths_test.go`).
class Phase1Api {
  const Phase1Api({required GpsMedicalApi v1, required GpsMedicalApi root})
    : _v1 = v1,
      _root = root;

  final GpsMedicalApi _v1;
  final GpsMedicalApi _root;

  AuthApi get _auth => _v1.getAuthApi();

  AdminApi get _admin => _v1.getAdminApi();

  DoctorsApi get _doctors => _v1.getDoctorsApi();

  MedicalRecordsApi get _medicalRecords => _v1.getMedicalRecordsApi();

  PatientsApi get _patients => _v1.getPatientsApi();

  SystemApi get _system => _root.getSystemApi();

  // --- Root (no /v1) ---

  Future<Response<HealthCheck>> getHealth() => _system.getHealth();

  Future<Response<JWKS>> getJwks() => _root.getAuthApi().getJWKS();

  // --- Auth ---

  Future<Response<RegisterResponse>> registerUser({
    required RegisterRequest registerRequest,
  }) => _auth.registerUser(registerRequest: registerRequest);

  Future<Response<TokenPair>> verifyOtp({
    required OtpVerifyRequest otpVerifyRequest,
  }) => _auth.verifyOtp(otpVerifyRequest: otpVerifyRequest);

  Future<Response<void>> resendOtp({
    required ResendOtpRequest resendOtpRequest,
  }) => _auth.resendOtp(resendOtpRequest: resendOtpRequest);

  Future<Response<TokenPair>> login({required LoginRequest loginRequest}) =>
      _auth.login(loginRequest: loginRequest);

  Future<Response<TokenPair>> refreshTokens({
    required RefreshTokensRequest refreshTokensRequest,
  }) => _auth.refreshTokens(refreshTokensRequest: refreshTokensRequest);

  Future<Response<void>> logout() => _auth.logout();

  Future<Response<void>> forgotPassword({
    required ResendOtpRequest resendOtpRequest,
  }) => _auth.forgotPassword(resendOtpRequest: resendOtpRequest);

  Future<Response<void>> resetPassword({
    required PasswordResetRequest passwordResetRequest,
  }) => _auth.resetPassword(passwordResetRequest: passwordResetRequest);

  Future<Response<User>> getMe() => _auth.getMe();

  Future<Response<BuiltList<ConsentGrant>>> listMyConsents() =>
      _auth.listMyConsents();

  Future<Response<void>> revokeMyConsent({
    required RevokeConsentRequest revokeConsentRequest,
  }) => _auth.revokeMyConsent(revokeConsentRequest: revokeConsentRequest);

  // --- Consents (admin placeholder) ---

  Future<Response<BuiltList<ConsentGrant>>> adminExportUserConsents({
    required String userId,
  }) => _admin.adminExportUserConsents(userId: userId);

  // --- Patients ---

  Future<Response<Patient>> getPatientProfile() => _patients.patientsMeGet();

  Future<Response<Patient>> patchPatientProfile({
    required PatientUpdate patientUpdate,
  }) => _patients.patientsMePatch(patientUpdate: patientUpdate);

  Future<Response<void>> deletePatientProfile() => _patients.patientsMeDelete();

  // --- Doctors ---

  Future<Response<DoctorPrivate>> getDoctorProfile() => _doctors.doctorsMeGet();

  Future<Response<DoctorPrivate>> patchDoctorProfile({
    required DoctorUpdate doctorUpdate,
  }) => _doctors.doctorsMePatch(doctorUpdate: doctorUpdate);

  Future<Response<Credential>> uploadDoctorCredential({
    required String type,
    required MultipartFile file,
    int? issuedYear,
  }) => _doctors.doctorsMeCredentialsPost(
    type: type,
    file: file,
    issuedYear: issuedYear,
  );

  Future<Response<Uint8List>> getDoctorCredentialFile({
    required String credentialId,
    required int exp,
    required String token,
  }) => _doctors.getDoctorCredentialFile(
    credentialId: credentialId,
    exp: exp,
    token: token,
  );

  Future<Response<BuiltList<Specialty>>> listSpecialties() =>
      _doctors.specialtiesGet();

  // --- Medical records ---

  Future<Response<MedicalDocument>> createMedicalRecord({
    required String type,
    required MultipartFile file,
    String? appointmentId,
    String? patientId,
    String? title,
    String? notes,
  }) => _medicalRecords.medicalRecordsPost(
    type: type,
    file: file,
    appointmentId: appointmentId,
    patientId: patientId,
    title: title,
    notes: notes,
  );

  Future<Response<MedicalRecordsDocumentIdDownloadGet200Response>>
  getMedicalRecordDownloadUrl({required String documentId}) => _medicalRecords
      .medicalRecordsDocumentIdDownloadGet(documentId: documentId);

  Future<Response<Uint8List>> getMedicalDocumentFile({
    required String documentId,
    required int exp,
    required String token,
  }) => _medicalRecords.getMedicalDocumentFile(
    documentId: documentId,
    exp: exp,
    token: token,
  );
}
