import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'notifications_repositories.provider.dart';

part 'notification_preferences.provider.g.dart';

@riverpod
class NotificationPreferencesController
    extends _$NotificationPreferencesController {
  @override
  Future<NotificationPreferences> build() async {
    return ref.read(notificationsRepositoryProvider).getPreferences();
  }

  Future<void> save(NotificationPreferences preferences) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(notificationsRepositoryProvider)
          .updatePreferences(preferences),
    );
  }
}
