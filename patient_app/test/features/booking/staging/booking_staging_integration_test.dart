@Tags(['staging'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/booking/utils/booking_api_error.dart';

import '../../../staging/staging_env.dart';
import '../../../staging/staging_harness.dart';

void main() {
  final runStaging = StagingEnv.enabled;
  late StagingSession session;

  setUp(() async {
    if (!runStaging) return;
    session = await StagingHarness.login();
  });

  group('booking staging integration', () {
    test(
      'happy path: search → doctor detail → availability → book → confirm',
      () async {
        final target = await StagingHarness.findBookableSlot(session);
        expect(target.doctor.id, isNotNull);
        expect(target.doctor.fullName, isNotEmpty);
        expect(target.slot.slotLockToken, isNotEmpty);

        final appointment = await StagingHarness.bookSlot(
          session,
          target,
          reason: 'STAGING_E2E_HAPPY_PATH',
        );
        addTearDown(
          () => StagingHarness.cancelAppointment(session, appointment.id!),
        );

        expect(appointment.id, isNotNull);
        expect(appointment.doctorId, target.doctorId);
        expect(
          appointment.status,
          anyOf(
            AppointmentStatusEnum.pending,
            AppointmentStatusEnum.confirmed,
          ),
        );

        final fetched = await session.appointments.fetchById(appointment.id!);
        expect(fetched.id, appointment.id);
        expect(fetched.startAt, appointment.startAt);
      },
      skip: runStaging ? null : StagingEnv.skipReason,
    );

    test(
      'slot taken (409) recovery: second POST with same lock token fails',
      () async {
        final target = await StagingHarness.findBookableSlot(session);
        final first = await StagingHarness.bookSlot(
          session,
          target,
          reason: 'STAGING_E2E_409_FIRST',
        );
        addTearDown(
          () => StagingHarness.cancelAppointment(session, first.id!),
        );

        expect(
          () => StagingHarness.bookSlot(
            session,
            target,
            reason: 'STAGING_E2E_409_SECOND',
          ),
          throwsA(isA<SlotTakenException>()),
        );
      },
      skip: runStaging ? null : StagingEnv.skipReason,
    );

    test(
      'cancellation flow: book then cancel returns cancelled status',
      () async {
        final target = await StagingHarness.findBookableSlot(
          session,
          minLeadTime: const Duration(hours: 25),
        );
        final appointment = await StagingHarness.bookSlot(
          session,
          target,
          reason: 'STAGING_E2E_CANCEL',
        );

        final cancelled = await session.appointments.cancel(
          appointmentId: appointment.id!,
          reason: 'Change of plans (staging test)',
        );
        expect(cancelled.status, AppointmentStatusEnum.cancelled);
      },
      skip: runStaging ? null : StagingEnv.skipReason,
    );

    test(
      'dependent booking: POST includes dependent_id',
      () async {
        final dependent = await StagingHarness.ensureDependent(session);
        expect(dependent.id, isNotNull);

        final target = await StagingHarness.findBookableSlot(session);
        final appointment = await StagingHarness.bookSlot(
          session,
          target,
          dependentId: dependent.id,
          reason: 'STAGING_E2E_DEPENDENT',
        );
        addTearDown(
          () => StagingHarness.cancelAppointment(session, appointment.id!),
        );

        expect(appointment.dependentId, dependent.id);
        final fetched = await session.appointments.fetchById(appointment.id!);
        expect(fetched.dependentId, dependent.id);
      },
      skip: runStaging ? null : StagingEnv.skipReason,
    );
  });
}
