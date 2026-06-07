import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/profile_api_error.dart';

class PatientRepository {
  PatientRepository(this._client);

  final GpsMedicalClient _client;

  Future<Patient> getProfile() async {
    try {
      final response = await _client.patients.patientsMeGet();
      final patient = response.data;
      if (patient == null) {
        throw StateError('Empty patient profile response');
      }
      return patient;
    } catch (e) {
      rethrowProfileApiError(e);
    }
  }

  Future<Patient> patchProfile(PatientUpdate update) async {
    try {
      final response = await _client.patients.patientsMePatch(
        patientUpdate: update,
      );
      final patient = response.data;
      if (patient == null) {
        throw StateError('Empty patient profile response');
      }
      return patient;
    } catch (e) {
      rethrowProfileApiError(e);
    }
  }

  Future<void> deleteProfile() async {
    try {
      await _client.patients.patientsMeDelete();
    } catch (e) {
      rethrowProfileApiError(e);
    }
  }
}
