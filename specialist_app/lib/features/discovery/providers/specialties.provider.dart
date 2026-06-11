import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'discovery_repositories.provider.dart';

final specialtiesProvider = FutureProvider<List<Specialty>>((ref) {
  return ref.watch(specialtiesRepositoryProvider).fetchAll();
});
