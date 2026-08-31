import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/notifications_list.provider.dart';
import '../utils/notification_display.dart';

class NotificationsListScreen extends ConsumerStatefulWidget {
  const NotificationsListScreen({super.key});

  @override
  ConsumerState<NotificationsListScreen> createState() =>
      _NotificationsListScreenState();
}

class _NotificationsListScreenState
    extends ConsumerState<NotificationsListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(notificationsListProvider.notifier).loadMore();
    }
  }

  Future<void> _openNotification(Notification notification) async {
    final id = notification.id;
    if (id != null && notification.readAt == null) {
      await ref.read(notificationsListProvider.notifier).markRead(id);
    }
    if (!mounted) return;
    final route = notificationDeepLinkRoute(notification);
    if (route != null) {
      context.push(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final listAsync = ref.watch(notificationsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notificationsTitle),
        actions: [
          IconButton(
            tooltip: l10n.notificationsPreferences,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(GpsRoutes.notificationPreferences),
          ),
        ],
      ),
      body: listAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.notificationsLoadError),
              const SizedBox(height: GpsSpacing.md),
              SecondaryButton(
                label: l10n.retry,
                onPressed: () =>
                    ref.read(notificationsListProvider.notifier).refresh(),
              ),
            ],
          ),
        ),
        data: (state) {
          return Column(
            children: [
              if (state.notifications.isNotEmpty)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => ref
                        .read(notificationsListProvider.notifier)
                        .markAllRead(),
                    child: Text(l10n.notificationsMarkAllRead),
                  ),
                ),
              Expanded(
                child: state.notifications.isEmpty
                    ? Center(child: Text(l10n.notificationsEmpty))
                    : RefreshIndicator(
                        onRefresh: () => ref
                            .read(notificationsListProvider.notifier)
                            .refresh(),
                        child: ListView.separated(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(GpsSpacing.md),
                          itemCount:
                              state.notifications.length +
                              (state.isLoadingMore ? 1 : 0),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: GpsSpacing.sm),
                          itemBuilder: (context, index) {
                            if (index >= state.notifications.length) {
                              return const Padding(
                                padding: EdgeInsets.all(GpsSpacing.md),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }

                            final notification = state.notifications[index];
                            final isUnread = notification.readAt == null;
                            final timestamp = formatNotificationTimestamp(
                              notification.createdAt,
                              locale,
                            );

                            return GpsCard(
                              showAccentBorder: isUnread,
                              onTap: () => _openNotification(notification),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(notificationTypeIcon(notification.type)),
                                  const SizedBox(width: GpsSpacing.md),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          notification.title ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        if ((notification.body ?? '')
                                            .isNotEmpty) ...[
                                          const SizedBox(height: GpsSpacing.xs),
                                          Text(notification.body!),
                                        ],
                                        if (timestamp.isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: GpsSpacing.xs,
                                            ),
                                            child: Text(
                                              timestamp,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodySmall,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
