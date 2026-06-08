import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/payments/utils/deposit_eligibility.dart';

void main() {
  test('canPayAppointmentDeposit allows pending/confirmed unpaid only', () {
    final pendingUnpaid = Appointment(
      (b) => b
        ..status = AppointmentStatusEnum.pending
        ..paymentStatus = AppointmentPaymentStatusEnum.unpaid,
    );
    expect(canPayAppointmentDeposit(pendingUnpaid), isTrue);

    final confirmedUnpaid = Appointment(
      (b) => b
        ..status = AppointmentStatusEnum.confirmed
        ..paymentStatus = AppointmentPaymentStatusEnum.unpaid,
    );
    expect(canPayAppointmentDeposit(confirmedUnpaid), isTrue);

    final completedUnpaid = Appointment(
      (b) => b
        ..status = AppointmentStatusEnum.completed
        ..paymentStatus = AppointmentPaymentStatusEnum.unpaid,
    );
    expect(canPayAppointmentDeposit(completedUnpaid), isFalse);

    final pendingPaid = Appointment(
      (b) => b
        ..status = AppointmentStatusEnum.pending
        ..paymentStatus = AppointmentPaymentStatusEnum.paid,
    );
    expect(canPayAppointmentDeposit(pendingPaid), isFalse);
  });

  test('appointmentDepositAmountDzd uses fee with minimum 100', () {
    final doctor = $Doctor((b) => b..consultationFeeDzd = 2500);
    final appt = Appointment((b) => b..feeDzd = 3000);
    expect(appointmentDepositAmountDzd(appt, doctor), 3000);

    final lowFee = Appointment((b) => b..feeDzd = 50);
    expect(appointmentDepositAmountDzd(lowFee, doctor), isNull);
  });
}
