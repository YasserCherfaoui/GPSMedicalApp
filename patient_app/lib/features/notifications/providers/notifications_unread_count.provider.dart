import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'notifications_repositories.provider.dart';

part 'notifications_unread_count.provider.g.dart';

@riverpod
class NotificationsUnreadCount extends _$NotificationsUnreadCount {
  @override
  Future<int> build() async {
    return ref.read(notificationsRepositoryProvider).countUnread();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
