# patient_app

GPS Médical — patient mobile application (Flutter).

## Firebase / FCM (dev)

Project: **`gps-medical-dev`**

| Platform | Dev app ID |
|----------|------------|
| Android (`dev` flavor) | `com.gpsmedical.patient_app.dev` |
| iOS | `com.gpsmedical.patientApp` |

### One-time setup (after creating the Firebase project)

1. Re-authenticate Firebase CLI (token expires periodically):

   ```bash
   firebase login --reauth
   ```

2. From the repo root, generate config files and `lib/firebase_options.dart`:

   ```bash
   make -C mobile configure-firebase-patient
   ```

3. Confirm files exist:

   ```bash
   test -f mobile/patient_app/android/app/src/dev/google-services.json
   test -f mobile/patient_app/ios/Runner/GoogleService-Info.plist
   ```

4. Run the dev flavor:

   ```bash
   cd mobile/patient_app
   flutter run --flavor dev --dart-define=APP_FLAVOR=dev
   ```

Until step 2 completes, the app builds and runs but **skips** Firebase init (debug log only).

### Google Maps (nearby doctors tab)

#### API keys (recommended)

1. Copy the template and add your key(s):

   ```bash
   cd mobile/patient_app
   cp secrets.env.example secrets.env
   # Edit secrets.env — set GOOGLE_MAPS_API_KEY=AIza...
   ```

2. Apply to iOS and Android native config (gitignored generated files):

   ```bash
   make -C mobile setup-maps-secrets
   ```

3. Full rebuild:

   ```bash
   flutter run --flavor dev --dart-define=APP_FLAVOR=dev
   ```

| Variable | Purpose |
| -------- | ------- |
| `GOOGLE_MAPS_API_KEY` | Same key for iOS and Android |
| `GOOGLE_MAPS_API_KEY_IOS` | iOS-only (overrides generic for iOS) |
| `GOOGLE_MAPS_API_KEY_ANDROID` | Android-only (overrides generic for Android) |

Generated files (do not commit): `ios/Flutter/MapsSecrets.xcconfig`, `android/maps-secrets.properties`.

**Fallback:** if those files are missing, Android reads `google-services.json` and iOS reads `GoogleService-Info.plist` (`API_KEY`).

On [Google Cloud Console](https://console.cloud.google.com/) for project `gpsmedical`, enable **Maps SDK for iOS** and **Maps SDK for Android** on the key you use.

If the map shows pins on a blank gray background (no roads or labels), the SDK is running but **tile loading failed** — usually because the API key’s **iOS application restrictions** omit your flavor bundle ID:

| Flavor  | iOS bundle ID                    |
| ------- | -------------------------------- |
| dev     | `com.gpsmedical.patientApp.dev`  |
| staging | `com.gpsmedical.patientApp.staging` |
| prod    | `com.gpsmedical.patientApp`      |

Either allow all three bundle IDs on the key, or use an unrestricted key for local development.

After changing native iOS config, run `cd ios && pod install` once, then **full rebuild** the app (not hot reload).

**Manual map center:** when GPS is denied, the wilaya/commune picker centers the map using `latitude`/`longitude` from `GET /geo/wilayas` and `GET /geo/wilayas/{code}/communes` (see [ADR 0010](../../docs/adr/0010-geo-reference-coordinates.md)). `lib/features/discovery/utils/wilaya_centroids.dart` is only a fallback if API coordinates are missing.

### iOS push (manual, Firebase Console)

Project settings → Cloud Messaging → upload your **APNs authentication key** (or certificate) so FCM can reach iOS devices.

### Backend (Week 9)

Server-side FCM uses a service account from the same Firebase project. See `backend/.env.example` (`FCM_*`).
