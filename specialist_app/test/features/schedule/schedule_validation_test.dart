import 'package:flutter_test/flutter_test.dart';
import 'package:specialist_app/features/schedule/utils/schedule_validation.dart';

void main() {
  group('ScheduleValidation.validateTemplate', () {
    test('accepts valid window', () {
      final errors = ScheduleValidation.validateTemplate(
        weekday: 1,
        startTime: '09:00',
        endTime: '12:00',
        slotDurationMinutes: 30,
        mode: 'both',
      );
      expect(errors, isEmpty);
    });

    test('rejects end before start', () {
      final errors = ScheduleValidation.validateTemplate(
        weekday: 1,
        startTime: '12:00',
        endTime: '09:00',
        slotDurationMinutes: 30,
        mode: 'both',
      );
      expect(errors['end_time'], 'END_TIME_MUST_EXCEED_START');
    });

    test('rejects interval not multiple of slot duration', () {
      final errors = ScheduleValidation.validateTemplate(
        weekday: 1,
        startTime: '09:00',
        endTime: '10:00',
        slotDurationMinutes: 45,
        mode: 'both',
      );
      expect(errors['slot_duration_minutes'], 'INVALID_SLOT_INTERVAL');
    });
  });

  group('ScheduleValidation.validateException', () {
    test('rejects invalid kind', () {
      final errors = ScheduleValidation.validateException(
        startAt: DateTime(2026, 6, 1),
        endAt: DateTime(2026, 6, 2),
        kind: 'extra',
      );
      expect(errors['kind'], 'INVALID_KIND');
    });
  });
}
