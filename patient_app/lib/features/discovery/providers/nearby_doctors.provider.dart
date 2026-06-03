import 'package:geolocator/geolocator.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nearby_doctors.provider.g.dart';

class NearbyDoctorsState {
  const NearbyDoctorsState({
    required this.doctors,
    required this.lat,
    required this.lng,
    required this.radiusKm,
    this.permissionGranted = false,
    this.specialtyId,
  });

  final List<DoctorWithDistance> doctors;
  final double lat;
  final double lng;
  final double radiusKm;
  final bool permissionGranted;
  final String? specialtyId;

  NearbyDoctorsState copyWith({
    List<DoctorWithDistance>? doctors,
    double? lat,
    double? lng,
    double? radiusKm,
    bool? permissionGranted,
    String? specialtyId,
    bool clearSpecialty = false,
  }) {
    return NearbyDoctorsState(
      doctors: doctors ?? this.doctors,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      radiusKm: radiusKm ?? this.radiusKm,
      permissionGranted: permissionGranted ?? this.permissionGranted,
      specialtyId: clearSpecialty ? null : (specialtyId ?? this.specialtyId),
    );
  }
}

@riverpod
class NearbyDoctors extends _$NearbyDoctors {
  // Default Alger coordinates
  static const double defaultLat = 36.7538;
  static const double defaultLng = 3.0588;

  @override
  Future<NearbyDoctorsState> build() async {
    // Initial state check for permission and setup default coordinates
    final permission = await Permission.locationWhenInUse.status;
    final granted = permission.isGranted;

    double lat = defaultLat;
    double lng = defaultLng;

    if (granted) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 5),
        );
        lat = position.latitude;
        lng = position.longitude;
      } catch (_) {
        // Fallback to default Alger coordinates on timeout/error
      }
    }

    final stateObj = NearbyDoctorsState(
      doctors: [],
      lat: lat,
      lng: lng,
      radiusKm: 5.0,
      permissionGranted: granted,
    );

    final doctors = await _fetchNearby(stateObj);
    return stateObj.copyWith(doctors: doctors);
  }

  Future<List<DoctorWithDistance>> _fetchNearby(
    NearbyDoctorsState current,
  ) async {
    final client = ref.watch(gpsMedicalClientProvider);
    final response = await client.v1.getGeolocationApi().geoDoctorsNearbyGet(
      lat: current.lat,
      lng: current.lng,
      radiusKm: current.radiusKm,
      specialtyId: current.specialtyId,
    );
    return response.data?.data?.toList() ?? [];
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
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
            radiusKm: state.value?.radiusKm ?? 5.0,
            permissionGranted: true,
            specialtyId: state.value?.specialtyId,
          );
          final docs = await _fetchNearby(updated);
          return updated.copyWith(doctors: docs);
        });
      } catch (_) {
        // Fallback to current state on GPS error
      }
    }
  }

  Future<void> updateCenter(double lat, double lng) async {
    final current = state.value;
    if (current == null) return;
    if (current.lat == lat && current.lng == lng) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final updated = current.copyWith(lat: lat, lng: lng);
      final docs = await _fetchNearby(updated);
      return updated.copyWith(doctors: docs);
    });
  }

  Future<void> updateRadius(double radiusKm) async {
    final current = state.value;
    if (current == null) return;
    if (current.radiusKm == radiusKm) return;

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
