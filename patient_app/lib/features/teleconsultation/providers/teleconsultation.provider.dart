import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/patient_teleconsultation_repository.dart';

final patientTeleconsultationRepositoryProvider =
    Provider<PatientTeleconsultationRepository>((ref) {
      return PatientTeleconsultationRepository(
        ref.watch(gpsMedicalClientProvider),
      );
    });
