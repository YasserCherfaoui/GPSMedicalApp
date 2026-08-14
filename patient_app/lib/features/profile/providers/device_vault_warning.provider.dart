import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'patient_profile.provider.dart';

final deviceVaultWarningVisibleProvider = FutureProvider<bool>((ref) async {
  final patient = await ref.watch(patientProfileProvider.future);
  if (!isDeviceOnlyResidency(patient)) return false;
  final id = patient.id;
  if (id == null || id.isEmpty) return false;
  return !(await ref.read(deviceVaultProvider).isWarningAcknowledged(id));
});
