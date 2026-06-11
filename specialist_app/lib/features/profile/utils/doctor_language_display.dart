import 'package:gps_medical_shared/gps_medical_shared.dart';

String doctorLanguageLabel(DoctorLanguagesEnum lang, AppLocalizations l10n) {
  return switch (lang) {
    DoctorLanguagesEnum.ar => l10n.doctorLanguageArabic,
    DoctorLanguagesEnum.fr => l10n.doctorLanguageFrench,
    DoctorLanguagesEnum.en => l10n.doctorLanguageEnglish,
    DoctorLanguagesEnum.ber => l10n.doctorLanguageTamazight,
    _ => lang.name,
  };
}

DoctorUpdateLanguagesEnum toUpdateLanguage(DoctorLanguagesEnum lang) {
  return switch (lang) {
    DoctorLanguagesEnum.ar => DoctorUpdateLanguagesEnum.ar,
    DoctorLanguagesEnum.fr => DoctorUpdateLanguagesEnum.fr,
    DoctorLanguagesEnum.en => DoctorUpdateLanguagesEnum.en,
    DoctorLanguagesEnum.ber => DoctorUpdateLanguagesEnum.ber,
    _ => DoctorUpdateLanguagesEnum.fr,
  };
}
