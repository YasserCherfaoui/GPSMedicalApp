import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../auth/auth_session.provider.dart';
import '../auth/gps_medical_client.provider.dart';
import '../models/app_info.dart';
import '../routing/gps_routes.dart';
import '../theme/gps_spacing.dart';
import '../widgets/gps_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';

class ProfilePlaceholderScreen extends ConsumerStatefulWidget {
  const ProfilePlaceholderScreen({required this.appInfo, super.key});

  final GpsMedicalAppInfo appInfo;

  @override
  ConsumerState<ProfilePlaceholderScreen> createState() =>
      _ProfilePlaceholderScreenState();
}

class _ProfilePlaceholderScreenState
    extends ConsumerState<ProfilePlaceholderScreen> {
  int _tapCount = 0;
  DateTime? _lastTapTime;

  void _handleTap() {
    final now = DateTime.now();
    if (_lastTapTime == null ||
        now.difference(_lastTapTime!) > const Duration(seconds: 2)) {
      _tapCount = 1;
    } else {
      _tapCount++;
    }
    _lastTapTime = now;

    if (_tapCount >= 5) {
      _tapCount = 0;
      _showQaDialog();
    }
  }

  void _showQaDialog() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final client = ref.read(gpsMedicalClientProvider);
    const activeFlavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    const sentryDsn = String.fromEnvironment(
      'SENTRY_DSN',
      defaultValue: 'Not Set',
    );

    if (!mounted) return;

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Row(
            children: [
              Icon(Icons.bug_report_outlined, color: theme.colorScheme.error),
              const SizedBox(width: GpsSpacing.xs),
              Text(
                'QA Diagnostic Info',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(theme, 'App Name', packageInfo.appName),
                _buildInfoRow(theme, 'Package Name', packageInfo.packageName),
                _buildInfoRow(theme, 'Version', packageInfo.version),
                _buildInfoRow(theme, 'Build Number', packageInfo.buildNumber),
                _buildInfoRow(
                  theme,
                  'Active Flavor',
                  activeFlavor.toUpperCase(),
                ),
                _buildInfoRow(theme, 'API Root URL', client.apiRootUrl),
                _buildInfoRow(theme, 'Sentry DSN', sentryDsn),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.primary,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(ThemeData theme, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GpsSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          SelectableText(
            value.isEmpty ? 'N/A' : value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: 'monospace',
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.appInfo.displayName)),
      body: SafeArea(
        child: Center(
          child: MaxWidthBox(
            maxWidth: 640,
            child: Padding(
              padding: const EdgeInsets.all(GpsSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GpsCard(
                    showAccentBorder: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: _handleTap,
                          behavior: HitTestBehavior.opaque,
                          child: Text(
                            'Profil — placeholder',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        const SizedBox(height: GpsSpacing.sm),
                        Text(
                          'Session active (token masqué).',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'Rôle: ${widget.appInfo.clientKind.name}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SecondaryButton(
                    label: 'Simuler expiration de session',
                    onPressed: () {
                      ref.read(authSessionProvider).handleSessionExpired();
                    },
                  ),
                  const SizedBox(height: GpsSpacing.sm),
                  PrimaryButton(
                    label: 'Se déconnecter',
                    onPressed: () async {
                      await ref.read(authSessionProvider).signOut();
                      if (context.mounted) {
                        context.go(GpsRoutes.login);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
