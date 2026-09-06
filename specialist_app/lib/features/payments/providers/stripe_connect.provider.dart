import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/stripe_connect_repository.dart';

final stripeConnectRepositoryProvider = Provider<StripeConnectRepository>((
  ref,
) {
  final client = ref.watch(gpsMedicalClientProvider);
  return StripeConnectRepository(client.v1.dio);
});

/// Connect account for the signed-in specialist. `null` = not provisioned.
final myConnectAccountProvider =
    AsyncNotifierProvider.autoDispose<MyConnectAccount, ConnectAccount?>(
      MyConnectAccount.new,
    );

class MyConnectAccount extends AutoDisposeAsyncNotifier<ConnectAccount?> {
  Timer? _poll;
  var _disposed = false;

  @override
  Future<ConnectAccount?> build() async {
    _disposed = false;
    ref.onDispose(() {
      _disposed = true;
      _poll?.cancel();
    });
    return _fetchAndMaybePoll();
  }

  Future<ConnectAccount?> refresh() async {
    state = const AsyncLoading();
    final next = await AsyncValue.guard(_fetchAndMaybePoll);
    state = next;
    return next.valueOrNull;
  }

  Future<ConnectAccount?> _fetchAndMaybePoll() async {
    final repo = ref.read(stripeConnectRepositoryProvider);
    try {
      final account = await repo.fetchMyAccount();
      _schedulePollIfNeeded(account);
      return account;
    } on ConnectAccountNotFoundException {
      _poll?.cancel();
      _poll = null;
      return null;
    }
  }

  void _schedulePollIfNeeded(ConnectAccount account) {
    _poll?.cancel();
    _poll = null;
    if (!account.needsOnboarding) return;
    _poll = Timer.periodic(const Duration(seconds: 7), (_) async {
      try {
        final repo = ref.read(stripeConnectRepositoryProvider);
        final latest = await repo.fetchMyAccount();
        if (_disposed) return;
        state = AsyncData(latest);
        if (!latest.needsOnboarding) {
          _poll?.cancel();
          _poll = null;
        }
      } catch (_) {
        // Keep last good state; next tick retries.
      }
    });
  }
}
