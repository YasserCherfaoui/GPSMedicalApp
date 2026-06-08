import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('configureGpsImageCache sets conservative limits', () {
    configureGpsImageCache(maximumSize: 42, maximumSizeBytes: 16 << 20);
    final cache = PaintingBinding.instance.imageCache;
    expect(cache.maximumSize, 42);
    expect(cache.maximumSizeBytes, 16 << 20);
  });
}
