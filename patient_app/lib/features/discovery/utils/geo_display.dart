import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Localised wilaya label with graceful fallback when a translation is missing.
String wilayaDisplayName(Wilaya wilaya, String languageCode) {
  if (languageCode == 'ar') {
    return wilaya.nameAr;
  }

  return wilaya.nameFr;
}

/// Localised commune label with graceful fallback when a translation is missing.
String communeDisplayName(Commune commune, String languageCode) {
  if (languageCode == 'ar') {
    return commune.nameAr;
  }

  return commune.nameFr;
}
