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
}
