import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/appointment_repository.dart';
import '../repositories/availability_repository.dart';
import '../repositories/dependents_repository.dart';

final availabilityRepositoryProvider = Provider<AvailabilityRepository>((ref) {
  return AvailabilityRepository(ref.watch(gpsMedicalClientProvider));
});

final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  return AppointmentRepository(ref.watch(gpsMedicalClientProvider));
});

final dependentsRepositoryProvider = Provider<DependentsRepository>((ref) {
  return DependentsRepository(ref.watch(gpsMedicalClientProvider));
});
