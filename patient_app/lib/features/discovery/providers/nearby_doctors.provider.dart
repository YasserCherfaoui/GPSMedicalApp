import 'package:geolocator/geolocator.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/location_permission.dart';
import '../utils/wilaya_centroids.dart';
import 'discovery_repositories.provider.dart';

part 'nearby_doctors.provider.g.dart';

class NearbyDoctorsState {
  const NearbyDoctorsState({
    required this.doctors,
    required this.lat,
    required this.lng,
    required this.radiusKm,
    this.permissionGranted = false,
    this.specialtyId,
    this.manualWilayaCode,
  });

  final List<DoctorWithDistance> doctors;
  final double lat;
  final double lng;
  final double radiusKm;
  final bool permissionGranted;
  final String? specialtyId;
  final String? manualWilayaCode;

  NearbyDoctorsState copyWith({
    List<DoctorWithDistance>? doctors,
    double? lat,
    double? lng,
    double? radiusKm,
    bool? permissionGranted,
    String? specialtyId,
    String? manualWilayaCode,
    bool clearSpecialty = false,
    bool clearManualWilaya = false,
  }) {
    return NearbyDoctorsState(
      doctors: doctors ?? this.doctors,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      radiusKm: radiusKm ?? this.radiusKm,
      permissionGranted: permissionGranted ?? this.permissionGranted,
      specialtyId: clearSpecialty ? null : (specialtyId ?? this.specialtyId),
      manualWilayaCode: clearManualWilaya
          ? null
          : (manualWilayaCode ?? this.manualWilayaCode),
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
      lat: lat,
      lng: lng,
      radiusKm: 5,
      permissionGranted: granted,
    );

    final doctors = await _fetchNearby(stateObj);
    return stateObj.copyWith(doctors: doctors);
  }

  Future<List<DoctorWithDistance>> _fetchNearby(
    NearbyDoctorsState current,
  ) async {
    return ref.read(geoRepositoryProvider).fetchNearby(
      lat: current.lat,
      lng: current.lng,
      radiusKm: current.radiusKm,
      specialtyId: current.specialtyId,
    );
  }

  /// Refetches doctors while keeping the map mounted (no [AsyncLoading] flash).
  Future<void> _refetch(NearbyDoctorsState next) async {
    final current = state.value;
    if (current == null) return;

    state = AsyncValue.data(next.copyWith(doctors: current.doctors));
    state = await AsyncValue.guard(() async {
      final docs = await _fetchNearby(next);
      return next.copyWith(doctors: docs);
    });
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
        lat: position.latitude,
        lng: position.longitude,
        radiusKm: current?.radiusKm ?? 5,
        permissionGranted: true,
        specialtyId: current?.specialtyId,
      );
      await _refetch(updated.copyWith(clearManualWilaya: true));
    } catch (_) {}
  }

  Future<void> setWilayaCenter(String wilayaCode) async {
    final (lat, lng) = wilayaCentroid(wilayaCode);
    final current = state.value;
    if (current == null) return;

    await _refetch(
      current.copyWith(
        lat: lat,
        lng: lng,
        manualWilayaCode: wilayaCode,
        permissionGranted: false,
      ),
    );
  }

  Future<void> updateRadius(double radiusKm) async {
    final current = state.value;
    if (current == null || current.radiusKm == radiusKm) return;
    await _refetch(current.copyWith(radiusKm: radiusKm));
  }

  Future<void> filterBySpecialty(String? specialtyId) async {
    final current = state.value;
    if (current == null) return;

    final updated = specialtyId == null
        ? current.copyWith(clearSpecialty: true)
        : current.copyWith(specialtyId: specialtyId);
    await _refetch(updated);
  }
}
