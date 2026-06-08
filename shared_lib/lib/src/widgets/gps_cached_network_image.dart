import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Disk- and memory-cached network image with decode size caps for list avatars.
class GpsCachedNetworkImage extends StatelessWidget {
  const GpsCachedNetworkImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.memCacheWidth,
    this.memCacheHeight,
    this.placeholder,
    this.error,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final Widget? placeholder;
  final Widget? error;

  @override
  Widget build(BuildContext context) {
    final child = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      placeholder: placeholder == null ? null : (_, __) => placeholder!,
      errorWidget: error == null ? null : (_, __, ___) => error!,
    );

    if (borderRadius == null) return child;
    return ClipRRect(borderRadius: borderRadius!, child: child);
  }
}

/// Computes a memory-cache pixel dimension from logical size and DPR.
int gpsMemCachePixels(BuildContext context, double logicalSize) {
  final ratio = MediaQuery.devicePixelRatioOf(context);
  return (logicalSize * ratio).round().clamp(1, 1024);
}
