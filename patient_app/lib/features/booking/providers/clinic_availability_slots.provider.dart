import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'availability_window.provider.dart';
import 'booking_repositories.provider.dart';

part 'clinic_availability_slots.provider.g.dart';

@riverpod
Future<List<AvailabilitySlot>> clinicAvailabilitySlots(
  Ref ref,
  String clinicId,
  String serviceId,
  String mode,
) async {
  final window = ref.watch(availabilityWindowNotifierProvider(clinicId));
  final repo = ref.watch(availabilityRepositoryProvider);
  return repo.fetchClinicSlots(
    clinicId: clinicId,
    serviceId: serviceId,
    from: window.from,
    to: window.to,
    mode: mode,
  );
}
