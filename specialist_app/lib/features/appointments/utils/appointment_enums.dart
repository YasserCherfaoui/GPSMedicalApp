import 'package:gps_medical_shared/gps_medical_shared.dart';

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

bool canMarkNoShow(Appointment appointment) {
  final end = appointment.endAt;
  if (end == null) return false;
  if (appointment.status != AppointmentStatusEnum.confirmed) return false;
  return DateTime.now().isAfter(end.toLocal());
}

bool isTeleconsultWindowOpen(Appointment appointment) {
  final start = appointment.startAt;
  final end = appointment.endAt;
  if (start == null || end == null) return false;
  final now = DateTime.now();
  final windowStart = start.toLocal().subtract(const Duration(minutes: 15));
  final windowEnd = end.toLocal().add(const Duration(minutes: 30));
  return !now.isBefore(windowStart) && !now.isAfter(windowEnd);
}
