import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location.provider.g.dart';

class UserLocationState {
  const UserLocationState({
    this.lat,
    this.lng,
    this.permissionGranted = false,
  });

  final double? lat;
  final double? lng;
  final bool permissionGranted;

  bool get hasCoordinates => lat != null && lng != null;
}

@Riverpod(keepAlive: true)
class UserLocation extends _$UserLocation {
  @override
  Future<UserLocationState> build() async {
    final permission = await Permission.locationWhenInUse.status;
    if (!permission.isGranted) {
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
      final status = await Permission.locationWhenInUse.request();
      if (!status.isGranted) {
        return const UserLocationState();
      }
      return _readPosition();
    });
  }
}
