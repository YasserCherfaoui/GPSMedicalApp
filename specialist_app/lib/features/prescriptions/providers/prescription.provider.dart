import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/specialist_prescription_repository.dart';

final specialistPrescriptionRepositoryProvider =
    Provider<SpecialistPrescriptionRepository>((ref) {
      return SpecialistPrescriptionRepository(
        ref.watch(gpsMedicalClientProvider),
      );
    });
