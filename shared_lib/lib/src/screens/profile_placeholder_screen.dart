import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../auth/auth_session.provider.dart';
import '../models/app_info.dart';
import '../routing/gps_routes.dart';
import '../theme/gps_spacing.dart';
import '../widgets/gps_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';

class ProfilePlaceholderScreen extends ConsumerWidget {
  const ProfilePlaceholderScreen({required this.appInfo, super.key});

  final GpsMedicalAppInfo appInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(appInfo.displayName)),
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
                        Text(
                          'Profil — placeholder',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: GpsSpacing.sm),
                        Text(
                          'Session active (token masqué).',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'Rôle: ${appInfo.clientKind.name}',
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
