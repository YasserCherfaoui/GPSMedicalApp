import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../discovery/providers/discovery_repositories.provider.dart';

part 'clinic_cache.provider.g.dart';

/// Session-scoped clinic lookup (mirrors [cachedDoctor] for clinic bookings).
@Riverpod(keepAlive: true)
Future<Clinic> cachedClinic(Ref ref, String clinicId) async {
  final repo = ref.watch(clinicRepositoryProvider);
  return repo.fetchById(clinicId);
}
