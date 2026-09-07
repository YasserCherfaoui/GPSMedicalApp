import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/gps_medical_client.provider.dart';
import '../repositories/engagement_repository.dart';

final engagementRepositoryProvider = Provider<EngagementRepository>((ref) {
  return EngagementRepository(ref.watch(gpsMedicalClientProvider));
});
