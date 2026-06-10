import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/discovery_api_error.dart';

class DoctorRepository {
  DoctorRepository(this._client);

  final GpsMedicalClient _client;

  Future<({List<Doctor> doctors, int total})> listVerified({
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await _client.doctors.doctorsGet(
        page: page,
        pageSize: pageSize,
        verifiedOnly: true,
      );
      final paginated = response.data;
      return (
        doctors: paginated?.data?.toList() ?? [],
        total: paginated?.meta?.total ?? 0,
      );
    } catch (e) {
      rethrowDiscoveryApiError(e);
    }
  }

  Future<Doctor> fetchById(String doctorId) async {
    try {
      final response = await _client.doctors.doctorsDoctorIdGet(
        doctorId: doctorId,
      );
      final doctor = response.data;
      if (doctor == null) {
        throw const DoctorNotFoundException();
      }
      return doctor;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw const DoctorNotFoundException();
      }
      rethrowDiscoveryApiError(e);
    } catch (e) {
      rethrowDiscoveryApiError(e);
    }
  }

  /// Returns an empty page when reviews are unavailable (404) so the profile
  /// still renders when only [fetchById] succeeds.
  Future<({List<Review> reviews, int total})> fetchReviews({
    required String doctorId,
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await _client.reviews.listDoctorReviews(
        doctorId: doctorId,
        page: page,
        pageSize: pageSize,
      );
      final paginated = response.data;
      return (
        reviews: paginated?.data?.toList() ?? [],
        total: paginated?.meta?.total ?? 0,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return (reviews: <Review>[], total: 0);
      }
      rethrowDiscoveryApiError(e);
    } catch (e) {
      rethrowDiscoveryApiError(e);
    }
  }
}

class DoctorNotFoundException implements Exception {
  const DoctorNotFoundException();
}
