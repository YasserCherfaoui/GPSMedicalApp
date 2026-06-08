import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'notifications_repositories.provider.dart';
import 'notifications_unread_count.provider.dart';

part 'notifications_list.provider.g.dart';

class NotificationsListState {
  const NotificationsListState({
    required this.notifications,
    required this.page,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  final List<Notification> notifications;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;

  NotificationsListState copyWith({
    List<Notification>? notifications,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return NotificationsListState(
      notifications: notifications ?? this.notifications,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@riverpod
class NotificationsList extends _$NotificationsList {
  @override
  Future<NotificationsListState> build() async {
    return _fetchPage(1, append: false);
  }

  Future<NotificationsListState> _fetchPage(
    int page, {
    required bool append,
  }) async {
    final repo = ref.read(notificationsRepositoryProvider);
    final result = await repo.list(page: page);
    final current = state.value;
    final merged = append && current != null
        ? [...current.notifications, ...result.items]
        : result.items;
    return NotificationsListState(
      notifications: merged,
      page: page,
      hasMore: result.hasMore,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetchPage(1, append: false));
    await ref.read(notificationsUnreadCountProvider.notifier).refresh();
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;
    state = AsyncData(current.copyWith(isLoadingMore: true));
    final next = await _fetchPage(current.page + 1, append: true);
    state = AsyncData(next);
  }

  Future<void> markAllRead() async {
    await ref.read(notificationsRepositoryProvider).markAllRead();
    await refresh();
  }

  Future<void> markRead(String notificationId) async {
    await ref.read(notificationsRepositoryProvider).markRead(notificationId);
    final current = state.value;
    if (current == null) return;
    state = AsyncData(
      current.copyWith(
        notifications: current.notifications
            .map(
              (n) => n.id == notificationId
                  ? n.rebuild((b) => b..readAt = DateTime.now().toUtc())
                  : n,
            )
            .toList(),
      ),
    );
    await ref.read(notificationsUnreadCountProvider.notifier).refresh();
  }
}
