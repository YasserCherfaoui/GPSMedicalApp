import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    final client = ref.watch(gpsMedicalClientProvider);
    final doctorResponse = await client.doctors.doctorsDoctorIdGet(
      doctorId: doctorId,
    );
    final doctor = doctorResponse.data!;

    final reviewsResponse = await client.v1
        .getReviewsApi()
        .doctorsDoctorIdReviewsGet(doctorId: doctorId, page: 1, pageSize: 10);
    final reviewsPaginated = reviewsResponse.data;
    final reviews = reviewsPaginated?.data?.toList() ?? [];
    final total = reviewsPaginated?.meta?.total ?? 0;
    final hasMore = reviews.length == 10 && reviews.length < total;

    return DoctorDetailState(
      doctor: doctor,
      reviews: reviews,
      reviewsPage: 1,
      hasMoreReviews: hasMore,
    );
  }

  Future<void> loadMoreReviews() async {
    final current = state.value;
    if (current == null || !current.hasMoreReviews) return;
    if (state.isLoading || state.isRefreshing) return;

    state = AsyncValue.data(current);
    final nextPageData = await AsyncValue.guard(() async {
      final client = ref.read(gpsMedicalClientProvider);
      final nextPage = current.reviewsPage + 1;
      final reviewsResponse = await client.v1
          .getReviewsApi()
          .doctorsDoctorIdReviewsGet(
            doctorId: doctorId,
            page: nextPage,
            pageSize: 10,
          );
      final reviewsPaginated = reviewsResponse.data;
      final reviews = reviewsPaginated?.data?.toList() ?? [];
      final total = reviewsPaginated?.meta?.total ?? 0;
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
