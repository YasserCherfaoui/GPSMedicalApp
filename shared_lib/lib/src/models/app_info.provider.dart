import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_info.dart';

part 'app_info.provider.g.dart';

/// Overridden in each app entrypoint (`patient_app`, `specialist_app`).
@Riverpod(keepAlive: true)
GpsMedicalAppInfo appInfo(Ref ref) {
  throw UnimplementedError(
    'Override appInfoProvider in the app main() ProviderScope.',
  );
}
