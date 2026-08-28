import 'package:flutter/foundation.dart';

/// Console logs for pain-localization download / WebView bootstrap.
/// Filter Xcode / `flutter logs` with `[pain3d]`.
void pain3dLog(String message, [Object? error, StackTrace? stackTrace]) {
  debugPrint('[pain3d] $message');
  if (error != null) {
    debugPrint('[pain3d]   $error');
  }
  if (stackTrace != null) {
    debugPrint('[pain3d]   $stackTrace');
  }
}
