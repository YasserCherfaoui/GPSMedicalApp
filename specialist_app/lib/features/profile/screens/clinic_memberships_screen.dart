import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/clinic_memberships.provider.dart';

class ClinicMembershipsScreen extends ConsumerStatefulWidget {
  const ClinicMembershipsScreen({super.key});

  @override
  ConsumerState<ClinicMembershipsScreen> createState() =>
      _ClinicMembershipsScreenState();
}

class _ClinicMembershipsScreenState
    extends ConsumerState<ClinicMembershipsScreen> {
  final _busyIds = <String>{};

  List<ClinicMembership> _invitations(List<ClinicMembership> items) {
    return items
        .where((m) => m.status == ClinicMembershipStatus.invited)
        .toList();
  }

  List<ClinicMembership> _active(List<ClinicMembership> items) {
    return items
        .where(
          (m) =>
              m.status == ClinicMembershipStatus.active ||
              m.status == ClinicMembershipStatus.detachRequested,
        )
        .toList();
  }

  Future<void> _runAction(
    String membershipId,
    Future<void> Function() action,
  ) async {
    setState(() => _busyIds.add(membershipId));
    try {
      await action();
    } catch (_) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.clinicMembershipsActionError)),
      );
    } finally {
      if (mounted) {
        setState(() => _busyIds.remove(membershipId));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final async = ref.watch(clinicMembershipsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.clinicMembershipsTitle)),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.clinicMembershipsLoadError),
              const SizedBox(height: GpsSpacing.md),
              FilledButton(
                onPressed: () =>
                    ref.read(clinicMembershipsProvider.notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
        data: (items) {
          final invitations = _invitations(items);
          final active = _active(items);
          if (invitations.isEmpty && active.isEmpty) {
            return Center(child: Text(l10n.clinicMembershipsEmpty));
          }
          return RefreshIndicator(
            onRefresh: () =>
                ref.read(clinicMembershipsProvider.notifier).refresh(),
            child: ListView(
              padding: const EdgeInsets.all(GpsSpacing.lg),
              children: [
                if (invitations.isNotEmpty) ...[
                  Text(
                    l10n.clinicMembershipsInvitations,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: GpsSpacing.sm),
                  for (final membership in invitations)
                    _InvitationCard(
                      membership: membership,
                      busy: _busyIds.contains(membership.id),
                      onAccept: () => _runAction(
                        membership.id!,
                        () => ref
                            .read(clinicMembershipsProvider.notifier)
                            .accept(membership.id!),
                      ),
                      onRefuse: () => _runAction(
                        membership.id!,
                        () => ref
                            .read(clinicMembershipsProvider.notifier)
                            .refuse(membership.id!),
                      ),
                    ),
                  const SizedBox(height: GpsSpacing.lg),
                ],
                if (active.isNotEmpty) ...[
                  Text(
                    l10n.clinicMembershipsActive,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: GpsSpacing.sm),
                  for (final membership in active)
                    _ActiveCard(
                      membership: membership,
                      busy: _busyIds.contains(membership.id),
                      onToggleVisible: (visible) => _runAction(
                        membership.id!,
                        () => ref
                            .read(clinicMembershipsProvider.notifier)
                            .setVisibleOnProfile(
                              membershipId: membership.id!,
                              visible: visible,
                            ),
                      ),
                      onDetach:
                          membership.status == ClinicMembershipStatus.active
                          ? () => _runAction(
                              membership.id!,
                              () => ref
                                  .read(clinicMembershipsProvider.notifier)
                                  .requestDetach(membership.id!),
                            )
                          : null,
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

class _InvitationCard extends StatelessWidget {
  const _InvitationCard({
    required this.membership,
    required this.busy,
    required this.onAccept,
    required this.onRefuse,
  });

  final ClinicMembership membership;
  final bool busy;
  final VoidCallback onAccept;
  final VoidCallback onRefuse;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(bottom: GpsSpacing.sm),
      child: GpsCard(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                membership.clinicName ?? '',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: GpsSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      label: l10n.clinicMembershipsRefuse,
                      expand: false,
                      onPressed: busy ? null : onRefuse,
                    ),
                  ),
                  const SizedBox(width: GpsSpacing.sm),
                  Expanded(
                    child: PrimaryButton(
                      label: l10n.clinicMembershipsAccept,
                      expand: false,
                      onPressed: busy ? null : onAccept,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActiveCard extends StatelessWidget {
  const _ActiveCard({
    required this.membership,
    required this.busy,
    required this.onToggleVisible,
    this.onDetach,
  });

  final ClinicMembership membership;
  final bool busy;
  final ValueChanged<bool> onToggleVisible;
  final VoidCallback? onDetach;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pendingDetach =
        membership.status == ClinicMembershipStatus.detachRequested;
    return Padding(
      padding: const EdgeInsets.only(bottom: GpsSpacing.sm),
      child: GpsCard(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                membership.clinicName ?? '',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.clinicMembershipsVisibleOnProfile),
                value: membership.visibleOnProfile ?? false,
                onChanged: busy ? null : onToggleVisible,
              ),
              if (pendingDetach)
                Text(
                  l10n.clinicMembershipsDetachPending,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              else if (onDetach != null)
                SecondaryButton(
                  label: l10n.clinicMembershipsDetach,
                  onPressed: busy ? null : onDetach,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
