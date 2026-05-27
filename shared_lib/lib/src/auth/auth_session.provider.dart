import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_session.dart';
import 'auth_session.notifier.dart';
import 'token_store.dart';

part 'auth_session.provider.g.dart';

@Riverpod(keepAlive: true)
TokenStore tokenStore(Ref ref) => InMemoryTokenStore();

/// Read-only view of the current session.
@Riverpod(keepAlive: true)
AuthSession authSessionState(Ref ref) {
  return ref.watch(authSessionProvider).session;
}

/// Auth session notifier — also acts as [GoRouter] refresh listenable.
///
/// Kept as [ChangeNotifierProvider] (not `@riverpod`) so [GoRouter] can use
/// [refreshListenable] without recreating the router on every auth change.
final authSessionProvider = ChangeNotifierProvider<AuthSessionNotifier>((ref) {
  final store = ref.watch(tokenStoreProvider);
  return AuthSessionNotifier(store);
});
