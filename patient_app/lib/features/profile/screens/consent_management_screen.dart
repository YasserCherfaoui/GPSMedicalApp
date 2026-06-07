import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/consents_list.provider.dart';
import '../utils/consent_display.dart';

class ConsentManagementScreen extends ConsumerStatefulWidget {
  const ConsentManagementScreen({super.key});

  @override
  ConsumerState<ConsentManagementScreen> createState() =>
      _ConsentManagementScreenState();
}

class _ConsentManagementScreenState
    extends ConsumerState<ConsentManagementScreen> {
  String? _revokingId;

  Future<void> _revokeMarketing() async {
    setState(() => _revokingId = 'marketing');
    try {
      await ref
          .read(consentsListProvider.notifier)
          .revoke(RevokeConsentRequestConsentTypeEnum.marketing);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.consentRevokeError),
        ),
      );
    } finally {
      if (mounted) setState(() => _revokingId = null);
    }
  }

  Future<void> _confirmEssentialRevoke(ConsentGrant grant) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.consentRevokeEssentialTitle),
        content: Text(l10n.consentRevokeEssentialMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.mapNearbyPermissionRationaleCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.consentRevokeEssentialConfirm),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _revokingId = grant.id);
    try {
      await ref.read(consentsListProvider.notifier).revoke(
        RevokeConsentRequestConsentTypeEnum.dataProcessing,
      );
      await ref.read(authSessionProvider).signOut();
      if (!mounted) return;
      context.go(GpsRoutes.consentRevoked);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.consentRevokeError)),
      );
    } finally {
      if (mounted) setState(() => _revokingId = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final consentsAsync = ref.watch(consentsListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.consentManagementTitle)),
      body: consentsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.networkError),
              const SizedBox(height: GpsSpacing.md),
              FilledButton(
                onPressed: () =>
                    ref.read(consentsListProvider.notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
        data: (consents) {
          if (consents.isEmpty) {
            return Center(child: Text(l10n.profileNotSet));
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(consentsListProvider.notifier).refresh(),
            child: ListView.separated(
              padding: const EdgeInsets.all(GpsSpacing.md),
              itemCount: consents.length,
              separatorBuilder: (_, __) => const SizedBox(height: GpsSpacing.sm),
              itemBuilder: (context, index) {
                final grant = consents[index];
                return _ConsentHistoryCard(
                  grant: grant,
                  locale: locale,
                  l10n: l10n,
                  revoking: _revokingId == grant.id,
                  onMarketingToggleOff: _revokeMarketing,
                  onEssentialRevoke: () => _confirmEssentialRevoke(grant),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ConsentHistoryCard extends StatelessWidget {
  const _ConsentHistoryCard({
    required this.grant,
    required this.locale,
    required this.l10n,
    required this.revoking,
    required this.onMarketingToggleOff,
    required this.onEssentialRevoke,
  });

  final ConsentGrant grant;
  final String locale;
  final AppLocalizations l10n;
  final bool revoking;
  final VoidCallback onMarketingToggleOff;
  final VoidCallback onEssentialRevoke;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final active = isActiveConsent(grant);
    final isMarketing =
        grant.consentType == ConsentGrantConsentTypeEnum.marketing;
    final isEssential = isEssentialConsentType(grant.consentType);

    return GpsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  consentTypeLabel(grant.consentType, l10n),
                  style: theme.textTheme.titleSmall,
                ),
              ),
              GpsBadge(label: active ? l10n.consentActive : l10n.consentRevoked),
            ],
          ),
          const SizedBox(height: GpsSpacing.sm),
          Text(
            l10n.consentVersionLabel(grant.version),
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: GpsSpacing.xs),
          Text(
            l10n.consentGrantedAtLabel(
              formatConsentDateTime(grant.grantedAt, locale),
            ),
            style: theme.textTheme.bodyMedium,
          ),
          if (grant.revokedAt != null) ...[
            const SizedBox(height: GpsSpacing.xs),
            Text(
              l10n.consentRevokedAtLabel(
                formatConsentDateTime(grant.revokedAt!, locale),
              ),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          if (active && isMarketing) ...[
            const SizedBox(height: GpsSpacing.md),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.consentMarketing),
              value: true,
              onChanged: revoking ? null : (_) => onMarketingToggleOff(),
            ),
          ],
          if (active && isEssential) ...[
            const SizedBox(height: GpsSpacing.sm),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton(
                onPressed: revoking ? null : onEssentialRevoke,
                child: Text(
                  l10n.consentRevokeEssential,
                  style: TextStyle(color: theme.colorScheme.error),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
