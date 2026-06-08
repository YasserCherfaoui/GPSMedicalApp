import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/reviews_repository.dart';
import '../services/appointment_review_store.dart';

final reviewsRepositoryProvider = Provider<ReviewsRepository>((ref) {
  return ReviewsRepository(ref.watch(gpsMedicalClientProvider));
});

final appointmentReviewStoreProvider = Provider<AppointmentReviewStore>((ref) {
  return AppointmentReviewStore();
});
