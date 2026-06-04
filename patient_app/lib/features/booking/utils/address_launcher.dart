import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> openDirections({Address? address}) async {
  if (address == null) return false;
  final lat = address.latitude;
  final lng = address.longitude;
  Uri uri;
  if (lat != null && lng != null) {
    uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
    );
  } else {
    final parts = <String>[
      if (address.line1 != null && address.line1!.isNotEmpty) address.line1!,
      if (address.communeName != null && address.communeName!.isNotEmpty)
        address.communeName!,
      if (address.wilayaName != null && address.wilayaName!.isNotEmpty)
        address.wilayaName!,
    ];
    if (parts.isEmpty) return false;
    uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(parts.join(', '))}',
    );
  }
  if (await canLaunchUrl(uri)) {
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }
  return false;
}
