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

  test('slotLockExpiryFromToken reads JWT exp', () {
    // {"exp": 1788747772} — header.payload.sig (sig unused)
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3ODg3NDc3NzJ9.sig';
    final exp = slotLockExpiryFromToken(token);
    expect(exp, isNotNull);
    expect(
      exp!.toUtc(),
      DateTime.fromMillisecondsSinceEpoch(1788747772 * 1000, isUtc: true),
    );
  });

  test('slotLockExpiryFromToken returns null for garbage', () {
    expect(slotLockExpiryFromToken(null), isNull);
    expect(slotLockExpiryFromToken('not-a-jwt'), isNull);
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

  test('canJoinTelehealth is true 15 min before start until end + 30 min', () {
    final start = DateTime.now().add(const Duration(minutes: 10));
    final end = start.add(const Duration(minutes: 30));
    expect(
      canJoinTelehealth(
        startAt: start,
        endAt: end,
        status: AppointmentStatusEnum.confirmed,
      ),
      isTrue,
    );
  });

  test('canJoinTelehealth is false when appointment is not confirmed', () {
    final start = DateTime.now();
    final end = start.add(const Duration(minutes: 30));
    expect(
      canJoinTelehealth(
        startAt: start,
        endAt: end,
        status: AppointmentStatusEnum.pending,
      ),
      isFalse,
    );
  });

  test('canJoinTelehealth allows paid pending_payment (instant after pay)', () {
    final start = DateTime.now().subtract(const Duration(minutes: 5));
    final end = start.add(const Duration(minutes: 30));
    expect(
      canJoinTelehealth(
        startAt: start,
        endAt: end,
        status: AppointmentStatusEnum.pendingPayment,
        paymentStatus: AppointmentPaymentStatusEnum.paid,
      ),
      isTrue,
    );
    expect(
      canJoinTelehealth(
        startAt: start,
        endAt: end,
        status: AppointmentStatusEnum.pendingPayment,
        paymentStatus: AppointmentPaymentStatusEnum.unpaid,
      ),
      isFalse,
    );
  });
}
