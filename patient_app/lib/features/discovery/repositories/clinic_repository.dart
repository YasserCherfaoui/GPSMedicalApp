import 'package:dio/dio.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../services/clinic_offline_cache.dart';
import '../utils/discovery_api_error.dart';

class ClinicRepository {
  ClinicRepository(
    this._client, {
    ClinicOfflineCache? offlineCache,
  }) : _offlineCache = offlineCache ?? ClinicOfflineCache();

  final GpsMedicalClient _client;
  final ClinicOfflineCache _offlineCache;

  final Map<String, Clinic> _byId = {};
  final Map<String, List<ClinicService>> _servicesByClinic = {};
  final Map<String, List<ClinicSpecialistTeaser>> _specialistsByClinic = {};

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
      final clinics = paginated?.data?.toList() ?? [];
      for (final clinic in clinics) {
        final id = clinic.id;
        if (id != null) _byId[id] = clinic;
      }
      if (page == 1 && clinics.isNotEmpty) {
        try {
          await _offlineCache.saveList(clinics);
        } catch (_) {}
      }
      return (
        clinics: clinics,
        total: paginated?.meta?.total ?? 0,
      );
    } catch (e) {
      if (page == 1 && isDiscoveryNetworkError(e)) {
        final cached = await _offlineCache.readList();
        if (cached.isNotEmpty) {
          return (clinics: cached, total: cached.length);
        }
      }
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
      _byId[clinicId] = clinic;
      return clinic;
    } on ClinicNotFoundException {
      rethrow;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw const ClinicNotFoundException();
      }
      final memory = _byId[clinicId];
      if (memory != null && isDiscoveryNetworkError(e)) {
        return memory;
      }
      if (isDiscoveryNetworkError(e)) {
        final disk = await _offlineCache.readDetail(clinicId);
        if (disk != null) return disk.clinic;
      }
      rethrowDiscoveryApiError(e);
    } catch (e) {
      final memory = _byId[clinicId];
      if (memory != null && isDiscoveryNetworkError(e)) {
        return memory;
      }
      rethrowDiscoveryApiError(e);
    }
  }

  Future<List<ClinicService>> fetchServices(String clinicId) async {
    try {
      final response = await _client.clinics.listClinicServices(
        clinicId: clinicId,
      );
      final services = response.data?.toList() ?? [];
      _servicesByClinic[clinicId] = services;
      return services;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const [];
      }
      final memory = _servicesByClinic[clinicId];
      if (memory != null && isDiscoveryNetworkError(e)) {
        return memory;
      }
      if (isDiscoveryNetworkError(e)) {
        final disk = await _offlineCache.readDetail(clinicId);
        if (disk != null) return disk.services;
      }
      rethrowDiscoveryApiError(e);
    } catch (e) {
      final memory = _servicesByClinic[clinicId];
      if (memory != null && isDiscoveryNetworkError(e)) {
        return memory;
      }
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
      final specialists = response.data?.toList() ?? [];
      _specialistsByClinic[clinicId] = specialists;
      return specialists;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const [];
      }
      final memory = _specialistsByClinic[clinicId];
      if (memory != null && isDiscoveryNetworkError(e)) {
        return memory;
      }
      if (isDiscoveryNetworkError(e)) {
        final disk = await _offlineCache.readDetail(clinicId);
        if (disk != null) return disk.specialists;
      }
      rethrowDiscoveryApiError(e);
    } catch (e) {
      final memory = _specialistsByClinic[clinicId];
      if (memory != null && isDiscoveryNetworkError(e)) {
        return memory;
      }
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
      if (isDiscoveryNetworkError(e)) {
        // Reviews are best-effort offline; keep profile usable.
        return (reviews: <ClinicReview>[], total: 0);
      }
      rethrowDiscoveryApiError(e);
    } catch (e) {
      if (isDiscoveryNetworkError(e)) {
        return (reviews: <ClinicReview>[], total: 0);
      }
      rethrowDiscoveryApiError(e);
    }
  }

  Future<void> persistDetailSnapshot({
    required Clinic clinic,
    required List<ClinicService> services,
    required List<ClinicSpecialistTeaser> specialists,
  }) {
    return _offlineCache.saveDetail(
      clinic: clinic,
      services: services,
      specialists: specialists,
    );
  }

  void clearMemoryCache() {
    _byId.clear();
    _servicesByClinic.clear();
    _specialistsByClinic.clear();
  }
}

class ClinicNotFoundException implements Exception {
  const ClinicNotFoundException();
}
