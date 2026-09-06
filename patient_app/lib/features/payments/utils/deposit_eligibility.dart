import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'price_format.dart';

/// Whether the patient can pay a deposit for this appointment (Phase 2 rules).
bool canPayAppointmentDeposit(Appointment appointment) {
  final status = appointment.status;
  final payment = appointment.paymentStatus;
  final statusOk =
      status == AppointmentStatusEnum.pending ||
      status == AppointmentStatusEnum.confirmed;
  return statusOk && payment == AppointmentPaymentStatusEnum.unpaid;
}

/// Same eligibility gate for EUR full prepayment (K-6).
bool canPayAppointmentEur(Appointment appointment) =>
    canPayAppointmentDeposit(appointment);

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

/// Seller country uses the EUR Stripe rail (not DZ/TN). Matches backend
/// `IsEURRailCountry`.
bool isEurSellerCountry(String? countryCode) {
  final c = countryCode?.trim().toUpperCase() ?? '';
  if (c.isEmpty || c == 'DZ' || c == 'TN') return false;
  return true;
}

/// Resolves charged currency for an appointment payment surface.
///
/// Prefer explicit [overrideCurrency], then clinic service currency, then
/// clinic country (EU → EUR), else DZD.
String resolvePaymentCurrency({
  String? overrideCurrency,
  String? serviceCurrency,
  String? clinicCountryCode,
}) {
  final fromQuery = overrideCurrency?.trim().toUpperCase();
  if (fromQuery != null && fromQuery.isNotEmpty) return fromQuery;
  if (isEurCurrency(serviceCurrency)) return 'EUR';
  if (isEurSellerCountry(clinicCountryCode)) return 'EUR';
  return 'DZD';
}

/// EUR amount in minor units (cents). Prefer [overrideAmountMinor], else
/// service major euros × 100, else appointment fee treated as major euros × 100.
int? appointmentEurAmountMinor({
  required Appointment appointment,
  int? overrideAmountMinor,
  int? servicePriceMajor,
  Doctor? doctor,
}) {
  if (overrideAmountMinor != null && overrideAmountMinor >= 50) {
    return overrideAmountMinor;
  }
  if (servicePriceMajor != null && servicePriceMajor > 0) {
    final minor = servicePriceMajor * 100;
    return minor >= 50 ? minor : null;
  }
  final major = appointment.feeDzd ?? doctor?.consultationFeeDzd;
  if (major == null || major <= 0) return null;
  final minor = major * 100;
  return minor >= 50 ? minor : null;
}

/// K-6 purpose for EU sellers (no deposit).
String eurPaymentPurpose(Appointment appointment) {
  if (appointment.mode == AppointmentModeEnum.telehealth) {
    return 'teleconsultation';
  }
  return 'full_consultation';
}

bool isClinicBookingPayment(Appointment appointment) {
  return appointment.origin == AppointmentOriginEnum.clinicService;
}

bool isPaymentIntentTerminal(PaymentIntentStatusEnum? status) {
  return status == PaymentIntentStatusEnum.succeeded ||
      status == PaymentIntentStatusEnum.failed ||
      status == PaymentIntentStatusEnum.cancelled;
}
