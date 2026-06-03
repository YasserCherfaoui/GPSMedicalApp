import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for ReviewsApi
void main() {
  final instance = GpsMedicalApi().getReviewsApi();

  group(ReviewsApi, () {
    // Avis publics d'un médecin
    //
    //Future<PaginatedReviews> doctorsDoctorIdReviewsGet(String doctorId, { int page, int pageSize }) async
    test('test doctorsDoctorIdReviewsGet', () async {
      // TODO
    });

    // Publication d'un avis (uniquement après RDV terminé)
    //
    //Future<Review> reviewsPost(ReviewCreate reviewCreate) async
    test('test reviewsPost', () async {
      // TODO
    });

    // Suppression d'un avis (auteur)
    //
    //Future reviewsReviewIdDelete(String reviewId) async
    test('test reviewsReviewIdDelete', () async {
      // TODO
    });

    // Modification d'un avis (auteur uniquement, < 7 jours)
    //
    //Future<Review> reviewsReviewIdPatch(String reviewId, ReviewUpdate reviewUpdate) async
    test('test reviewsReviewIdPatch', () async {
      // TODO
    });

    // Signalement d'un avis abusif
    //
    //Future reviewsReviewIdReportPost(String reviewId, ReviewsReviewIdReportPostRequest reviewsReviewIdReportPostRequest) async
    test('test reviewsReviewIdReportPost', () async {
      // TODO
    });

  });
}
