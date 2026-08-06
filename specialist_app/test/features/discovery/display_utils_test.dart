import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/credentials/utils/credential_display.dart';
import 'package:specialist_app/features/discovery/utils/geo_display.dart';
import 'package:specialist_app/features/discovery/utils/geo_name_search.dart';
import 'package:specialist_app/features/discovery/utils/specialty_display.dart';
import 'package:specialist_app/features/profile/utils/doctor_language_display.dart';

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('fr'));
  });

  test('credential display labels', () {
    expect(
      credentialTypeLabel(CredentialTypeEnum.diploma, l10n),
      isNotEmpty,
    );
    expect(
      credentialTypeLabel(CredentialTypeEnum.councilCard, l10n),
      isNotEmpty,
    );
    expect(
      credentialTypeLabel(CredentialTypeEnum.specialtyCert, l10n),
      isNotEmpty,
    );
    expect(credentialTypeLabel(CredentialTypeEnum.other, l10n), isNotEmpty);
    expect(credentialTypeLabel(null, l10n), '—');
    expect(
      credentialStatusLabel(CredentialStatusEnum.pending, l10n),
      isNotEmpty,
    );
    expect(
      credentialStatusLabel(CredentialStatusEnum.approved, l10n),
      isNotEmpty,
    );
    expect(
      credentialStatusLabel(CredentialStatusEnum.rejected, l10n),
      isNotEmpty,
    );
    expect(credentialStatusLabel(null, l10n), '—');
    expect(credentialUploadTypes, isNotEmpty);
  });

  test('geo and specialty display helpers', () {
    final wilaya = Wilaya(
      (b) => b
        ..code = '16'
        ..nameFr = 'Alger'
        ..nameAr = 'الجزائر'
        ..latitude = 36.75
        ..longitude = 3.05,
    );
    final commune = Commune(
      (b) => b
        ..id = 'c1'
        ..wilayaCode = '16'
        ..nameFr = 'Hydra'
        ..nameAr = 'حيدرة'
        ..latitude = 36.74
        ..longitude = 3.02,
    );
    final specialty = Specialty(
      (b) => b
        ..id = 's1'
        ..code = 'CAR'
        ..nameFr = 'Cardiologie'
        ..nameAr = 'طب القلب',
    );

    expect(wilayaDisplayName(wilaya, 'fr'), 'Alger');
    expect(wilayaDisplayName(wilaya, 'ar'), 'الجزائر');
    expect(communeDisplayName(commune, 'fr'), 'Hydra');
    expect(specialtyDisplayName(specialty, 'fr'), 'Cardiologie');
    expect(matchesGeoNameQuery(query: 'alg', nameFr: 'Alger', nameAr: 'الجزائر'), isTrue);
    expect(matchesGeoNameQuery(query: 'zzz', nameFr: 'Alger', nameAr: 'الجزائر'), isFalse);
  });

  test('doctor language display', () {
    expect(doctorLanguageLabel(DoctorLanguagesEnum.fr, l10n), isNotEmpty);
    expect(doctorLanguageLabel(DoctorLanguagesEnum.ar, l10n), isNotEmpty);
    expect(doctorLanguageLabel(DoctorLanguagesEnum.en, l10n), isNotEmpty);
    expect(doctorLanguageLabel(DoctorLanguagesEnum.ber, l10n), isNotEmpty);
    expect(toUpdateLanguage(DoctorLanguagesEnum.fr), DoctorUpdateLanguagesEnum.fr);
    expect(toUpdateLanguage(DoctorLanguagesEnum.ar), DoctorUpdateLanguagesEnum.ar);
  });
}
