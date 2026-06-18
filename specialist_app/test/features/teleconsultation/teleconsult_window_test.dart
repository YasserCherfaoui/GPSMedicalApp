import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/teleconsultation/utils/teleconsult_window.dart';

void main() {
  test('teleconsultWindowFor uses 15 min before and 30 min after', () {
    final appointment = Appointment((b) {
      b
        ..startAt = DateTime.utc(2026, 6, 16, 10)
        ..endAt = DateTime.utc(2026, 6, 16, 10, 30);
    });
    final window = teleconsultWindowFor(appointment);
    expect(
      window.windowStart,
      DateTime.utc(2026, 6, 16, 9, 45).toLocal(),
    );
    expect(
      window.windowEnd,
      DateTime.utc(2026, 6, 16, 11).toLocal(),
    );
  });

  test('formatTeleconsultCountdown formats minutes and seconds', () {
    expect(
      formatTeleconsultCountdown(const Duration(minutes: 2, seconds: 5)),
      '2m 05s',
    );
  });
}
