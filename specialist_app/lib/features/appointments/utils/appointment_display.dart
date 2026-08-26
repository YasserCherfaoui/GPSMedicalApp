import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'appointment_api_error.dart';
import 'appointment_enums.dart';

String specialistPatientDisplayLabel(
  AppLocalizations l10n,
  Appointment appointment,
) {
  final status = appointmentStatusWire(appointment.status);
  if (status == 'pending') {
    return l10n.specialistAppointmentPatientAnonymous;
  }
  final patientId = appointment.patientId;
  if (patientId == null || patientId.length < 4) {
    return l10n.specialistAppointmentPatientLabel;
  }
  return l10n.specialistAppointmentPatientRef(
    patientId.substring(patientId.length - 4).toUpperCase(),
  );
}

String reasonSnippet(String? reason, {int maxLength = 80}) {
  final text = reason?.trim();
  if (text == null || text.isEmpty) return '';
  if (text.length <= maxLength) return text;
  return '${text.substring(0, maxLength - 1)}…';
}

bool isClinicAssignedSession(Appointment appointment) {
  return appointment.origin == AppointmentOriginEnum.clinicService;
}

String appointmentActionMessage(
  AppLocalizations l10n,
  AppointmentActionException error,
) {
  if (error.code == 'SPECIALIST_SCHEDULE_CONFLICT') {
    return l10n.specialistScheduleConflictMessage;
  }
  return error.message;
}
