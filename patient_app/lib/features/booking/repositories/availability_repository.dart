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

  Future<List<AvailabilitySlot>> fetchClinicSlots({
    required String clinicId,
    required String serviceId,
    required Date from,
    required Date to,
    String? mode,
  }) async {
    try {
      final response = await _client.availability.getClinicServiceAvailability(
        clinicId: clinicId,
        serviceId: serviceId,
        from: from,
        to: to,
        mode: mode == null || mode == 'both' ? null : mode,
      );
      final clinicSlots = response.data?.toList() ?? [];
      return clinicSlots.map(_mapClinicSlot).toList();
    } catch (e) {
      rethrowBookingApiError(e);
    }
  }
}

AvailabilitySlot _mapClinicSlot(ClinicAvailabilitySlot slot) {
  return AvailabilitySlot(
    (b) => b
      ..startAt = slot.startAt
      ..endAt = slot.endAt
      ..slotLockToken = slot.slotLockToken
      ..mode = slot.mode == ClinicAvailabilitySlotModeEnum.telehealth
          ? AvailabilitySlotModeEnum.telehealth
          : AvailabilitySlotModeEnum.inPerson,
  );
}
