import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/cached_appointment_review.dart';
import 'reviews_repositories.provider.dart';

part 'appointment_review.provider.g.dart';

@riverpod
Future<CachedAppointmentReview?> appointmentReview(
  Ref ref,
  String appointmentId,
) async {
  return ref.read(appointmentReviewStoreProvider).read(appointmentId);
}
