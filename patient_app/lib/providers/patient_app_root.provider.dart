import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patient_app_root.provider.g.dart';

/// App flavor from `--dart-define=APP_FLAVOR=...` (dev / staging / prod).
///
/// Phase 2 feature providers live under `lib/features/{feature}/providers/`.
@Riverpod(keepAlive: true)
String patientAppFlavor(Ref ref) {
  return const String.fromEnvironment('APP_FLAVOR', defaultValue: 'dev');
}
