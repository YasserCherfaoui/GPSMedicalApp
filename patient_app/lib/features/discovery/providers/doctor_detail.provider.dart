import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/doctor_repository.dart';
import 'discovery_repositories.provider.dart';

part 'doctor_detail.provider.g.dart';

class DoctorDetailState {
  const DoctorDetailState({
    required this.doctor,
    required this.reviews,
    required this.reviewsPage,
    required this.hasMoreReviews,
  });

  final Doctor doctor;
  final List<Review> reviews;
  final int reviewsPage;
  final bool hasMoreReviews;
}

@riverpod
class DoctorDetail extends _$DoctorDetail {
  @override
  Future<DoctorDetailState> build(String doctorId) async {
    final repo = ref.watch(doctorRepositoryProvider);
    try {
      final doctor = await repo.fetchById(doctorId);
      final reviewsResult = await repo.fetchReviews(
        doctorId: doctorId,
        page: 1,
        pageSize: 10,
      );
      final reviews = reviewsResult.reviews;
      final total = reviewsResult.total;
      final hasMore = reviews.length == 10 && reviews.length < total;

      return DoctorDetailState(
        doctor: doctor,
        reviews: reviews,
        reviewsPage: 1,
        hasMoreReviews: hasMore,
      );
    } on DoctorNotFoundException {
      throw const DoctorNotFoundException();
    }
  }

  Future<void> loadMoreReviews() async {
    final current = state.value;
    if (current == null || !current.hasMoreReviews) return;
    if (state.isLoading || state.isRefreshing) return;

    state = AsyncValue.data(current);
    final nextPageData = await AsyncValue.guard(() async {
      final repo = ref.read(doctorRepositoryProvider);
      final nextPage = current.reviewsPage + 1;
      final reviewsResult = await repo.fetchReviews(
        doctorId: doctorId,
        page: nextPage,
        pageSize: 10,
      );
      final reviews = reviewsResult.reviews;
      final total = reviewsResult.total;
      final hasMore = (current.reviews.length + reviews.length) < total;

      return DoctorDetailState(
        doctor: current.doctor,
        reviews: [...current.reviews, ...reviews],
        reviewsPage: nextPage,
        hasMoreReviews: hasMore,
      );
    });

    if (nextPageData.hasValue) {
      state = AsyncValue.data(nextPageData.value!);
    }
  }
}
