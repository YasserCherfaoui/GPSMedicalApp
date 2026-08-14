import 'package:gps_medical_shared/gps_medical_shared.dart';

abstract class PatientProfileRepository {
  Future<Patient> getProfile();

  Future<Patient> patchProfile(PatientUpdate update);

  Future<void> deleteProfile();
}
