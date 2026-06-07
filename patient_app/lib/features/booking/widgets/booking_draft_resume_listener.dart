import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/booking_draft.provider.dart';
import '../providers/connectivity.provider.dart';

/// Prompts the patient to resume a persisted booking draft when connectivity
/// returns while they are outside the booking flow.
class BookingDraftResumeListener extends ConsumerStatefulWidget {
  const BookingDraftResumeListener({
    required this.navigatorKey,
    required this.child,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  @override
  ConsumerState<BookingDraftResumeListener> createState() =>
      _BookingDraftResumeListenerState();
}

class _BookingDraftResumeListenerState
    extends ConsumerState<BookingDraftResumeListener> {
  bool? _wasOnline;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<bool>>(isOnlineProvider, (prev, next) {
      final online = next.value;
      if (online == null) return;

      final wasOffline = _wasOnline == false;
      _wasOnline = online;
      if (!online || !wasOffline) return;

      final draft = ref.read(bookingDraftProvider);
      if (!draft.hasRestorableDraft) return;

      final navCtx = widget.navigatorKey.currentContext;
      if (navCtx == null) return;

      final location = GoRouter.of(navCtx).state.matchedLocation;
      if (location == GpsRoutes.booking) return;

      ref.read(bookingDraftProvider.notifier).requestResumePrompt();
      final l10n = AppLocalizations.of(navCtx)!;
      ScaffoldMessenger.of(navCtx)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(l10n.bookingResumeDraftMessage),
            action: SnackBarAction(
              label: l10n.bookingResume,
              onPressed: () => GoRouter.of(navCtx).push(GpsRoutes.booking),
            ),
          ),
        );
    });

    return widget.child;
  }
}
