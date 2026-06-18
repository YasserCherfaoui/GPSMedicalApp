import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/specialist_teleconsultation_repository.dart';

final specialistTeleconsultationRepositoryProvider =
    Provider<SpecialistTeleconsultationRepository>((ref) {
      return SpecialistTeleconsultationRepository(
        ref.watch(gpsMedicalClientProvider),
      );
    });
