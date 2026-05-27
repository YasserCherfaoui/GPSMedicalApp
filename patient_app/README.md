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

### iOS push (manual, Firebase Console)

Project settings → Cloud Messaging → upload your **APNs authentication key** (or certificate) so FCM can reach iOS devices.

### Backend (Week 9)

Server-side FCM uses a service account from the same Firebase project. See `backend/.env.example` (`FCM_*`).
