import 'package:gps_medical_shared/gps_medical_shared.dart';

class ClinicMembershipsRepository {
  ClinicMembershipsRepository(this._client);

  final GpsMedicalClient _client;

  Future<List<ClinicMembership>> list() async {
    final response = await _client.doctors.listDoctorMemberships();
    return response.data?.toList() ?? [];
  }

  Future<ClinicMembership> accept(String membershipId) async {
    final response = await _client.doctors.acceptClinicMembership(
      membershipId: membershipId,
    );
    final membership = response.data;
    if (membership == null) {
      throw StateError('Empty accept membership response');
    }
    return membership;
  }

  Future<ClinicMembership> refuse(String membershipId) async {
    final response = await _client.doctors.refuseClinicMembership(
      membershipId: membershipId,
    );
    final membership = response.data;
    if (membership == null) {
      throw StateError('Empty refuse membership response');
    }
    return membership;
  }

  Future<ClinicMembership> requestDetach(String membershipId) async {
    final response = await _client.doctors.requestClinicDetach(
      membershipId: membershipId,
    );
    final membership = response.data;
    if (membership == null) {
      throw StateError('Empty detach request response');
    }
    return membership;
  }

  Future<ClinicMembership> setVisibleOnProfile({
    required String membershipId,
    required bool visible,
  }) async {
    final response = await _client.doctors.patchDoctorMembership(
      membershipId: membershipId,
      patchDoctorMembershipRequest: PatchDoctorMembershipRequest(
        (b) => b..visibleOnProfile = visible,
      ),
    );
    final membership = response.data;
    if (membership == null) {
      throw StateError('Empty patch membership response');
    }
    return membership;
  }
}
