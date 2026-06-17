import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('fr');
  });

  test('formatApiWeekday uses API Sunday=0 convention', () {
    expect(formatApiWeekday(0, 'fr'), 'dimanche');
    expect(formatApiWeekday(1, 'fr'), 'lundi');
  });

  test('formatScheduleWindow formats HH:mm range', () {
    expect(formatScheduleWindow('09:00', '12:30', 'fr'), contains('09:00'));
  });
}
