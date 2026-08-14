import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'device_only_patient_profile_repository.dart';
import 'patient_profile_repository.dart';

/// Routes to the device vault when `GET /patients/me` reports `device_only`.
/// Missing/null mode stays on the server implementation (existing tests).
class ResidencyAwarePatientProfileRepository
    implements PatientProfileRepository {
  ResidencyAwarePatientProfileRepository({
    required PatientProfileRepository server,
    required DeviceVault vault,
  }) : _server = server,
       _deviceOnly = DeviceOnlyPatientProfileRepository(
         server: server,
         vault: vault,
       );

  final PatientProfileRepository _server;
  final DeviceOnlyPatientProfileRepository _deviceOnly;
  bool? _deviceOnlyMode;

  @override
  Future<Patient> getProfile() async {
    final remote = await _server.getProfile();
    _deviceOnlyMode = isDeviceOnlyResidency(remote);
    if (_deviceOnlyMode!) {
      return _deviceOnly.mergeRemote(remote);
    }
    return remote;
  }

  @override
  Future<Patient> patchProfile(PatientUpdate update) async {
    await _ensureMode();
    if (_deviceOnlyMode == true) {
      return _deviceOnly.patchProfile(update);
    }
    return _server.patchProfile(update);
  }

  @override
  Future<void> deleteProfile() async {
    await _ensureMode();
    if (_deviceOnlyMode == true) {
      await _deviceOnly.deleteProfile();
      return;
    }
    await _server.deleteProfile();
  }

  Future<void> _ensureMode() async {
    if (_deviceOnlyMode != null) return;
    final remote = await _server.getProfile();
    _deviceOnlyMode = isDeviceOnlyResidency(remote);
  }
}
