import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'credentials_repository.provider.dart';

final doctorCredentialsProfileProvider =
    FutureProvider.autoDispose<DoctorPrivate>((ref) {
      return ref.watch(credentialsRepositoryProvider).fetchDoctorProfile();
    });
