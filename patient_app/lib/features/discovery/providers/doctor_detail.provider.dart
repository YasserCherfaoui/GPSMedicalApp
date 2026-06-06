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
    this.isLoadingMoreReviews = false,
  });

  final Doctor doctor;
  final List<Review> reviews;
  final int reviewsPage;
  final bool hasMoreReviews;
  final bool isLoadingMoreReviews;

  DoctorDetailState copyWith({
    Doctor? doctor,
    List<Review>? reviews,
    int? reviewsPage,
    bool? hasMoreReviews,
    bool? isLoadingMoreReviews,
  }) {
    return DoctorDetailState(
      doctor: doctor ?? this.doctor,
      reviews: reviews ?? this.reviews,
      reviewsPage: reviewsPage ?? this.reviewsPage,
      hasMoreReviews: hasMoreReviews ?? this.hasMoreReviews,
      isLoadingMoreReviews: isLoadingMoreReviews ?? this.isLoadingMoreReviews,
    );
  }
}

@riverpod
class DoctorDetail extends _$DoctorDetail {
  static const _reviewsPageSize = 10;

  @override
  Future<DoctorDetailState> build(String doctorId) async {
    final repo = ref.watch(doctorRepositoryProvider);
    try {
      final doctor = await repo.fetchById(doctorId);
      final reviewsResult = await repo.fetchReviews(
        doctorId: doctorId,
        page: 1,
        pageSize: _reviewsPageSize,
      );
      final reviews = reviewsResult.reviews;
      final total = reviewsResult.total;
      final hasMore =
          reviews.length == _reviewsPageSize && reviews.length < total;

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
    if (current == null ||
        !current.hasMoreReviews ||
        current.isLoadingMoreReviews ||
        state.isLoading ||
        state.isRefreshing) {
      return;
    }

    state = AsyncValue.data(current.copyWith(isLoadingMoreReviews: true));

    final nextPageData = await AsyncValue.guard(() async {
      final repo = ref.read(doctorRepositoryProvider);
      final nextPage = current.reviewsPage + 1;
      final reviewsResult = await repo.fetchReviews(
        doctorId: doctorId,
        page: nextPage,
        pageSize: _reviewsPageSize,
      );
      final reviews = reviewsResult.reviews;
      final total = reviewsResult.total;
      final combined = [...current.reviews, ...reviews];
      final hasMore = combined.length < total;

      return DoctorDetailState(
        doctor: current.doctor,
        reviews: combined,
        reviewsPage: nextPage,
        hasMoreReviews: hasMore,
      );
    });

    if (nextPageData.hasValue) {
      state = AsyncValue.data(nextPageData.value!);
    }
  }
}
