import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Whether the patient can pay a deposit for this appointment (Phase 2 rules).
bool canPayAppointmentDeposit(Appointment appointment) {
  final status = appointment.status;
  final payment = appointment.paymentStatus;
  final statusOk =
      status == AppointmentStatusEnum.pending ||
      status == AppointmentStatusEnum.confirmed;
  return statusOk && payment == AppointmentPaymentStatusEnum.unpaid;
}

/// Deposit amount in DZD (minimum 100 per API); null when not payable.
///
/// For clinic_service bookings, [doctor] may be null — [Appointment.feeDzd] is
/// enough. Doctor fee is a fallback for doctor_direct bookings.
int? appointmentDepositAmountDzd(
  Appointment appointment, [
  Doctor? doctor,
]) {
  final fee = appointment.feeDzd ?? doctor?.consultationFeeDzd;
  if (fee == null || fee < 100) return null;
  return fee;
}

bool isClinicBookingPayment(Appointment appointment) {
  return appointment.origin == AppointmentOriginEnum.clinicService;
}

bool isPaymentIntentTerminal(PaymentIntentStatusEnum? status) {
  return status == PaymentIntentStatusEnum.succeeded ||
      status == PaymentIntentStatusEnum.failed ||
      status == PaymentIntentStatusEnum.cancelled;
}
