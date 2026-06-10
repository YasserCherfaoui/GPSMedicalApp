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

1. Register a distinct Android `applicationId` and iOS bundle ID in the Firebase console (`gpsmedical` project).
2. `firebase login --reauth`
3. From repo root:

```bash
make -C mobile configure-firebase-specialist
```

## Run

```bash
cd specialist_app && flutter run
```

## Tests

```bash
flutter test
make -C mobile ci   # includes specialist_app analyze + tests
```
