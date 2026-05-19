import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_session.dart';
import 'auth_session.notifier.dart';
import 'token_store.dart';

/// App-overridable token persistence (defaults to in-memory for tests).
final tokenStoreProvider = Provider<TokenStore>((ref) => InMemoryTokenStore());

/// Auth session notifier — also acts as [GoRouter] refresh listenable.
final authSessionProvider = ChangeNotifierProvider<AuthSessionNotifier>((ref) {
  final store = ref.watch(tokenStoreProvider);
  return AuthSessionNotifier(store);
});

/// Read-only view of the current session.
final authSessionStateProvider = Provider<AuthSession>((ref) {
  return ref.watch(authSessionProvider).session;
});
