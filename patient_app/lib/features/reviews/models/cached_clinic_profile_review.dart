import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Locally cached clinic-profile review metadata (no GET-by-clinic API).
class CachedClinicProfileReview {
  const CachedClinicProfileReview({
    required this.clinicId,
    this.reviewId,
    this.rating,
    this.createdAt,
    this.status,
  });

  final String clinicId;
  final String? reviewId;
  final int? rating;
  final DateTime? createdAt;
  final String? status;

  factory CachedClinicProfileReview.fromReview(Review review) {
    return CachedClinicProfileReview(
      clinicId: review.clinicId ?? '',
      reviewId: review.id,
      rating: review.rating,
      createdAt: review.createdAt,
      status: review.status?.name,
    );
  }

  factory CachedClinicProfileReview.alreadyExists(String clinicId) {
    return CachedClinicProfileReview(clinicId: clinicId);
  }

  Map<String, dynamic> toJson() => {
    'clinic_id': clinicId,
    if (reviewId != null) 'review_id': reviewId,
    if (rating != null) 'rating': rating,
    if (createdAt != null) 'created_at': createdAt!.toUtc().toIso8601String(),
    if (status != null) 'status': status,
  };

  factory CachedClinicProfileReview.fromJson(Map<String, dynamic> json) {
    final createdRaw = json['created_at'] as String?;
    return CachedClinicProfileReview(
      clinicId: json['clinic_id'] as String? ?? '',
      reviewId: json['review_id'] as String?,
      rating: json['rating'] as int?,
      createdAt: createdRaw != null ? DateTime.tryParse(createdRaw) : null,
      status: json['status'] as String?,
    );
  }
}
