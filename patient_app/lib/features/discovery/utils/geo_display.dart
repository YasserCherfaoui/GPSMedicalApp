import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Localised wilaya label with graceful fallback when a translation is missing.
String wilayaDisplayName(Wilaya wilaya, String languageCode) {
  if (languageCode == 'ar') {
    return wilaya.nameAr ?? wilaya.nameFr ?? wilaya.code ?? '';
  }

  return wilaya.nameFr ?? wilaya.nameAr ?? wilaya.code ?? '';
}

/// Localised commune label with graceful fallback when a translation is missing.
String communeDisplayName(Commune commune, String languageCode) {
  if (languageCode == 'ar') {
    return commune.nameAr ?? commune.nameFr ?? '';
  }

  return commune.nameFr ?? commune.nameAr ?? '';
}
