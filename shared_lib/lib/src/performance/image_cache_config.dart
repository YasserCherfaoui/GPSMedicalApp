import 'package:flutter/painting.dart';

/// Tunes Flutter's in-memory image cache for low-end Android devices (9.7).
///
/// Call once after [WidgetsFlutterBinding.ensureInitialized].
void configureGpsImageCache({
  int maximumSize = 50,
  int maximumSizeBytes = 32 << 20,
}) {
  final cache = PaintingBinding.instance.imageCache;
  cache.maximumSize = maximumSize;
  cache.maximumSizeBytes = maximumSizeBytes;
}
