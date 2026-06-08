import 'package:flutter/material.dart';

import '../theme/gps_radii.dart';
import 'gps_cached_network_image.dart';

/// Doctor portrait with cached network loading (circle or rounded square).
class GpsDoctorPhoto extends StatelessWidget {
  const GpsDoctorPhoto({
    required this.size,
    this.imageUrl,
    this.shape = GpsDoctorPhotoShape.rounded,
    super.key,
  });

  final double size;
  final String? imageUrl;
  final GpsDoctorPhotoShape shape;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasUrl = imageUrl != null && imageUrl!.isNotEmpty;
    final mem = gpsMemCachePixels(context, size);

    final placeholder = ColoredBox(
      color: colorScheme.surfaceContainerHigh,
      child: Icon(
        Icons.person,
        color: colorScheme.onSurfaceVariant,
        size: size * 0.45,
      ),
    );

    if (!hasUrl) {
      return _frame(child: placeholder);
    }

    return _frame(
      child: GpsCachedNetworkImage(
        imageUrl: imageUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        memCacheWidth: mem,
        memCacheHeight: mem,
        placeholder: placeholder,
        error: placeholder,
      ),
    );
  }

  Widget _frame({required Widget child}) {
    if (shape == GpsDoctorPhotoShape.circle) {
      return ClipOval(
        child: SizedBox(width: size, height: size, child: child),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(GpsRadii.lg),
      child: SizedBox(width: size, height: size, child: child),
    );
  }
}

enum GpsDoctorPhotoShape { circle, rounded }
