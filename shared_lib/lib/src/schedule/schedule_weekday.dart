import 'package:intl/intl.dart';

/// API weekday: 0 = Sunday … 6 = Saturday.
DateTime apiWeekdayReferenceDate(int weekday) {
  final sunday = DateTime(2026, 6, 14);
  return sunday.add(Duration(days: weekday));
}

String formatApiWeekday(int weekday, String locale) {
  return DateFormat.EEEE(locale).format(apiWeekdayReferenceDate(weekday));
}

String formatScheduleTime(String hhmm, String locale) {
  final parts = hhmm.split(':');
  if (parts.length != 2) return hhmm;
  final hour = int.tryParse(parts[0]);
  final minute = int.tryParse(parts[1]);
  if (hour == null || minute == null) return hhmm;
  final dt = DateTime(2026, 1, 1, hour, minute);
  return DateFormat.Hm(locale).format(dt);
}

String formatScheduleWindow(String start, String end, String locale) {
  return '${formatScheduleTime(start, locale)} – ${formatScheduleTime(end, locale)}';
}
