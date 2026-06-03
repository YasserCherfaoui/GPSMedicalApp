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
    apiKey: 'AIzaSyAZTeqlh2wWnnxwvWJXN3tJ-1Kh6K9K2es',
    appId: '1:32898565434:android:914d7760395c10a9a37c03',
    messagingSenderId: '32898565434',
    projectId: 'gpsmedical',
    storageBucket: 'gpsmedical.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIJNkzc9dUE-ULgIj4YdCIPNwEhTGsfvE',
    appId: '1:32898565434:ios:6a09368b87d80e5da37c03',
    messagingSenderId: '32898565434',
    projectId: 'gpsmedical',
    storageBucket: 'gpsmedical.firebasestorage.app',
    iosBundleId: 'com.gpsmedical.patientApp',
  );

}