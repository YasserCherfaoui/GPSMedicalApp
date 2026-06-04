import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'availability_window.provider.dart';
import 'booking_repositories.provider.dart';

part 'availability_slots.provider.g.dart';

@riverpod
Future<List<AvailabilitySlot>> availabilitySlots(
  Ref ref,
  String doctorId,
  String mode,
) async {
  final window = ref.watch(availabilityWindowNotifierProvider(doctorId));
  final repo = ref.watch(availabilityRepositoryProvider);
  return repo.fetchSlots(
    doctorId: doctorId,
    from: window.from,
    to: window.to,
    mode: mode,
  );
}
