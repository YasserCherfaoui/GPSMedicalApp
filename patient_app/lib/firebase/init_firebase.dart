import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../firebase_options.dart';

/// Initializes Firebase when FlutterFire config files are present.
///
/// Safe to call before [runApp]; no-ops in tests and when config is missing.
Future<void> initPatientFirebase() async {
  if (!DefaultFirebaseOptions.isConfigured) {
    if (kDebugMode) {
      debugPrint(
        'Firebase: skipped — run `make -C mobile configure-firebase-patient`',
      );
    }
    return;
  }

  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    if (kDebugMode) {
      debugPrint('Firebase: init skipped — $e');
    }
  }
}
