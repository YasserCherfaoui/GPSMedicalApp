import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

final specialistInstantAvailabilityProvider =
    AsyncNotifierProvider<
      SpecialistInstantAvailabilityNotifier,
      InstantAvailability?
    >(SpecialistInstantAvailabilityNotifier.new);

class SpecialistInstantAvailabilityNotifier
    extends AsyncNotifier<InstantAvailability?> {
  Timer? _expireTimer;

  @override
  Future<InstantAvailability?> build() async {
    ref.onDispose(() => _expireTimer?.cancel());
    return _fetch();
  }

  Future<InstantAvailability> _fetch() async {
    final avail = await ref
        .read(engagementRepositoryProvider)
        .getInstantAvailability();
    _scheduleExpire(avail);
    return avail;
  }

  void _scheduleExpire(InstantAvailability avail) {
    _expireTimer?.cancel();
    final expiresAt = avail.autoExpiresAt;
    if (!avail.active || expiresAt == null) return;
    final delay = expiresAt.toLocal().difference(DateTime.now());
    if (delay <= Duration.zero) {
      state = AsyncData(
        InstantAvailability(
          active: false,
          priceMinor: avail.priceMinor,
          currency: avail.currency,
          autoExpiresAt: expiresAt,
          suspended: avail.suspended,
        ),
      );
      return;
    }
    _expireTimer = Timer(delay, () {
      final current = state.valueOrNull;
      if (current == null || !current.active) return;
      state = AsyncData(
        InstantAvailability(
          active: false,
          priceMinor: current.priceMinor,
          currency: current.currency,
          autoExpiresAt: current.autoExpiresAt,
          suspended: current.suspended,
        ),
      );
    });
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }

  Future<void> setActive({
    required bool active,
    required int priceMinor,
    required String currency,
  }) async {
    final repo = ref.read(engagementRepositoryProvider);
    if (active) {
      // Ensure presence heartbeats so patients can see us on available-now.
      ref.read(messagingWebSocketClientProvider)?.sendPresenceHeartbeat();
      final avail = await repo.setInstantAvailability(
        active: true,
        priceMinor: priceMinor,
        currency: currency,
      );
      _scheduleExpire(avail);
      state = AsyncData(avail);
      ref.read(messagingWebSocketClientProvider)?.sendPresenceHeartbeat();
      return;
    }
    await repo.clearInstantAvailability();
    _expireTimer?.cancel();
    state = AsyncData(
      InstantAvailability(
        active: false,
        priceMinor: priceMinor,
        currency: currency,
      ),
    );
  }
}
