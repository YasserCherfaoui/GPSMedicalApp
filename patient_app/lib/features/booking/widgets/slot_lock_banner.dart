import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

class _SlotLockBannerState extends ConsumerState<SlotLockBanner>
    with SingleTickerProviderStateMixin {
  Ticker? _ticker;
  bool _expiryHandled = false;
  int _lastRenderedSecond = -1;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick);
    _ticker!.start();
  }

  void _onTick(Duration elapsed) {
    if (!mounted) return;

    final draft = ref.read(bookingDraftProvider);
    if (draft.selectedSlot == null) {
      _ticker?.stop();
      return;
    }

    if (draft.hasActiveLock) {
      _expiryHandled = false;
      final second = elapsed.inSeconds;
      if (second != _lastRenderedSecond) {
        _lastRenderedSecond = second;
        setState(() {});
      }
      return;
    }

    if (!_expiryHandled) {
      _expiryHandled = true;
      _ticker?.stop();
      widget.onExpired();
    }
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }

  void _syncTicker(BookingDraftState draft) {
    final needsTicker = draft.selectedSlot != null &&
        (draft.hasActiveLock || !_expiryHandled);
    if (needsTicker) {
      if (!(_ticker?.isActive ?? false)) {
        _ticker?.start();
      }
    } else {
      _ticker?.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(bookingDraftProvider);
    _syncTicker(draft);
    if (!draft.hasActiveLock) return const SizedBox.shrink();

    final remaining = draft.lockRemaining ?? Duration.zero;

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
