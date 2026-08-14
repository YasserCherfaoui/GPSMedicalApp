import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/device_vault_warning.provider.dart';
import '../providers/patient_profile.provider.dart';

class DeviceVaultWarningBanner extends ConsumerWidget {
  const DeviceVaultWarningBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(deviceVaultWarningVisibleProvider);
    return visible.maybeWhen(
      data: (show) {
        if (!show) return const SizedBox.shrink();
        return const Padding(
          padding: EdgeInsets.only(bottom: GpsSpacing.md),
          child: _DeviceVaultWarningCard(dismissible: true),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}

class DeviceVaultSettingsNotice extends ConsumerWidget {
  const DeviceVaultSettingsNotice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(patientProfileProvider);
    final show = profile.maybeWhen(
      data: isDeviceOnlyResidency,
      orElse: () => false,
    );
    if (!show) return const SizedBox.shrink();
    return const Padding(
      padding: EdgeInsets.only(bottom: GpsSpacing.md),
      child: _DeviceVaultWarningCard(dismissible: false),
    );
  }
}

class _DeviceVaultWarningCard extends ConsumerWidget {
  const _DeviceVaultWarningCard({required this.dismissible});

  final bool dismissible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    return GpsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.phonelink_erase_outlined, color: scheme.tertiary),
              const SizedBox(width: GpsSpacing.sm),
              Expanded(
                child: Text(
                  dismissible
                      ? l10n.deviceVaultBannerTitle
                      : l10n.deviceVaultSettingsTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: GpsSpacing.sm),
          Text(
            dismissible
                ? l10n.deviceVaultBannerBody
                : l10n.deviceVaultSettingsBody,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (dismissible) ...[
            const SizedBox(height: GpsSpacing.md),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () async {
                  final patient = ref.read(patientProfileProvider).valueOrNull;
                  final id = patient?.id;
                  if (id == null || id.isEmpty) return;
                  await ref.read(deviceVaultProvider).acknowledgeWarning(id);
                  ref.invalidate(deviceVaultWarningVisibleProvider);
                },
                child: Text(l10n.deviceVaultBannerDismiss),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
