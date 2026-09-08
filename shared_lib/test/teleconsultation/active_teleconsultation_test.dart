import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/src/teleconsultation/active_teleconsultation.dart';
import 'package:gps_medical_shared/src/teleconsultation/teleconsultation_call_controller.dart';

void main() {
  test('setMinimized notifies with a new session instance', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final controller = TeleconsultationCallController();
    container.read(activeTeleconsultationProvider.notifier).attach(
          ActiveTeleconsultationSession(
            appointmentId: 'appt-1',
            controller: controller,
            isSpecialist: false,
            callRoute: '/call/appt-1',
            endSession: ({required int durationSeconds}) async {},
          ),
        );

    final before = container.read(activeTeleconsultationProvider)!;
    expect(before.minimized, isFalse);

    var notifications = 0;
    container.listen(activeTeleconsultationProvider, (_, __) {
      notifications++;
    });

    container.read(activeTeleconsultationProvider.notifier).setMinimized(true);

    final after = container.read(activeTeleconsultationProvider)!;
    expect(after.minimized, isTrue);
    expect(identical(before, after), isFalse);
    expect(notifications, 1);
  });
}
