import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../profile/providers/profile_repositories.provider.dart';
import '../repositories/medical_records_repository.dart';
import '../repositories/medical_records_store.dart';
import '../repositories/residency_aware_medical_records_repository.dart';

final medicalRecordsRepositoryProvider = Provider<MedicalRecordsStore>((ref) {
  return ResidencyAwareMedicalRecordsRepository(
    server: MedicalRecordsRepository(ref.watch(gpsMedicalClientProvider)),
    vault: ref.watch(deviceVaultProvider),
    profiles: ref.watch(patientRepositoryProvider),
  );
});
