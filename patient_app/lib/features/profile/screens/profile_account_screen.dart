import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../notifications/utils/patient_sign_out.dart';
import '../providers/patient_profile.provider.dart';

class ProfileAccountScreen extends ConsumerStatefulWidget {
  const ProfileAccountScreen({super.key});

  @override
  ConsumerState<ProfileAccountScreen> createState() =>
      _ProfileAccountScreenState();
}

class _ProfileAccountScreenState extends ConsumerState<ProfileAccountScreen> {
  bool _deleting = false;

  Future<void> _confirmDelete(AppLocalizations l10n) async {
    final first = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.profileDeleteTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.profileDeleteWarning),
            const SizedBox(height: GpsSpacing.sm),
            Text(
              l10n.profileDeleteGracePeriod,
              style: Theme.of(ctx).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.mapNearbyPermissionRationaleCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.profileDeleteConfirm),
          ),
        ],
      ),
    );
    if (first != true || !mounted) return;

    final second = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.profileDeleteFinalTitle),
        content: Text(l10n.profileDeleteFinalMessage),
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
            child: Text(l10n.profileDeleteConfirm),
          ),
        ],
      ),
    );
    if (second != true || !mounted) return;

    setState(() => _deleting = true);
    try {
      await ref.read(patientProfileProvider.notifier).deleteAccount();
      await signOutPatient(ref);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.profileDeleteSuccess)),
      );
      context.go(GpsRoutes.login);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.profileDeleteError)),
      );
    } finally {
      if (mounted) setState(() => _deleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileAccount)),
      body: ListView(
        padding: const EdgeInsets.all(GpsSpacing.md),
        children: [
          GpsCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.profileAccount,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: GpsSpacing.md),
                SecondaryButton(
                  label: l10n.profileSignOut,
                  onPressed: () => signOutPatient(ref, context: context),
                ),
              ],
            ),
          ),
          const SizedBox(height: GpsSpacing.xl),
          const Divider(),
          const SizedBox(height: GpsSpacing.md),
          TextButton(
            onPressed: _deleting ? null : () => _confirmDelete(l10n),
            child: _deleting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    l10n.profileDeleteAccount,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
