import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

const kBookingWindowDays = 60;
const kAvailabilityDefaultRangeDays = 14;
const kSlotLockDuration = Duration(minutes: 5);

Date todayDate() => DateTime.now().toDate();

Date addDays(Date date, int days) {
  final dt = date.toDateTime().add(Duration(days: days));
  return dt.toDate();
}

Date maxDate(Date a, Date b) => a.compareTo(b) >= 0 ? a : b;

Date minDate(Date a, Date b) => a.compareTo(b) <= 0 ? a : b;

/// Groups slots by local calendar day (start_at date).
Map<Date, List<AvailabilitySlot>> groupSlotsByDay(
  List<AvailabilitySlot> slots,
) {
  final map = <Date, List<AvailabilitySlot>>{};
  for (final slot in slots) {
    final start = slot.startAt;
    if (start == null) continue;
    final day = start.toLocal().toDate();
    map.putIfAbsent(day, () => []).add(slot);
  }
  for (final list in map.values) {
    list.sort((a, b) {
      final sa = a.startAt;
      final sb = b.startAt;
      if (sa == null || sb == null) return 0;
      return sa.compareTo(sb);
    });
  }
  final sortedKeys = map.keys.toList()..sort();
  return {for (final k in sortedKeys) k: map[k]!};
}

String formatSlotTime(DateTime start, String locale) {
  return DateFormat.Hm(locale).format(start.toLocal());
}

String formatSlotDayHeader(Date day, String locale) {
  final dt = day.toDateTime();
  return DateFormat.EEEE(locale).format(dt);
}

/// e.g. "jeudi 12 juin"
String formatDaySectionTitle(Date day, String locale) {
  final dt = day.toDateTime();
  return DateFormat('EEEE d MMMM', locale).format(dt);
}

String formatShortDate(Date day, String locale) {
  return DateFormat('d MMM', locale).format(day.toDateTime());
}

/// Groups slots that share the same start instant (e.g. in-person + telehealth).
List<({DateTime startAt, List<AvailabilitySlot> variants})>
groupSlotsByStartTime(List<AvailabilitySlot> slots) {
  final map = <DateTime, List<AvailabilitySlot>>{};
  for (final slot in slots) {
    final start = slot.startAt?.toLocal();
    if (start == null) continue;
    final key = DateTime(
      start.year,
      start.month,
      start.day,
      start.hour,
      start.minute,
    );
    map.putIfAbsent(key, () => []).add(slot);
  }
  final keys = map.keys.toList()..sort();
  return [
    for (final k in keys)
      (
        startAt: k,
        variants: map[k]!
          ..sort((a, b) {
            final ma = a.mode?.name ?? '';
            final mb = b.mode?.name ?? '';
            return ma.compareTo(mb);
          }),
      ),
  ];
}

int slotDurationMinutes(AvailabilitySlot slot) {
  final start = slot.startAt;
  final end = slot.endAt;
  if (start == null || end == null) return 0;
  return end.difference(start).inMinutes;
}

bool canPatientModifyAppointment(DateTime startAt) {
  return DateTime.now().isBefore(startAt.subtract(const Duration(hours: 24)));
}

bool canJoinTelehealth(DateTime startAt, String statusWire) {
  if (statusWire != 'confirmed') return false;
  final now = DateTime.now();
  final windowStart = startAt.subtract(const Duration(minutes: 15));
  return !now.isBefore(windowStart) &&
      now.isBefore(startAt.add(const Duration(hours: 2)));
}
