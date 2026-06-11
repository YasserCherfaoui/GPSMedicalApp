import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/geo_repository.dart';
import '../repositories/specialties_repository.dart';

final specialtiesRepositoryProvider = Provider<SpecialtiesRepository>((ref) {
  return SpecialtiesRepository(ref.watch(gpsMedicalClientProvider));
});

final geoRepositoryProvider = Provider<GeoRepository>((ref) {
  return GeoRepository(ref.watch(gpsMedicalClientProvider));
});
