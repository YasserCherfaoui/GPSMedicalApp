import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

/// Whether the app may read the device location (when-in-use).
Future<bool> isLocationWhenInUseGranted() async {
  final permission = await Geolocator.checkPermission();
  return permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always;
}

/// Prompts for when-in-use location if needed. Returns false if denied.
Future<bool> requestLocationWhenInUse() async {
  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.deniedForever) {
    await openAppSettings();
    return false;
  }
  return permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always;
}
