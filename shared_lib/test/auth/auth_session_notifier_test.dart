import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';
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
