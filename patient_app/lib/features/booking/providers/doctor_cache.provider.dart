import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../discovery/providers/discovery_repositories.provider.dart';

part 'doctor_cache.provider.g.dart';

@riverpod
Future<Doctor> cachedDoctor(Ref ref, String doctorId) async {
  final repo = ref.watch(doctorRepositoryProvider);
  return repo.fetchById(doctorId);
}
