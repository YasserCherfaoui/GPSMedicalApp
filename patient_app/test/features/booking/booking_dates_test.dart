import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/booking/utils/booking_dates.dart';

AvailabilitySlot slotAt({
  required DateTime start,
  AvailabilitySlotModeEnum mode = AvailabilitySlotModeEnum.inPerson,
  int durationMinutes = 30,
}) {
  return AvailabilitySlot(
    (b) => b
      ..startAt = start
      ..endAt = start.add(Duration(minutes: durationMinutes))
      ..mode = mode
      ..slotLockToken = 'lock-${start.millisecondsSinceEpoch}',
  );
}

void main() {
  test('default booking window is 60 days', () {
    expect(kBookingWindowDays, 60);
  });

  test('default availability range is 14 days', () {
    expect(kAvailabilityDefaultRangeDays, 14);
  });

  test('slot lock duration is 5 minutes', () {
    expect(kSlotLockDuration, const Duration(minutes: 5));
  });

  test('groupSlotsByDay sorts by calendar day', () {
    final slots = [
      slotAt(start: DateTime(2026, 6, 12, 10)),
      slotAt(start: DateTime(2026, 6, 10, 9)),
      slotAt(start: DateTime(2026, 6, 10, 14)),
    ];

    final grouped = groupSlotsByDay(slots);
    final days = grouped.keys.toList();

    expect(days, hasLength(2));
    expect(days.first.toDateTime().day, 10);
    expect(grouped[days.first], hasLength(2));
  });

  test('groupSlotsByStartTime merges same instant different modes', () {
    final start = DateTime(2026, 6, 10, 9);
    final slots = [
      slotAt(start: start, mode: AvailabilitySlotModeEnum.inPerson),
      slotAt(start: start, mode: AvailabilitySlotModeEnum.telehealth),
      slotAt(start: DateTime(2026, 6, 10, 10)),
    ];

    final groups = groupSlotsByStartTime(slots);

    expect(groups, hasLength(2));
    expect(groups.first.variants, hasLength(2));
  });

  test('slotDurationMinutes returns end minus start', () {
    final slot = slotAt(start: DateTime(2026, 6, 10, 9), durationMinutes: 45);
    expect(slotDurationMinutes(slot), 45);
  });
}
