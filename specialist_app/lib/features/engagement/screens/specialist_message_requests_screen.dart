import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../../routing/specialist_routes.dart';

final specialistMessageRequestsProvider =
    FutureProvider.autoDispose<List<EngagementThread>>((ref) async {
  return ref.watch(engagementRepositoryProvider).listMessagingRequests();
});

/// Inbox of `request_pending` threads for the specialist.
class SpecialistMessageRequestsScreen extends ConsumerWidget {
  const SpecialistMessageRequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final async = ref.watch(specialistMessageRequestsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.engagementRequestsInboxTitle)),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => ErrorState(
          title: l10n.messagingLoadError,
          onRetry: () => ref.invalidate(specialistMessageRequestsProvider),
        ),
        data: (threads) {
          if (threads.isEmpty) {
            return EmptyState(
              title: l10n.engagementRequestsEmpty,
              icon: Icons.inbox_outlined,
            );
          }
          return RefreshIndicator(
            onRefresh: () async =>
                ref.invalidate(specialistMessageRequestsProvider),
            child: ListView.separated(
              padding: const EdgeInsets.all(GpsSpacing.md),
              itemCount: threads.length,
              separatorBuilder: (_, __) => const SizedBox(height: GpsSpacing.sm),
              itemBuilder: (context, i) {
                final t = threads[i];
                return ListTile(
                  leading: const Icon(Icons.mail_outline),
                  title: Text(t.patientId ?? t.id),
                  subtitle: Text(t.state ?? 'request_pending'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () =>
                      context.push(SpecialistRoutes.messagingThread(t.id)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
