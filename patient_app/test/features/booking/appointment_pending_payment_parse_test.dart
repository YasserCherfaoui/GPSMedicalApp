import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  test('Appointment deserializes pending_payment status', () {
    final decoded = jsonDecode('''
{
  "id": "12fd4f0f-2ba9-4f1e-9f6a-1ac7d8d5410e",
  "patient_id": "94ad5683-cc15-4ea1-a3a0-e096848b3cee",
  "doctor_id": "f33a3903-98c5-47b9-af0b-bfaf956fc07c",
  "origin": "doctor_direct",
  "start_at": "2026-09-08T02:03:33.000Z",
  "end_at": "2026-09-08T02:33:33.000Z",
  "mode": "telehealth",
  "status": "pending_payment",
  "fee_dzd": 5000,
  "payment_status": "unpaid",
  "created_at": "2026-09-08T02:03:33.000Z",
  "updated_at": "2026-09-08T02:03:33.000Z"
}
''');

    final appointment = standardSerializers.deserializeWith(
      Appointment.serializer,
      decoded,
    );

    expect(appointment, isNotNull);
    expect(appointment!.status, AppointmentStatusEnum.pendingPayment);
    expect(appointment.paymentStatus, AppointmentPaymentStatusEnum.unpaid);
  });
}
