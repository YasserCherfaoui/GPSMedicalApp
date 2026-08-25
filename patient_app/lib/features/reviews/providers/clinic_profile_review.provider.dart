import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/cached_clinic_profile_review.dart';
import 'reviews_repositories.provider.dart';

part 'clinic_profile_review.provider.g.dart';

@riverpod
Future<CachedClinicProfileReview?> clinicProfileReview(
  Ref ref,
  String clinicId,
) async {
  return ref.read(clinicProfileReviewStoreProvider).read(clinicId);
}
