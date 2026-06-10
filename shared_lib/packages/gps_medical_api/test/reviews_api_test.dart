import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for ReviewsApi
void main() {
  final instance = GpsMedicalApi().getReviewsApi();

  group(ReviewsApi, () {
    // Publication d'un avis (uniquement après RDV terminé)
    //
    //Future<Review> createReview(ReviewCreate reviewCreate) async
    test('test createReview', () async {
      // TODO
    });

    // Suppression d'un avis (auteur)
    //
    //Future deleteReview(String reviewId) async
    test('test deleteReview', () async {
      // TODO
    });

    // Avis publics d'un médecin
    //
    //Future<PaginatedReviews> listDoctorReviews(String doctorId, { int page, int pageSize }) async
    test('test listDoctorReviews', () async {
      // TODO
    });

    // Signalement d'un avis abusif
    //
    //Future reportReview(String reviewId, ReportReviewRequest reportReviewRequest) async
    test('test reportReview', () async {
      // TODO
    });

    // Modification d'un avis (auteur uniquement, < 7 jours)
    //
    //Future<Review> updateReview(String reviewId, ReviewUpdate reviewUpdate) async
    test('test updateReview', () async {
      // TODO
    });

  });
}
