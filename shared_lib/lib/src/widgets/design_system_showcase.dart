import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routing/gps_routes.dart';
import '../theme/gps_spacing.dart';
import '../theme/gps_theme.dart';
import 'empty_state.dart';
import 'error_state.dart';
import 'gps_badge.dart';
import 'gps_card.dart';
import 'gps_modal.dart';
import 'gps_text_field.dart';
import 'loading_skeleton.dart';
import 'primary_button.dart';
import 'secondary_button.dart';

/// Whether the design-system showcase is available (debug builds only).
bool get isDesignSystemShowcaseEnabled =>
    false; // Set to kDebugMode to enable the design system FAB again

/// Visual QA screen for tokens and components.
class DesignSystemShowcaseScreen extends StatefulWidget {
  const DesignSystemShowcaseScreen({super.key});

  @override
  State<DesignSystemShowcaseScreen> createState() =>
      _DesignSystemShowcaseScreenState();
}

class _DesignSystemShowcaseScreenState
    extends State<DesignSystemShowcaseScreen> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: GpsTheme.light(),
      darkTheme: GpsTheme.dark(),
      themeMode: _themeMode,
      home: Builder(
        builder: (innerContext) => Scaffold(
          appBar: AppBar(
            title: const Text('Design System Showcase'),
            actions: [
              IconButton(
                tooltip: 'Toggle theme',
                onPressed: () {
                  setState(() {
                    _themeMode = _themeMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  });
                },
                icon: Icon(
                  _themeMode == ThemeMode.light
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                ),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(GpsSpacing.md),
            children: [
              Text(
                'Typography',
                style: Theme.of(innerContext).textTheme.displayLarge,
              ),
              Text(
                'H2 — Manrope',
                style: Theme.of(innerContext).textTheme.displayMedium,
              ),
              Text(
                'H3 — Manrope',
                style: Theme.of(innerContext).textTheme.headlineMedium,
              ),
              Text(
                'Body large — Inter. Medical clarity and generous whitespace.',
                style: Theme.of(innerContext).textTheme.bodyLarge,
              ),
              Text(
                'Body medium — Inter.',
                style: Theme.of(innerContext).textTheme.bodyMedium,
              ),
              Text(
                'LABEL CAPS',
                style: Theme.of(innerContext).textTheme.labelSmall,
              ),
              const SizedBox(height: GpsSpacing.lg),
              const Wrap(
                spacing: GpsSpacing.sm,
                children: [
                  GpsBadge(label: 'Cardiologie'),
                  GpsBadge(
                    label: 'Conventionné',
                    icon: Icons.verified_outlined,
                  ),
                ],
              ),
              const SizedBox(height: GpsSpacing.lg),
              PrimaryButton(label: 'Primary action', onPressed: () {}),
              const SizedBox(height: GpsSpacing.sm),
              SecondaryButton(label: 'Secondary action', onPressed: () {}),
              const SizedBox(height: GpsSpacing.lg),
              const GpsTextField(label: 'Téléphone', hint: '+213 555 00 00 00'),
              const SizedBox(height: GpsSpacing.lg),
              GpsCard(
                showAccentBorder: true,
                child: Text(
                  'Medical profile card with soft-blue accent.',
                  style: Theme.of(innerContext).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: GpsSpacing.lg),
              const LoadingSkeleton.card(),
              const LoadingSkeleton(height: 14),
              const SizedBox(height: GpsSpacing.lg),
              SizedBox(
                height: 200,
                child: EmptyState(
                  title: 'Aucun rendez-vous',
                  message: 'Vos prochains rendez-vous apparaîtront ici.',
                  actionLabel: 'Rechercher un médecin',
                  onAction: () {},
                ),
              ),
              const SizedBox(height: GpsSpacing.lg),
              SizedBox(
                height: 200,
                child: ErrorState(
                  title: 'Connexion impossible',
                  message: 'Vérifiez votre réseau et réessayez.',
                  onRetry: () {},
                ),
              ),
              const SizedBox(height: GpsSpacing.lg),
              SecondaryButton(
                label: 'Open modal',
                onPressed: () {
                  GpsModal.show<void>(
                    context: innerContext,
                    title: 'Confirmer',
                    message: 'Exemple de dialogue GPS Médical.',
                    primaryActionLabel: 'Confirmer',
                    secondaryActionLabel: 'Annuler',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Wraps [child] with a debug-only FAB that opens [DesignSystemShowcaseScreen].
class DesignSystemShowcaseLauncher extends StatelessWidget {
  const DesignSystemShowcaseLauncher({
    required this.router,
    required this.child,
    super.key,
  });

  final GoRouter router;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!isDesignSystemShowcaseEnabled) {
      return child;
    }

    return Stack(
      children: [
        child,
        Positioned(
          right: GpsSpacing.md,
          bottom: GpsSpacing.md,
          child: SafeArea(
            child: FloatingActionButton.small(
              heroTag: 'gps_design_showcase',
              onPressed: () => router.push(GpsRoutes.designSystemShowcase),
              child: const Icon(Icons.palette_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
