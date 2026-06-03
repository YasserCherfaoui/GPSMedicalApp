import 'package:geolocator/geolocator.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    final permission = await Permission.locationWhenInUse.status;
    final granted = permission.isGranted;

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

  Future<void> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (!status.isGranted) return;

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 5),
      );
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        final updated = NearbyDoctorsState(
          doctors: [],
          lat: position.latitude,
          lng: position.longitude,
          radiusKm: state.value?.radiusKm ?? 5,
          permissionGranted: true,
          specialtyId: state.value?.specialtyId,
        );
        final docs = await _fetchNearby(updated);
        return updated.copyWith(doctors: docs, clearManualWilaya: true);
      });
    } catch (_) {}
  }

  Future<void> setWilayaCenter(String wilayaCode) async {
    final (lat, lng) = wilayaCentroid(wilayaCode);
    final current = state.value;
    if (current == null) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final updated = current.copyWith(
        lat: lat,
        lng: lng,
        manualWilayaCode: wilayaCode,
        permissionGranted: false,
      );
      final docs = await _fetchNearby(updated);
      return updated.copyWith(doctors: docs);
    });
  }

  Future<void> updateRadius(double radiusKm) async {
    final current = state.value;
    if (current == null || current.radiusKm == radiusKm) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final updated = current.copyWith(radiusKm: radiusKm);
      final docs = await _fetchNearby(updated);
      return updated.copyWith(doctors: docs);
    });
  }

  Future<void> filterBySpecialty(String? specialtyId) async {
    final current = state.value;
    if (current == null) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final updated = specialtyId == null
          ? current.copyWith(clearSpecialty: true)
          : current.copyWith(specialtyId: specialtyId);
      final docs = await _fetchNearby(updated);
      return updated.copyWith(doctors: docs);
    });
  }
}
