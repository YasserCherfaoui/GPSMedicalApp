import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'patient_profile_repository.dart';

/// Reads/writes restricted fields in the on-device vault; server sees only
/// `full_name` and `email`.
class DeviceOnlyPatientProfileRepository implements PatientProfileRepository {
  DeviceOnlyPatientProfileRepository({
    required PatientProfileRepository server,
    required DeviceVault vault,
  }) : _server = server,
       _vault = vault;

  final PatientProfileRepository _server;
  final DeviceVault _vault;

  @override
  Future<Patient> getProfile() async {
    final remote = await _server.getProfile();
    return mergeRemote(remote);
  }

  /// Overlays vault fields onto a payload already fetched from the server.
  Future<Patient> mergeRemote(Patient remote) => _merge(remote);

  @override
  Future<Patient> patchProfile(PatientUpdate update) async {
    final allowed = allowedServerPatientUpdate(update);
    final Patient remote;
    if (patientUpdateHasAllowedServerFields(update)) {
      remote = await _server.patchProfile(allowed);
    } else {
      remote = await _server.getProfile();
    }
    final userId = remote.id;
    if (userId != null && userId.isNotEmpty) {
      final current =
          await _vault.loadRestrictedProfile(userId) ??
          RestrictedProfileFields.empty;
      await _vault.saveRestrictedProfile(
        userId,
        current.merge(RestrictedProfileFields.fromUpdate(update)),
      );
    }
    return _merge(remote);
  }

  @override
  Future<void> deleteProfile() async {
    final remote = await _server.getProfile();
    final userId = remote.id;
    await _server.deleteProfile();
    if (userId != null && userId.isNotEmpty) {
      await _vault.wipeUser(userId);
    }
  }

  Future<Patient> _merge(Patient remote) async {
    final userId = remote.id;
    if (userId == null || userId.isEmpty) return remote;
    final local = await _vault.loadRestrictedProfile(userId);
    if (local == null) return remote;
    return local.applyTo(remote);
  }
}
