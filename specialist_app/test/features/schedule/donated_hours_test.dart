import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/schedule/utils/donated_hours.dart';

void main() {
  ScheduleTemplate template({
    required String clinicId,
    required String start,
    required String end,
    bool active = true,
  }) {
    return ScheduleTemplate(
      (b) => b
        ..clinicId = clinicId
        ..startTime = start
        ..endTime = end
        ..active = active
        ..weekday = 1,
    );
  }

  test('donatedHoursPerWeek sums active windows for clinic', () {
    final templates = [
      template(clinicId: 'c1', start: '09:00', end: '12:00'), // 3h
      template(clinicId: 'c1', start: '14:00', end: '16:30'), // 2.5h
      template(clinicId: 'c2', start: '09:00', end: '17:00'),
      template(clinicId: 'c1', start: '08:00', end: '10:00', active: false),
    ];
    expect(donatedHoursPerWeek(templates, clinicId: 'c1'), 5.5);
    expect(donatedHoursPerWeek(templates, clinicId: 'c2'), 8.0);
    expect(donatedHoursPerWeek(templates, clinicId: 'missing'), 0);
  });

  test('formatDonatedHoursLabel formats whole and fractional hours', () {
    expect(formatDonatedHoursLabel(0), '0');
    expect(formatDonatedHoursLabel(3), '3');
    expect(formatDonatedHoursLabel(5.5), '5.5');
  });

  testWidgets('schedule window hours rejects inverted ranges', (tester) async {
    expect(scheduleWindowHours('10:00', '09:00'), isNull);
    expect(scheduleWindowHours('bad', '09:00'), isNull);
    expect(scheduleWindowHours('09:00', '10:30'), 1.5);
  });
}
