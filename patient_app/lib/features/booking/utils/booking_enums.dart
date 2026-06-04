import 'package:gps_medical_shared/gps_medical_shared.dart';

String slotModeWire(AvailabilitySlotModeEnum? mode) {
  if (mode == AvailabilitySlotModeEnum.telehealth) return 'telehealth';
  return 'in_person';
}

String appointmentModeWire(AppointmentModeEnum? mode) {
  if (mode == AppointmentModeEnum.telehealth) return 'telehealth';
  return 'in_person';
}

String appointmentStatusWire(AppointmentStatusEnum? status) {
  if (status == null) return '';
  return switch (status) {
    AppointmentStatusEnum.pending => 'pending',
    AppointmentStatusEnum.confirmed => 'confirmed',
    AppointmentStatusEnum.cancelled => 'cancelled',
    AppointmentStatusEnum.completed => 'completed',
    AppointmentStatusEnum.noShow => 'no_show',
    _ => status.name,
  };
}

String paymentStatusWire(AppointmentPaymentStatusEnum? status) {
  return status?.name ?? '';
}

AppointmentCreateModeEnum toCreateMode(AvailabilitySlotModeEnum? mode) {
  return mode == AvailabilitySlotModeEnum.telehealth
      ? AppointmentCreateModeEnum.telehealth
      : AppointmentCreateModeEnum.inPerson;
}

AvailabilitySlotModeEnum? parseSlotMode(String? wire) {
  if (wire == 'telehealth') return AvailabilitySlotModeEnum.telehealth;
  if (wire == 'in_person') return AvailabilitySlotModeEnum.inPerson;
  return null;
}
