import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/specialist_notifications_list.provider.dart';
import '../utils/specialist_notification_display.dart';

class SpecialistNotificationsListScreen extends ConsumerStatefulWidget {
  const SpecialistNotificationsListScreen({super.key});

  @override
  ConsumerState<SpecialistNotificationsListScreen> createState() =>
      _SpecialistNotificationsListScreenState();
}

class _SpecialistNotificationsListScreenState
    extends ConsumerState<SpecialistNotificationsListScreen> {
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
      ref.read(specialistNotificationsListProvider.notifier).loadMore();
    }
  }

  Future<void> _openNotification(Notification notification) async {
    final id = notification.id;
    if (id != null && notification.readAt == null) {
      await ref.read(specialistNotificationsListProvider.notifier).markRead(id);
    }
    if (!mounted) return;
    final route = specialistNotificationDeepLinkRoute(notification);
    if (route != null) {
      context.push(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final listAsync = ref.watch(specialistNotificationsListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.notificationsTitle)),
      body: listAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.notificationsLoadError),
              const SizedBox(height: GpsSpacing.md),
              FilledButton(
                onPressed: () => ref
                    .read(specialistNotificationsListProvider.notifier)
                    .refresh(),
                child: Text(l10n.retry),
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
                        .read(specialistNotificationsListProvider.notifier)
                        .markAllRead(),
                    child: Text(l10n.notificationsMarkAllRead),
                  ),
                ),
              Expanded(
                child: state.notifications.isEmpty
                    ? Center(child: Text(l10n.notificationsEmpty))
                    : RefreshIndicator(
                        onRefresh: () => ref
                            .read(specialistNotificationsListProvider.notifier)
                            .refresh(),
                        child: ListView.separated(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(GpsSpacing.md),
                          itemCount: state.notifications.length +
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
                            final timestamp = formatSpecialistNotificationTimestamp(
                              notification.createdAt,
                              locale,
                            );

                            return Card(
                              color: isUnread
                                  ? Theme.of(context)
                                        .colorScheme
                                        .primaryContainer
                                        .withValues(alpha: 0.35)
                                  : null,
                              child: ListTile(
                                leading: Icon(
                                  specialistNotificationTypeIcon(
                                    notification.type,
                                  ),
                                ),
                                title: Text(notification.title ?? ''),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if ((notification.body ?? '').isNotEmpty)
                                      Text(notification.body!),
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
                                onTap: () => _openNotification(notification),
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
