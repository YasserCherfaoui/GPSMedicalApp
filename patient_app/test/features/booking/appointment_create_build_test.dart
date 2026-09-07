import 'package:built_value/serializer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

void main() {
  test('AppointmentCreate defaults use Dart enum names (not wire names)', () {
    // Regression: openapi-generator emitted
    // valueOf('doctor_direct') which throws — booking never POSTed.
    final create = AppointmentCreate(
      (b) => b
        ..origin = AppointmentCreateOriginEnum.clinicService
        ..clinicId = 'clinic-1'
        ..serviceId = 'svc-1'
        ..startAt = DateTime.parse('2026-09-07T08:30:00.000Z')
        ..mode = AppointmentCreateModeEnum.inPerson
        ..slotLockToken = 'tok',
    );
    expect(create.origin, AppointmentCreateOriginEnum.clinicService);

    final json =
        standardSerializers.serialize(
              create,
              specifiedType: const FullType(AppointmentCreate),
            )
            as Map;
    expect(json['origin'], 'clinic_service');
    expect(json.containsKey('doctor_id'), isFalse);
  });
}
