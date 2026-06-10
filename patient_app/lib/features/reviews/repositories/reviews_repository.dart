import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/reviews_api_error.dart';

class ReviewsRepository {
  ReviewsRepository(this._client);

  final GpsMedicalClient _client;

  Future<Review> create({
    required String appointmentId,
    required int rating,
    String? comment,
  }) async {
    try {
      final body = ReviewCreate(
        (b) => b
          ..appointmentId = appointmentId
          ..rating = rating
          ..comment = comment?.trim().isEmpty == true ? null : comment?.trim(),
      );
      final response = await _client.reviews.createReview(reviewCreate: body);
      final review = response.data;
      if (review == null) {
        throw StateError('Empty review create response');
      }
      return review;
    } catch (e) {
      rethrowReviewsApiError(e);
    }
  }

  Future<void> delete(String reviewId) async {
    try {
      await _client.reviews.deleteReview(reviewId: reviewId);
    } on DioException catch (e) {
      rethrowReviewsApiError(e);
    }
  }
}
