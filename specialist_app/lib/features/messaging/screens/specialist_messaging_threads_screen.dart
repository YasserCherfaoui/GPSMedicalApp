import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../../routing/specialist_routes.dart';
import '../providers/specialist_messaging.provider.dart';
import '../widgets/specialist_thread_row_tile.dart';

class SpecialistMessagingThreadsScreen extends ConsumerStatefulWidget {
  const SpecialistMessagingThreadsScreen({super.key});

  @override
  ConsumerState<SpecialistMessagingThreadsScreen> createState() =>
      _SpecialistMessagingThreadsScreenState();
}

class _SpecialistMessagingThreadsScreenState
    extends ConsumerState<SpecialistMessagingThreadsScreen> {
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
      ref.read(specialistMessagingThreadsListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final listAsync = ref.watch(specialistMessagingThreadsListProvider);

    return listAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => ErrorState(
        title: l10n.messagingLoadError,
        onRetry: () =>
            ref.read(specialistMessagingThreadsListProvider.notifier).refresh(),
      ),
      data: (state) {
        if (state.threads.isEmpty) {
          return EmptyState(
            title: l10n.messagingEmpty,
            icon: Icons.chat_bubble_outline,
          );
        }
        return RefreshIndicator(
          onRefresh: () =>
              ref.read(specialistMessagingThreadsListProvider.notifier).refresh(),
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(GpsSpacing.md),
            itemCount: state.threads.length + (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.threads.length) {
                return const Padding(
                  padding: EdgeInsets.all(GpsSpacing.md),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final item = state.threads[index];
              final threadId = item.thread.id;
              if (threadId == null) return const SizedBox.shrink();
              return SpecialistThreadRowTile(
                item: item,
                onTap: () =>
                    context.push(SpecialistRoutes.messagingThread(threadId)),
              );
            },
          ),
        );
      },
    );
  }
}
