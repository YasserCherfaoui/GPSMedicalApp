import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'specialist_notifications.provider.dart';

class SpecialistNotificationsListState {
  const SpecialistNotificationsListState({
    required this.notifications,
    required this.page,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  final List<Notification> notifications;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;

  SpecialistNotificationsListState copyWith({
    List<Notification>? notifications,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return SpecialistNotificationsListState(
      notifications: notifications ?? this.notifications,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

final specialistNotificationsListProvider = AsyncNotifierProvider<
    SpecialistNotificationsListNotifier,
    SpecialistNotificationsListState
>(SpecialistNotificationsListNotifier.new);

class SpecialistNotificationsListNotifier
    extends AsyncNotifier<SpecialistNotificationsListState> {
  @override
  Future<SpecialistNotificationsListState> build() async {
    return _fetchPage(1, append: false);
  }

  Future<SpecialistNotificationsListState> _fetchPage(
    int page, {
    required bool append,
  }) async {
    final repo = ref.read(specialistNotificationsRepositoryProvider);
    final result = await repo.list(page: page);
    final current = state.valueOrNull;
    final merged = append && current != null
        ? [...current.notifications, ...result.items]
        : result.items;
    return SpecialistNotificationsListState(
      notifications: merged,
      page: page,
      hasMore: result.hasMore,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetchPage(1, append: false));
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) return;
    state = AsyncData(current.copyWith(isLoadingMore: true));
    final next = await _fetchPage(current.page + 1, append: true);
    state = AsyncData(next);
  }

  Future<void> markAllRead() async {
    await ref.read(specialistNotificationsRepositoryProvider).markAllRead();
    await refresh();
  }

  Future<void> markRead(String notificationId) async {
    await ref
        .read(specialistNotificationsRepositoryProvider)
        .markRead(notificationId);
    final current = state.valueOrNull;
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
  }
}
