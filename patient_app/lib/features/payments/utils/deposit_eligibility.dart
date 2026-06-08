import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/utils/booking_enums.dart';

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
int? appointmentDepositAmountDzd(Appointment appointment, Doctor doctor) {
  final fee = appointment.feeDzd ?? doctor.consultationFeeDzd;
  if (fee == null || fee < 100) return null;
  return fee;
}

bool isPaymentIntentTerminal(PaymentIntentStatusEnum? status) {
  return status == PaymentIntentStatusEnum.succeeded ||
      status == PaymentIntentStatusEnum.failed ||
      status == PaymentIntentStatusEnum.cancelled;
}
