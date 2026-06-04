import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/booking_api_error.dart';

class AvailabilityRepository {
  AvailabilityRepository(this._client);

  final GpsMedicalClient _client;

  Future<List<AvailabilitySlot>> fetchSlots({
    required String doctorId,
    required Date from,
    required Date to,
    String mode = 'both',
  }) async {
    try {
      final response = await _client.availability
          .doctorsDoctorIdAvailabilityGet(
            doctorId: doctorId,
            from: from,
            to: to,
            mode: mode,
          );
      return response.data?.toList() ?? [];
    } catch (e) {
      rethrowBookingApiError(e);
    }
  }
}
