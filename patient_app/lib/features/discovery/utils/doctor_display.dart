import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'specialty_display.dart';

/// Formats a single-line practice address from API fields.
String formatPracticeAddress(Address? address) {
  if (address == null) return '';

  final parts = <String>[
    if (address.line1 != null && address.line1!.isNotEmpty) address.line1!,
    if (address.communeName != null && address.communeName!.isNotEmpty)
      address.communeName!,
    if (address.wilayaName != null && address.wilayaName!.isNotEmpty)
      address.wilayaName!,
  ];

  return parts.join(', ');
}

List<String> doctorSpecialtyLabels(Doctor doctor, String languageCode) {
  return doctor.specialties
          ?.map((s) => specialtyDisplayName(s, languageCode))
          .where((name) => name.isNotEmpty)
          .toList() ??
      [];
}

/// Localised doctor display name (`title` + `full_name`).
String formatDoctorDisplayName(Doctor doctor, AppLocalizations l10n) {
  final title = doctor.title?.trim();
  final prefix = (title == null || title.isEmpty)
      ? l10n.doctorTitleDefault
      : title;
  final name = doctor.fullName?.trim() ?? '';
  return '$prefix $name'.trim();
}

/// Localised comma-separated language list for a doctor profile.
String formatDoctorLanguages(
  Iterable<DoctorLanguagesEnum>? languages,
  AppLocalizations l10n,
) {
  if (languages == null || languages.isEmpty) return '';

  return languages
      .map((lang) => doctorLanguageLabel(lang, l10n))
      .where((label) => label.isNotEmpty)
      .join(', ');
}

String doctorLanguageLabel(DoctorLanguagesEnum lang, AppLocalizations l10n) {
  return switch (lang) {
    DoctorLanguagesEnum.ar => l10n.doctorLanguageArabic,
    DoctorLanguagesEnum.fr => l10n.doctorLanguageFrench,
    DoctorLanguagesEnum.en => l10n.doctorLanguageEnglish,
    DoctorLanguagesEnum.ber => l10n.doctorLanguageTamazight,
    _ => lang.name,
  };
}
