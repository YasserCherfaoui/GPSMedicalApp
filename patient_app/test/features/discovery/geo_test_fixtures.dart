import 'package:gps_medical_shared/gps_medical_shared.dart';

Map<String, dynamic> wilayaJson({
  String code = '16',
  String nameFr = 'Alger',
  String nameAr = 'الجزائر',
  double latitude = 36.7538,
  double longitude = 3.0588,
}) {
  return {
    'code': code,
    'name_fr': nameFr,
    'name_ar': nameAr,
    'latitude': latitude,
    'longitude': longitude,
  };
}

Map<String, dynamic> communeJson({
  String id = 'c1',
  String wilayaCode = '16',
  String nameFr = 'Hydra',
  String nameAr = 'حيدرة',
  double latitude = 36.7449,
  double longitude = 3.0238,
}) {
  return {
    'id': id,
    'wilaya_code': wilayaCode,
    'name_fr': nameFr,
    'name_ar': nameAr,
    'latitude': latitude,
    'longitude': longitude,
  };
}

Wilaya sampleWilaya({
  String code = '16',
  String nameFr = 'Alger',
  String nameAr = 'الجزائر',
}) {
  return Wilaya(
    (b) => b
      ..code = code
      ..nameFr = nameFr
      ..nameAr = nameAr
      ..latitude = 36.7538
      ..longitude = 3.0588,
  );
}

Commune sampleCommune({
  String id = 'c1',
  String wilayaCode = '16',
  String nameFr = 'Hydra',
  String nameAr = 'حيدرة',
}) {
  return Commune(
    (b) => b
      ..id = id
      ..wilayaCode = wilayaCode
      ..nameFr = nameFr
      ..nameAr = nameAr
      ..latitude = 36.7449
      ..longitude = 3.0238,
  );
}
