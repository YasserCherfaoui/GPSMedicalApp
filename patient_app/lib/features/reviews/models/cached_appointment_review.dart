import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Locally cached review metadata for an appointment (no GET-by-appointment API).
class CachedAppointmentReview {
  const CachedAppointmentReview({
    required this.appointmentId,
    this.reviewId,
    this.rating,
    this.createdAt,
    this.status,
  });

  final String appointmentId;
  final String? reviewId;
  final int? rating;
  final DateTime? createdAt;
  final String? status;

  bool get canDelete =>
      reviewId != null &&
      createdAt != null &&
      canDeleteReviewWithinWindow(createdAt!);

  factory CachedAppointmentReview.fromReview(Review review) {
    return CachedAppointmentReview(
      appointmentId: review.appointmentId ?? '',
      reviewId: review.id,
      rating: review.rating,
      createdAt: review.createdAt,
      status: review.status?.name,
    );
  }

  factory CachedAppointmentReview.alreadyExists(String appointmentId) {
    return CachedAppointmentReview(appointmentId: appointmentId);
  }

  Map<String, dynamic> toJson() => {
    'appointment_id': appointmentId,
    if (reviewId != null) 'review_id': reviewId,
    if (rating != null) 'rating': rating,
    if (createdAt != null) 'created_at': createdAt!.toUtc().toIso8601String(),
    if (status != null) 'status': status,
  };

  factory CachedAppointmentReview.fromJson(Map<String, dynamic> json) {
    final createdRaw = json['created_at'] as String?;
    return CachedAppointmentReview(
      appointmentId: json['appointment_id'] as String? ?? '',
      reviewId: json['review_id'] as String?,
      rating: json['rating'] as int?,
      createdAt: createdRaw != null ? DateTime.tryParse(createdRaw) : null,
      status: json['status'] as String?,
    );
  }
}

const reviewDeleteWindow = Duration(days: 7);

bool canDeleteReviewWithinWindow(DateTime createdAt) {
  return DateTime.now().difference(createdAt.toLocal()) < reviewDeleteWindow;
}
