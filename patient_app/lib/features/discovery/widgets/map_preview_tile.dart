import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Non-interactive map preview for doctor practice addresses (6.5).
class MapPreviewTile extends StatelessWidget {
  const MapPreviewTile({
    required this.latitude,
    required this.longitude,
    this.unavailableLabel = 'Carte indisponible',
    super.key,
  });

  final double? latitude;
  final double? longitude;
  final String unavailableLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final lat = latitude;
    final lng = longitude;

    if (lat == null || lng == null) {
      return _placeholder(context, colorScheme);
    }

    final position = LatLng(lat, lng);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(GpsRadii.lg),
      ),
      child: SizedBox(
        height: 120,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: position, zoom: 14),
          markers: {
            Marker(
              markerId: const MarkerId('practice'),
              position: position,
            ),
          },
          scrollGesturesEnabled: false,
          zoomGesturesEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          liteModeEnabled: true,
        ),
      ),
    );
  }

  Widget _placeholder(BuildContext context, ColorScheme colorScheme) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(GpsRadii.lg),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined, color: colorScheme.outline, size: 32),
            const SizedBox(height: GpsSpacing.xs),
            Text(
              unavailableLabel,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
