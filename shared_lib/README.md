# gps_medical_shared

Shared Flutter library for the GPS Médical patient and specialist mobile apps: theme, auth, routing, API client, and the Phase 2 design system.

## Design system widgets (Phase 2 — Doctor Discovery)

| Widget | Purpose | Example |
|--------|---------|---------|
| `DoctorCard` | List/map doctor summary with photo, chips, rating, fee, CTA | `DoctorCard(name: 'Dr. X', specialty: 'Cardio', ...)` |
| `SpecialtyChip` | Compact specialty label | `SpecialtyChip(label: 'Pédiatrie')` |
| `RatingDisplay` | Star rating + review count | `RatingDisplay(rating: 4.8, count: 12)` |
| `EmptyState` | No-results placeholder with optional action | `EmptyState(title: 'Vide', message: '...', onAction: ...)` |
| `ErrorState` | Recoverable error with retry | `ErrorState(title: 'Erreur', onRetry: ...)` |
| `LoadingSkeleton` | Shimmer placeholder for lists | `LoadingSkeleton.card()` |

Import from the barrel:

```dart
import 'package:gps_medical_shared/gps_medical_shared.dart';
```

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
