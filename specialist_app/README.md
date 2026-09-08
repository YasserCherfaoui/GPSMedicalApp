# specialist_app

GPS Médical — specialist (médecin) mobile application.

## Shared library

Bootstraps via [`shared_lib`](../shared_lib): theme, auth, API client, design system, and messaging widgets.

## Routing

Uses a dedicated [`go_router`](lib/routing/specialist_router.dart) config (not the patient `discover` shell). Post-login:

- `verification_status != verified` → verification-pending screen (stub until A-10.3)
- verified → five-tab shell (Inbox, Calendar, Messages, Profile, Stats — placeholders in pre-flight)

## l10n

ARB files live in `shared_lib/lib/src/l10n/` (`app_fr.arb`, `app_ar.arb`, `app_ber.arb`). Specialist-specific keys use the `specialist*` prefix. Regenerate:

```bash
cd shared_lib && flutter gen-l10n
```

## Firebase / FCM (dev)

Project: **`gps-medical-dev`**

| Platform | Dev app ID |
|----------|------------|
| Android (`dev` flavor) | `com.gpsmedical.specialist_app.dev` |
| iOS (`dev` flavor) | `com.gpsmedical.specialistApp.dev` |

### One-time setup

1. Re-authenticate Firebase CLI (token expires periodically):

   ```bash
   firebase login --reauth
   ```

2. From the repo root, generate config files and `lib/firebase_options.dart`:

   ```bash
   make -C mobile configure-firebase-specialist
   ```

3. Confirm files exist:

   ```bash
   test -f mobile/specialist_app/android/app/src/dev/google-services.json
   test -f mobile/specialist_app/ios/Runner/GoogleService-Info.plist
   ```

4. Run the **dev** flavor (required so the Android package / iOS bundle match Firebase):

   ```bash
   cd mobile/specialist_app
   flutter run --flavor dev --dart-define-from-file=config/dev.json
   ```

Until step 2 completes, the app builds and runs but **skips** Firebase init (debug log only). After login it registers the FCM token via `POST /notifications/devices`. Watch debug logs for `Specialist push registration skipped` if registration fails.

## Run

```bash
cd specialist_app && flutter run --flavor dev --dart-define-from-file=config/dev.json
```

## Tests

```bash
flutter test
make -C mobile ci   # includes specialist_app analyze + tests
```
