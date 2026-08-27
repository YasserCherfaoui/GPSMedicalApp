import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/pain3d_body.dart';
import '../providers/pain_localization_flag.provider.dart';
import '../services/pain3d_analytics.dart';

/// Explicit male/female choice. Never infers from the patient profile.
class PainBodyChooserScreen extends ConsumerWidget {
  const PainBodyChooserScreen({super.key});

  Future<void> _choose(
    BuildContext context,
    WidgetRef ref,
    Pain3dBody body,
  ) async {
    await ref.read(pain3dBodyStoreProvider).write(body);
    ref
        .read(pain3dAnalyticsProvider)
        .log(Pain3dAnalytics.bodyChosen, properties: {'model': body.name});
    if (!context.mounted) return;
    context.go(GpsRoutes.painLocalizationBody(body.name));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.painLocalizationChooserTitle)),
      body: ListView(
        padding: const EdgeInsets.all(GpsSpacing.lg),
        children: [
          Text(
            l10n.painLocalizationChooserDisclaimer,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: GpsSpacing.lg),
          GpsCard(
            onTap: () => unawaited(_choose(context, ref, Pain3dBody.male)),
            child: Text(
              l10n.painLocalizationChooserMale,
              style: theme.textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: GpsSpacing.md),
          GpsCard(
            onTap: () => unawaited(_choose(context, ref, Pain3dBody.female)),
            child: Text(
              l10n.painLocalizationChooserFemale,
              style: theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
