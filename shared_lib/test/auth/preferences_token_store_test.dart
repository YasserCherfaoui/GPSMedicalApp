import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SharedPreferencesTokenStore', () {
    late SharedPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
    });

    test('persists and reloads tokens', () async {
      final store = SharedPreferencesTokenStore(prefs);
      await store.saveTokens(
        TokenPair(
          (b) => b
            ..accessToken = 'access'
            ..refreshToken = 'refresh'
            ..expiresIn = 3600,
        ),
      );

      final reloaded = SharedPreferencesTokenStore(prefs);
      await reloaded.load();

      expect(reloaded.accessToken, 'access');
      expect(reloaded.refreshToken, 'refresh');
    });

    test('clearTokens removes persisted values', () async {
      final store = SharedPreferencesTokenStore(prefs);
      await store.saveTokens(
        TokenPair(
          (b) => b
            ..accessToken = 'access'
            ..refreshToken = 'refresh'
            ..expiresIn = 3600,
        ),
      );
      await store.clearTokens();

      final reloaded = SharedPreferencesTokenStore(prefs);
      await reloaded.load();

      expect(reloaded.accessToken, isNull);
      expect(reloaded.refreshToken, isNull);
    });
  });
}
