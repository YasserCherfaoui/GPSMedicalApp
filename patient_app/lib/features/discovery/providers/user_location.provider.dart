import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/location_permission.dart';

part 'user_location.provider.g.dart';

class UserLocationState {
  const UserLocationState({this.lat, this.lng, this.permissionGranted = false});

  final double? lat;
  final double? lng;
  final bool permissionGranted;

  bool get hasCoordinates => lat != null && lng != null;
}

@Riverpod(keepAlive: true)
class UserLocation extends _$UserLocation {
  @override
  Future<UserLocationState> build() async {
    if (!await isLocationWhenInUseGranted()) {
      return const UserLocationState();
    }
    return _readPosition();
  }

  Future<UserLocationState> _readPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
        timeLimit: const Duration(seconds: 5),
      );
      return UserLocationState(
        lat: position.latitude,
        lng: position.longitude,
        permissionGranted: true,
      );
    } catch (_) {
      return const UserLocationState(permissionGranted: true);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (!await requestLocationWhenInUse()) {
        return const UserLocationState();
      }
      return _readPosition();
    });
  }
}
