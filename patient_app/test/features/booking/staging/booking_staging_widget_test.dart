@Tags(['staging'])
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/booking/providers/appointments_upcoming.provider.dart';

import 'staging_env.dart';
import 'staging_harness.dart';

void main() {
  final runStaging = StagingEnv.enabled;

  test(
    'upcoming appointments provider lists a staging booking',
    () async {
      final session = await StagingHarness.login();
      final target = await StagingHarness.findBookableSlot(session);
      final appointment = await StagingHarness.bookSlot(
        session,
        target,
        reason: 'STAGING_E2E_LIST',
      );
      addTearDown(
        () => StagingHarness.cancelAppointment(session, appointment.id!),
      );

      final container = ProviderContainer(
        overrides: [
          gpsMedicalClientProvider.overrideWithValue(session.client),
        ],
      );
      addTearDown(container.dispose);

      final state = await container.read(appointmentsUpcomingProvider.future);
      expect(
        state.appointments.any((a) => a.id == appointment.id),
        isTrue,
      );
    },
    skip: runStaging ? null : StagingEnv.skipReason,
  );
}
