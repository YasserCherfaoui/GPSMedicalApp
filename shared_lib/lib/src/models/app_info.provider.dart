import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_info.dart';

/// Overridden in each app entrypoint (`patient_app`, `specialist_app`).
final appInfoProvider = Provider<GpsMedicalAppInfo>(
  (ref) => throw UnimplementedError(
    'Override appInfoProvider in the app main() ProviderScope.',
  ),
);
