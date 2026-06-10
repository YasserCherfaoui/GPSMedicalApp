import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/booking_api_error.dart';

class DependentsRepository {
  DependentsRepository(this._client);

  final GpsMedicalClient _client;

  Future<List<Dependent>> listDependents() async {
    try {
      final response = await _client.patients.patientsMeDependentsGet();
      return response.data?.toList() ?? [];
    } catch (e) {
      rethrowBookingApiError(e);
    }
  }

  Future<Dependent> createDependent(DependentCreate create) async {
    try {
      final response = await _client.patients.patientsMeDependentsPost(
        dependentCreate: create,
      );
      final dependent = response.data;
      if (dependent == null) {
        throw StateError('Empty dependent response');
      }
      return dependent;
    } catch (e) {
      rethrowBookingApiError(e);
    }
  }

  Future<Dependent> updateDependent({
    required String dependentId,
    required DependentCreate update,
  }) async {
    try {
      final response = await _client.patients
          .patientsMeDependentsDependentIdPatch(
            dependentId: dependentId,
            dependentCreate: update,
          );
      final dependent = response.data;
      if (dependent == null) {
        throw StateError('Empty dependent response');
      }
      return dependent;
    } catch (e) {
      rethrowBookingApiError(e);
    }
  }

  Future<void> deleteDependent(String dependentId) async {
    try {
      await _client.patients.patientsMeDependentsDependentIdDelete(
        dependentId: dependentId,
      );
    } catch (e) {
      rethrowBookingApiError(e);
    }
  }
}
