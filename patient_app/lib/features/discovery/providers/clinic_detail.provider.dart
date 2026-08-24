import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/clinic_repository.dart';
import 'discovery_repositories.provider.dart';

part 'clinic_detail.provider.g.dart';

class ClinicDetailState {
  const ClinicDetailState({
    required this.clinic,
    required this.services,
    required this.specialists,
    required this.reviews,
    required this.reviewsPage,
    required this.hasMoreReviews,
    this.isLoadingMoreReviews = false,
  });

  final Clinic clinic;
  final List<ClinicService> services;
  final List<ClinicSpecialistTeaser> specialists;
  final List<ClinicReview> reviews;
  final int reviewsPage;
  final bool hasMoreReviews;
  final bool isLoadingMoreReviews;

  ClinicDetailState copyWith({
    Clinic? clinic,
    List<ClinicService>? services,
    List<ClinicSpecialistTeaser>? specialists,
    List<ClinicReview>? reviews,
    int? reviewsPage,
    bool? hasMoreReviews,
    bool? isLoadingMoreReviews,
  }) {
    return ClinicDetailState(
      clinic: clinic ?? this.clinic,
      services: services ?? this.services,
      specialists: specialists ?? this.specialists,
      reviews: reviews ?? this.reviews,
      reviewsPage: reviewsPage ?? this.reviewsPage,
      hasMoreReviews: hasMoreReviews ?? this.hasMoreReviews,
      isLoadingMoreReviews: isLoadingMoreReviews ?? this.isLoadingMoreReviews,
    );
  }
}

@riverpod
class ClinicDetail extends _$ClinicDetail {
  static const _reviewsPageSize = 10;

  @override
  Future<ClinicDetailState> build(String clinicId) async {
    final repo = ref.watch(clinicRepositoryProvider);
    try {
      final clinic = await repo.fetchById(clinicId);
      final services = await repo.fetchServices(clinicId);
      final specialists = await repo.fetchVisibleSpecialists(clinicId);
      final reviewsResult = await repo.fetchReviews(
        clinicId: clinicId,
        page: 1,
        pageSize: _reviewsPageSize,
      );
      final reviews = reviewsResult.reviews;
      final total = reviewsResult.total;
      final hasMore =
          reviews.length == _reviewsPageSize && reviews.length < total;

      return ClinicDetailState(
        clinic: clinic,
        services: services,
        specialists: specialists,
        reviews: reviews,
        reviewsPage: 1,
        hasMoreReviews: hasMore,
      );
    } on ClinicNotFoundException {
      throw const ClinicNotFoundException();
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
      final repo = ref.read(clinicRepositoryProvider);
      final nextPage = current.reviewsPage + 1;
      final reviewsResult = await repo.fetchReviews(
        clinicId: clinicId,
        page: nextPage,
        pageSize: _reviewsPageSize,
      );
      final reviews = reviewsResult.reviews;
      final total = reviewsResult.total;
      final combined = [...current.reviews, ...reviews];
      final hasMore = combined.length < total;

      return ClinicDetailState(
        clinic: current.clinic,
        services: current.services,
        specialists: current.specialists,
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
