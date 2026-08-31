import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/freemium_payments_repository.dart';

final freemiumPaymentsRepositoryProvider =
    Provider<FreemiumPaymentsRepository>((ref) {
  final client = ref.watch(gpsMedicalClientProvider);
  return FreemiumPaymentsRepository(client.v1.dio);
});
