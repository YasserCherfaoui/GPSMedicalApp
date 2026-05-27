// File generated from Firebase config (gps-medical-dev).
// Re-run `make -C mobile configure-firebase-patient` after adding platforms or flavors.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for the GPS Médical patient app.
class DefaultFirebaseOptions {
  static bool get isConfigured => true;

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNcxkxBtjJCG89grIjYSUjtbjlvCjQfk0',
    appId: '1:647636807219:android:35b41f6682c4a20d393d46',
    messagingSenderId: '647636807219',
    projectId: 'gps-medical-dev',
    storageBucket: 'gps-medical-dev.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5sJnJ_vaT3tIuYUxuYX9BcXDAMmb19h4',
    appId: '1:647636807219:ios:7c6393de3a22b4ad393d46',
    messagingSenderId: '647636807219',
    projectId: 'gps-medical-dev',
    storageBucket: 'gps-medical-dev.firebasestorage.app',
    iosBundleId: 'com.gpsmedical.patientApp',
  );
}
