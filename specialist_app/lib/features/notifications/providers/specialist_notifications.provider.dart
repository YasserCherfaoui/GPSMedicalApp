import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/specialist_notifications_repository.dart';

final specialistNotificationsRepositoryProvider =
    Provider<SpecialistNotificationsRepository>((ref) {
      return SpecialistNotificationsRepository(
        ref.watch(gpsMedicalClientProvider),
      );
    });
