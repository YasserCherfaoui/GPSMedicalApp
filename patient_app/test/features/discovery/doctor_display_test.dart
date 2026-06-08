import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/discovery/utils/doctor_display.dart';

void main() {
  test('formatPracticeAddress joins line, commune, and wilaya', () {
    final address = Address(
      (b) => b
        ..line1 = '12 Rue Didouche'
        ..communeName = 'Hydra'
        ..wilayaName = 'Alger',
    );

    expect(
      formatPracticeAddress(address),
      '12 Rue Didouche, Hydra, Alger',
    );
  });

  test('formatDoctorLanguages lists known language labels', () {
    final l10n = lookupAppLocalizations(const Locale('fr'));
    const languages = [
      DoctorLanguagesEnum.ar,
      DoctorLanguagesEnum.fr,
    ];

    expect(
      formatDoctorLanguages(languages, l10n),
      '${l10n.doctorLanguageArabic}, ${l10n.doctorLanguageFrench}',
    );
  });
}
