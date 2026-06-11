import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Localised specialty label with graceful fallback when a translation is missing.
String specialtyDisplayName(Specialty specialty, String languageCode) {
  if (languageCode == 'ar') {
    return specialty.nameAr ?? specialty.nameFr ?? '';
  }

  return specialty.nameFr ?? specialty.nameAr ?? '';
}
