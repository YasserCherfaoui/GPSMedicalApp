import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/consent_repository.dart';
import '../repositories/patient_repository.dart';

final patientRepositoryProvider = Provider<PatientRepository>((ref) {
  return PatientRepository(ref.watch(gpsMedicalClientProvider));
});

final consentRepositoryProvider = Provider<ConsentRepository>((ref) {
  return ConsentRepository(ref.watch(gpsMedicalClientProvider));
});
