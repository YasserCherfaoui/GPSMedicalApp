import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/connectivity.provider.dart';

class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineAsync = ref.watch(isOnlineProvider);
    return onlineAsync.when(
      data: (online) {
        if (online) return const SizedBox.shrink();
        final l10n = AppLocalizations.of(context)!;
        return Material(
          color: Theme.of(context).colorScheme.errorContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: GpsSpacing.md,
              vertical: GpsSpacing.sm,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.cloud_off_outlined,
                  size: 20,
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
                const SizedBox(width: GpsSpacing.sm),
                Expanded(
                  child: Text(
                    l10n.bookingOfflineBanner,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
