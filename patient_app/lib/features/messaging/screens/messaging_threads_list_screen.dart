import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/doctor_cache.provider.dart';
import '../providers/messaging_threads_list.provider.dart';

class MessagingThreadsListScreen extends ConsumerStatefulWidget {
  const MessagingThreadsListScreen({super.key});

  @override
  ConsumerState<MessagingThreadsListScreen> createState() =>
      _MessagingThreadsListScreenState();
}

class _MessagingThreadsListScreenState
    extends ConsumerState<MessagingThreadsListScreen> {
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
      ref.read(messagingThreadsListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final listAsync = ref.watch(messagingThreadsListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.messagingTitle)),
      body: listAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.messagingLoadError),
              const SizedBox(height: GpsSpacing.md),
              FilledButton(
                onPressed: () =>
                    ref.read(messagingThreadsListProvider.notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
        data: (state) {
          if (state.threads.isEmpty) {
            return Center(child: Text(l10n.messagingEmpty));
          }

          return RefreshIndicator(
            onRefresh: () =>
                ref.read(messagingThreadsListProvider.notifier).refresh(),
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
                final doctorId = item.thread.doctorId;
                if (doctorId == null || threadId == null) {
                  return const SizedBox.shrink();
                }

                return _ThreadRow(
                  item: item,
                  doctorId: doctorId,
                  onTap: () =>
                      context.push(GpsRoutes.messagingThreadDetail(threadId)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ThreadRow extends ConsumerWidget {
  const _ThreadRow({
    required this.item,
    required this.doctorId,
    required this.onTap,
  });

  final MessagingThreadItem item;
  final String doctorId;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctorAsync = ref.watch(cachedDoctorProvider(doctorId));
    return doctorAsync.when(
      data: (doctor) => ThreadRowTile(item: item, doctor: doctor, onTap: onTap),
      loading: () => const Padding(
        padding: EdgeInsets.only(bottom: GpsSpacing.sm),
        child: LoadingSkeleton(height: 88),
      ),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
