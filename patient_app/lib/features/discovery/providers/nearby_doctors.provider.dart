import 'package:geolocator/geolocator.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/location_permission.dart';
import '../utils/wilaya_centroids.dart';
import 'discovery_repositories.provider.dart';
import 'doctor_search.provider.dart';

part 'nearby_doctors.provider.g.dart';

class NearbyDoctorsState {
  const NearbyDoctorsState({
    required this.doctors,
    required this.lat,
    required this.lng,
    required this.radiusKm,
    this.clinics = const [],
    this.entity = DiscoveryEntity.doctors,
    this.permissionGranted = false,
    this.specialtyId,
    this.manualWilaya,
    this.manualCommune,
  });

  final List<DoctorWithDistance> doctors;
  final List<ClinicWithDistance> clinics;
  final DiscoveryEntity entity;
  final double lat;
  final double lng;
  final double radiusKm;
  final bool permissionGranted;
  final String? specialtyId;
  final Wilaya? manualWilaya;
  final Commune? manualCommune;

  /// Map/search center comes from wilaya/commune API data, not device GPS.
  bool get usesManualLocation => manualWilaya != null;

  String? get manualWilayaCode => manualWilaya?.code;

  bool get showingClinics => entity == DiscoveryEntity.clinics;

  NearbyDoctorsState copyWith({
    List<DoctorWithDistance>? doctors,
    List<ClinicWithDistance>? clinics,
    DiscoveryEntity? entity,
    double? lat,
    double? lng,
    double? radiusKm,
    bool? permissionGranted,
    String? specialtyId,
    Wilaya? manualWilaya,
    Commune? manualCommune,
    bool clearSpecialty = false,
    bool clearManualLocation = false,
  }) {
    return NearbyDoctorsState(
      doctors: doctors ?? this.doctors,
      clinics: clinics ?? this.clinics,
      entity: entity ?? this.entity,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      radiusKm: radiusKm ?? this.radiusKm,
      permissionGranted: permissionGranted ?? this.permissionGranted,
      specialtyId: clearSpecialty ? null : (specialtyId ?? this.specialtyId),
      manualWilaya: clearManualLocation
          ? null
          : (manualWilaya ?? this.manualWilaya),
      manualCommune: clearManualLocation
          ? null
          : (manualCommune ?? this.manualCommune),
    );
  }
}

@riverpod
class NearbyDoctors extends _$NearbyDoctors {
  static const double defaultLat = 36.7538;
  static const double defaultLng = 3.0588;

  @override
  Future<NearbyDoctorsState> build() async {
    final granted = await isLocationWhenInUseGranted();

    var lat = defaultLat;
    var lng = defaultLng;

    if (granted) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 5),
        );
        lat = position.latitude;
        lng = position.longitude;
      } catch (_) {}
    }

    final stateObj = NearbyDoctorsState(
      doctors: [],
      clinics: [],
      lat: lat,
      lng: lng,
      radiusKm: 5,
      permissionGranted: granted,
    );

    return _withFetchedResults(stateObj);
  }

  Future<NearbyDoctorsState> _withFetchedResults(
    NearbyDoctorsState current,
  ) async {
    if (current.showingClinics) {
      final clinics = await _fetchNearbyClinics(current);
      return current.copyWith(clinics: clinics);
    }
    final doctors = await _fetchNearbyDoctors(current);
    return current.copyWith(doctors: doctors);
  }

  Future<List<DoctorWithDistance>> _fetchNearbyDoctors(
    NearbyDoctorsState current,
  ) async {
    return ref
        .read(geoRepositoryProvider)
        .fetchNearby(
          lat: current.lat,
          lng: current.lng,
          radiusKm: current.radiusKm,
          specialtyId: current.specialtyId,
        );
  }

  Future<List<ClinicWithDistance>> _fetchNearbyClinics(
    NearbyDoctorsState current,
  ) async {
    return ref
        .read(geoRepositoryProvider)
        .fetchNearbyClinics(
          lat: current.lat,
          lng: current.lng,
          radiusKm: current.radiusKm,
        );
  }

  /// Refetches markers while keeping the map mounted (no [AsyncLoading] flash).
  Future<void> _refetch(NearbyDoctorsState next) async {
    final current = state.value;
    if (current == null) return;

    state = AsyncValue.data(
      next.copyWith(doctors: current.doctors, clinics: current.clinics),
    );
    state = await AsyncValue.guard(() => _withFetchedResults(next));
  }

  Future<void> setEntity(DiscoveryEntity entity) async {
    final current = state.value;
    if (current == null || current.entity == entity) return;
    await _refetch(
      current.copyWith(
        entity: entity,
        clearSpecialty: entity == DiscoveryEntity.clinics,
      ),
    );
  }

  Future<void> requestLocationPermission() async {
    final granted = await requestLocationWhenInUse();
    if (!granted) return;

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 5),
      );
      final current = state.value;
      final updated = NearbyDoctorsState(
        doctors: current?.doctors ?? [],
        clinics: current?.clinics ?? [],
        entity: current?.entity ?? DiscoveryEntity.doctors,
        lat: position.latitude,
        lng: position.longitude,
        radiusKm: current?.radiusKm ?? 5,
        permissionGranted: true,
        specialtyId: current?.specialtyId,
      );
      await _refetch(updated.copyWith(clearManualLocation: true));
    } catch (_) {}
  }

  /// Centers the map from API reference coordinates (commune preferred over wilaya).
  Future<void> setManualLocation({
    required Wilaya wilaya,
    Commune? commune,
  }) async {
    final current = state.value;
    if (current == null) return;

    final (lat, lng) = _manualCenter(wilaya, commune);
    await _refetch(
      current.copyWith(
        lat: lat,
        lng: lng,
        manualWilaya: wilaya,
        manualCommune: commune,
      ),
    );
  }

  (double lat, double lng) _manualCenter(Wilaya wilaya, Commune? commune) {
    if (commune != null && _hasApiCoords(commune.latitude, commune.longitude)) {
      return (commune.latitude, commune.longitude);
    }
    if (_hasApiCoords(wilaya.latitude, wilaya.longitude)) {
      return (wilaya.latitude, wilaya.longitude);
    }
    return wilayaCentroid(wilaya.code);
  }

  bool _hasApiCoords(double lat, double lng) {
    if (lat.isNaN || lng.isNaN) return false;
    if (lat < -90 || lat > 90 || lng < -180 || lng > 180) return false;
    return true;
  }

  /// Recenters on device GPS and clears wilaya/commune selection.
  Future<void> useDeviceLocation() async {
    final current = state.value;
    if (current == null) return;

    if (!await isLocationWhenInUseGranted()) {
      await requestLocationPermission();
      return;
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 5),
      );
      await _refetch(
        current.copyWith(
          lat: position.latitude,
          lng: position.longitude,
          permissionGranted: true,
          clearManualLocation: true,
        ),
      );
    } catch (_) {}
  }

  Future<void> updateRadius(double radiusKm) async {
    final current = state.value;
    if (current == null || current.radiusKm == radiusKm) return;
    await _refetch(current.copyWith(radiusKm: radiusKm));
  }

  Future<void> filterBySpecialty(String? specialtyId) async {
    final current = state.value;
    if (current == null || current.showingClinics) return;

    final updated = specialtyId == null
        ? current.copyWith(clearSpecialty: true)
        : current.copyWith(specialtyId: specialtyId);
    await _refetch(updated);
  }
}
