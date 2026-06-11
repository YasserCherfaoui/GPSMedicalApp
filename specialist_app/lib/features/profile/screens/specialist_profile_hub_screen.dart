import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../../routing/specialist_routes.dart';
import '../providers/specialist_profile.provider.dart';

/// Profile tab hub — entry to the profile editor (S-03/S-04).
class SpecialistProfileHubScreen extends ConsumerWidget {
  const SpecialistProfileHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final profileAsync = ref.watch(specialistProfileProvider);

    return profileAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.profileLoadError),
            const SizedBox(height: GpsSpacing.md),
            TextButton(
              onPressed: () =>
                  ref.read(specialistProfileProvider.notifier).refresh(),
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
      data: (profile) {
        final title = profile.title?.trim();
        final prefix = (title == null || title.isEmpty)
            ? l10n.doctorTitleDefault
            : title;
        final displayName = '$prefix ${profile.fullName ?? ''}'.trim();

        return ListView(
          padding: const EdgeInsets.all(GpsSpacing.lg),
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Text(
                displayName.isNotEmpty ? displayName[0].toUpperCase() : '?',
                style: theme.textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: GpsSpacing.md),
            Text(
              displayName,
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GpsSpacing.xs),
            Text(
              profile.verified == true
                  ? l10n.specialistProfileVerifiedBadge
                  : l10n.specialistProfileUnverifiedBadge,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GpsSpacing.xl),
            PrimaryButton(
              label: l10n.specialistProfileEditTitle,
              onPressed: () => context.push(SpecialistRoutes.profileEdit),
            ),
          ],
        );
      },
    );
  }
}
