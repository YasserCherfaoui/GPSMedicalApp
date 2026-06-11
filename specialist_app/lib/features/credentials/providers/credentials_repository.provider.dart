import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/credentials_repository.dart';

final credentialsRepositoryProvider = Provider<CredentialsRepository>((ref) {
  return CredentialsRepository(ref.watch(gpsMedicalClientProvider));
});
