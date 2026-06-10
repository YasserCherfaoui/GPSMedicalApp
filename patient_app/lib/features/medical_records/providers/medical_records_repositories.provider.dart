import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/medical_records_repository.dart';

final medicalRecordsRepositoryProvider = Provider<MedicalRecordsRepository>((
  ref,
) {
  return MedicalRecordsRepository(ref.watch(gpsMedicalClientProvider));
});
