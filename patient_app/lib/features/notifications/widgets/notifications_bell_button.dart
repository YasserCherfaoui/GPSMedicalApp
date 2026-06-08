import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/notifications_unread_count.provider.dart';

class NotificationsBellButton extends ConsumerWidget {
  const NotificationsBellButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unreadAsync = ref.watch(notificationsUnreadCountProvider);
    final unread = unreadAsync.valueOrNull ?? 0;

    return IconButton(
      tooltip: AppLocalizations.of(context)!.notificationsTitle,
      onPressed: () => context.push(GpsRoutes.notifications),
      icon: Badge(
        isLabelVisible: unread > 0,
        label: Text('$unread'),
        child: const Icon(Icons.notifications_outlined),
      ),
    );
  }
}
