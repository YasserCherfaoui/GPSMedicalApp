# gps_medical_shared

Shared Flutter library for the GPS Médical patient and specialist mobile apps: theme, auth, routing, API client, and the Phase 2 design system.

## Design system widgets (Phase 2 — Doctor Discovery)

| Widget | Purpose | Example |
|--------|---------|---------|
| `DoctorCard` | List or map doctor summary with photo, chips, rating, fee, CTA | See variants below |
| `SpecialtyChip` | Compact specialty label | `SpecialtyChip(label: 'Pédiatrie')` |
| `RatingDisplay` | Star rating + review count | `RatingDisplay(rating: 4.8, count: 12)` |
| `EmptyState` | No-results placeholder with optional action | `EmptyState(title: 'Vide', message: '...', onAction: ...)` |
| `ErrorState` | Recoverable error with retry | `ErrorState(title: 'Erreur', onRetry: ...)` |
| `LoadingSkeleton` / `LoadingShimmer` | Shimmer placeholder for lists | `LoadingShimmer.card()` |

Import from the barrel:

```dart
import 'package:gps_medical_shared/gps_medical_shared.dart';
```

### DoctorCard variants

**List** (default) — full row for search and list screens:

```dart
DoctorCard(
  name: 'Dr. Karim Benali',
  specialty: 'Cardiologie',
  specialtyChips: const ['Cardiologie', 'Médecine interne'],
  rating: 4.9,
  reviewCount: 42,
  city: 'Alger',
  fee: 2500,
  isVerified: true,
  offersTelehealth: true,
  distanceKm: 3.2,
  onBookPressed: () {},
  onFavoritePressed: () {},
  onTap: () {},
)
```

**Map** — compact horizontal card for map bottom sheets:

```dart
DoctorCard(
  variant: DoctorCardVariant.map,
  name: 'Dr. Amira S.',
  specialty: 'Cardiologie',
  rating: 4.9,
  reviewCount: 12,
  city: 'Alger',
  fee: 2500,
  distanceKm: 2.1,
  isVerified: true,
  matchPercentage: 96,
  onBookPressed: () {},
  onTap: () {},
)
```

Discovery screens use `buildDoctorCardTile()` in `patient_app` to map API `Doctor` models to `DoctorCard`; pass `variant: DoctorCardVariant.map` on the nearby-doctors map screen.

Widget tests live in `test/widgets/design_system_widgets_test.dart`.

## Getting started

Add a path dependency in your app `pubspec.yaml`:

```yaml
dependencies:
  gps_medical_shared:
    path: ../shared_lib
```

Regenerate OpenAPI models from the repo root:

```bash
make -C mobile gen-models
```

Regenerate localizations after editing `lib/src/l10n/app_*.arb`:

```bash
cd mobile/shared_lib && flutter gen-l10n
```
