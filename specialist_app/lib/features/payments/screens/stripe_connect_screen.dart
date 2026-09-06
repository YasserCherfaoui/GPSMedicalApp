import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/stripe_connect.provider.dart';
import '../repositories/stripe_connect_repository.dart';
import '../utils/connect_url_launcher.dart';

/// Specialist Stripe Connect onboarding / status (Phase 6.1 W31).
class StripeConnectScreen extends ConsumerStatefulWidget {
  const StripeConnectScreen({super.key});

  @override
  ConsumerState<StripeConnectScreen> createState() =>
      _StripeConnectScreenState();
}

class _StripeConnectScreenState extends ConsumerState<StripeConnectScreen> {
  bool _openingLink = false;

  String _statusLabel(AppLocalizations l10n, String status) {
    return switch (status) {
      'incomplete' => l10n.stripeConnectStatusIncomplete,
      'pending' => l10n.stripeConnectStatusPending,
      'active' => l10n.stripeConnectStatusActive,
      'restricted' => l10n.stripeConnectStatusRestricted,
      _ => status,
    };
  }

  Color _statusColor(ColorScheme scheme, String status) {
    return switch (status) {
      'active' => scheme.primary,
      'pending' => scheme.tertiary,
      'restricted' => scheme.error,
      _ => scheme.onSurfaceVariant,
    };
  }

  Future<void> _openOnboarding(ConnectAccount account) async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _openingLink = true);
    try {
      final repo = ref.read(stripeConnectRepositoryProvider);
      final link = await repo.createOnboardingLink(account.id);
      final ok = await openConnectOnboardingUrl(link.url);
      if (!mounted) return;
      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.stripeConnectOpenLinkError)),
        );
      } else {
        await ref.read(myConnectAccountProvider.notifier).refresh();
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.stripeConnectOpenLinkError)),
      );
    } finally {
      if (mounted) setState(() => _openingLink = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final async = ref.watch(myConnectAccountProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.stripeConnectTitle)),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(GpsSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.stripeConnectLoadError),
                const SizedBox(height: GpsSpacing.md),
                FilledButton(
                  onPressed: () =>
                      ref.read(myConnectAccountProvider.notifier).refresh(),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (account) {
          if (account == null) {
            return ListView(
              padding: const EdgeInsets.all(GpsSpacing.lg),
              children: [
                GpsCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.stripeConnectNotProvisionedTitle,
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      Text(l10n.stripeConnectNotProvisionedBody),
                    ],
                  ),
                ),
              ],
            );
          }

          final statusColor = _statusColor(theme.colorScheme, account.status);
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(myConnectAccountProvider.notifier).refresh();
            },
            child: ListView(
              padding: const EdgeInsets.all(GpsSpacing.lg),
              children: [
                GpsCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.stripeConnectBody,
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: GpsSpacing.md),
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: statusColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: GpsSpacing.sm),
                          Text(
                            _statusLabel(l10n, account.status),
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: statusColor,
                            ),
                          ),
                          if (account.requirementsDueCount > 0) ...[
                            const SizedBox(width: GpsSpacing.sm),
                            Text(
                              '(${account.requirementsDueCount})',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ],
                      ),
                      if (account.needsOnboarding) ...[
                        const SizedBox(height: GpsSpacing.sm),
                        Text(
                          l10n.stripeConnectPollingHint,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (account.needsOnboarding) ...[
                  const SizedBox(height: GpsSpacing.lg),
                  PrimaryButton(
                    label: l10n.stripeConnectOnboardingCta,
                    isLoading: _openingLink,
                    onPressed: _openingLink
                        ? null
                        : () => _openOnboarding(account),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
