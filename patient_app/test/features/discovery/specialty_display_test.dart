import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/discovery/utils/specialty_display.dart';

void main() {
  final specialty = Specialty(
    (b) => b
      ..id = 'spec-1'
      ..nameFr = 'Cardiologie'
      ..nameAr = 'طب القلب',
  );

  test('prefers Arabic label in ar locale', () {
    expect(specialtyDisplayName(specialty, 'ar'), 'طب القلب');
  });

  test('prefers French label in fr locale', () {
    expect(specialtyDisplayName(specialty, 'fr'), 'Cardiologie');
  });

  test('falls back to French when Arabic is missing', () {
    final frOnly = Specialty((b) => b..nameFr = 'Pédiatrie');

    expect(specialtyDisplayName(frOnly, 'ar'), 'Pédiatrie');
  });
}
