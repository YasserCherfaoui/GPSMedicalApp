import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../anamnesis_constants.dart';
import '../repositories/anamnesis_repository.dart';
import '../services/anamnesis_answer_queue.dart';

final anamnesisEnabledProvider = Provider<bool>((ref) {
  return anamnesisEnabledFromEnv();
});

final anamnesisRepositoryProvider = Provider<AnamnesisRepository>((ref) {
  final client = ref.watch(gpsMedicalClientProvider);
  return AnamnesisRepository(client.v1.dio);
});

final anamnesisAnswerQueueProvider = Provider<AnamnesisAnswerQueue>((ref) {
  return AnamnesisAnswerQueue();
});
