import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  test('restores authenticated session from token store', () async {
    final store = InMemoryTokenStore();
    await store.saveTokens(
      TokenPair(
        (b) => b
          ..accessToken = 'access'
          ..refreshToken = 'refresh'
          ..expiresIn = 3600,
      ),
    );

    final notifier = AuthSessionNotifier(store);

    expect(notifier.isAuthenticated, isTrue);
    expect(notifier.session.accessToken, 'access');
  });

  test(
    'restores authenticated session when only refresh token exists',
    () async {
      final store = InMemoryTokenStore();
      await store.saveTokens(
        TokenPair(
          (b) => b
            ..accessToken = 'x'
            ..refreshToken = 'refresh'
            ..expiresIn = 3600,
        ),
      );
      await store.saveUserSnapshot(
        const AuthUserSnapshot(userId: 'user-1', role: 'patient'),
      );

      final notifier = AuthSessionNotifier(store);

      expect(notifier.isAuthenticated, isTrue);
      expect(notifier.currentUser?.userId, 'user-1');
    },
  );

  test('signOut clears restored session', () async {
    final store = InMemoryTokenStore();
    await store.saveTokens(
      TokenPair(
        (b) => b
          ..accessToken = 'access'
          ..refreshToken = 'refresh'
          ..expiresIn = 3600,
      ),
    );

    final notifier = AuthSessionNotifier(store);
    await notifier.signOut();

    expect(notifier.isAuthenticated, isFalse);
    expect(store.accessToken, isNull);
  });
}
