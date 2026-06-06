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

/// Localised comma-separated language list for a doctor profile.
String formatDoctorLanguages(
  Iterable<DoctorLanguagesEnum>? languages,
  String languageCode,
) {
  if (languages == null || languages.isEmpty) return '';

  return languages
      .map((lang) => _languageLabel(lang, languageCode))
      .where((label) => label.isNotEmpty)
      .join(', ');
}

String _languageLabel(DoctorLanguagesEnum lang, String languageCode) {
  if (lang == DoctorLanguagesEnum.ar) {
    return languageCode == 'ar' ? 'العربية' : 'Arabe';
  }
  if (lang == DoctorLanguagesEnum.fr) return 'Français';
  if (lang == DoctorLanguagesEnum.en) return 'English';
  if (lang == DoctorLanguagesEnum.ber) return 'Tamazight';
  return lang.name;
}
