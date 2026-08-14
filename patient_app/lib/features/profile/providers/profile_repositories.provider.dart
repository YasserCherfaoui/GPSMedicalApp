import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/consent_repository.dart';
import '../repositories/patient_profile_repository.dart';
import '../repositories/patient_repository.dart';
import '../repositories/residency_aware_patient_profile_repository.dart';

final patientRepositoryProvider = Provider<PatientProfileRepository>((ref) {
  return ResidencyAwarePatientProfileRepository(
    server: PatientRepository(ref.watch(gpsMedicalClientProvider)),
    vault: ref.watch(deviceVaultProvider),
  );
});

final consentRepositoryProvider = Provider<ConsentRepository>((ref) {
  return ConsentRepository(ref.watch(gpsMedicalClientProvider));
});
