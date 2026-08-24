import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/discovery_api_error.dart';

class ClinicRepository {
  ClinicRepository(this._client);

  final GpsMedicalClient _client;

  Future<({List<Clinic> clinics, int total})> listVerified({
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await _client.clinics.listClinics(
        page: page,
        pageSize: pageSize,
      );
      final paginated = response.data;
      return (
        clinics: paginated?.data?.toList() ?? [],
        total: paginated?.meta?.total ?? 0,
      );
    } catch (e) {
      rethrowDiscoveryApiError(e);
    }
  }

  Future<Clinic> fetchById(String clinicId) async {
    try {
      final response = await _client.clinics.getClinic(clinicId: clinicId);
      final clinic = response.data;
      if (clinic == null) {
        throw const ClinicNotFoundException();
      }
      return clinic;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw const ClinicNotFoundException();
      }
      rethrowDiscoveryApiError(e);
    } catch (e) {
      rethrowDiscoveryApiError(e);
    }
  }

  Future<List<ClinicService>> fetchServices(String clinicId) async {
    try {
      final response = await _client.clinics.listClinicServices(
        clinicId: clinicId,
      );
      return response.data?.toList() ?? [];
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const [];
      }
      rethrowDiscoveryApiError(e);
    } catch (e) {
      rethrowDiscoveryApiError(e);
    }
  }

  Future<List<ClinicSpecialistTeaser>> fetchVisibleSpecialists(
    String clinicId,
  ) async {
    try {
      final response = await _client.clinics.listClinicVisibleSpecialists(
        clinicId: clinicId,
      );
      return response.data?.toList() ?? [];
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const [];
      }
      rethrowDiscoveryApiError(e);
    } catch (e) {
      rethrowDiscoveryApiError(e);
    }
  }

  /// Returns an empty page when reviews are unavailable (404) so the profile
  /// still renders when only [fetchById] succeeds.
  Future<({List<ClinicReview> reviews, int total})> fetchReviews({
    required String clinicId,
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await _client.reviews.listClinicPublicReviews(
        clinicId: clinicId,
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
        return (reviews: <ClinicReview>[], total: 0);
      }
      rethrowDiscoveryApiError(e);
    } catch (e) {
      rethrowDiscoveryApiError(e);
    }
  }
}

class ClinicNotFoundException implements Exception {
  const ClinicNotFoundException();
}
