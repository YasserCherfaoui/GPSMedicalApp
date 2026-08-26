import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Weekly donated hours for [clinicId] from active schedule templates.
double donatedHoursPerWeek(
  List<ScheduleTemplate> templates, {
  required String clinicId,
}) {
  if (clinicId.isEmpty) return 0;
  var total = 0.0;
  for (final template in templates) {
    if (template.active == false) continue;
    if (template.clinicId != clinicId) continue;
    final hours = scheduleWindowHours(template.startTime, template.endTime);
    if (hours != null) total += hours;
  }
  return total;
}

/// Duration in hours between `HH:mm` strings; null if unparsable or inverted.
double? scheduleWindowHours(String? startTime, String? endTime) {
  final start = _parseMinutes(startTime);
  final end = _parseMinutes(endTime);
  if (start == null || end == null || end <= start) return null;
  return (end - start) / 60.0;
}

int? _parseMinutes(String? value) {
  if (value == null || value.isEmpty) return null;
  final parts = value.split(':');
  if (parts.length != 2) return null;
  final hour = int.tryParse(parts[0]);
  final minute = int.tryParse(parts[1]);
  if (hour == null || minute == null) return null;
  if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return null;
  return hour * 60 + minute;
}

String formatDonatedHoursLabel(double hours) {
  if (hours <= 0) return '0';
  if (hours == hours.roundToDouble()) {
    return hours.round().toString();
  }
  return hours.toStringAsFixed(1);
}
