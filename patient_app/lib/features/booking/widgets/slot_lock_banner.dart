import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/booking_draft.provider.dart';

class SlotLockBanner extends ConsumerStatefulWidget {
  const SlotLockBanner({
    required this.onExpired,
    super.key,
  });

  final VoidCallback onExpired;

  @override
  ConsumerState<SlotLockBanner> createState() => _SlotLockBannerState();
}

class _SlotLockBannerState extends ConsumerState<SlotLockBanner> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
      final draft = ref.read(bookingDraftProvider);
      if (!draft.hasActiveLock && draft.selectedSlot != null) {
        widget.onExpired();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(bookingDraftProvider);
    if (draft.selectedSlot == null) return const SizedBox.shrink();

    final remaining = draft.lockRemaining ?? Duration.zero;
    if (remaining <= Duration.zero) {
      return const SizedBox.shrink();
    }

    final l10n = AppLocalizations.of(context)!;
    final minutes = remaining.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = remaining.inSeconds.remainder(60).toString().padLeft(2, '0');
    final time = '$minutes:$seconds';
    final warning = remaining.inSeconds < 60;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: warning ? colorScheme.errorContainer : colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: GpsSpacing.md,
          vertical: GpsSpacing.sm,
        ),
        child: Row(
          children: [
            Icon(
              Icons.timer_outlined,
              size: 20,
              color: warning
                  ? colorScheme.onErrorContainer
                  : colorScheme.primary,
            ),
            const SizedBox(width: GpsSpacing.sm),
            Expanded(
              child: Text(
                l10n.bookingLockExpires(time),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: warning
                      ? colorScheme.onErrorContainer
                      : colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
