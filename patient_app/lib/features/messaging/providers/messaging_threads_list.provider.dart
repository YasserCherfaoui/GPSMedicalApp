import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/messaging_repository.dart';
import 'messaging_repositories.provider.dart';

part 'messaging_threads_list.provider.g.dart';

class MessagingThreadsListState {
  const MessagingThreadsListState({
    required this.threads,
    required this.page,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  final List<MessagingThreadItem> threads;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;

  MessagingThreadsListState copyWith({
    List<MessagingThreadItem>? threads,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return MessagingThreadsListState(
      threads: threads ?? this.threads,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@riverpod
class MessagingThreadsList extends _$MessagingThreadsList {
  @override
  Future<MessagingThreadsListState> build() async {
    return _fetchPage(1, append: false);
  }

  Future<MessagingThreadsListState> _fetchPage(
    int page, {
    required bool append,
  }) async {
    final repo = ref.read(messagingRepositoryProvider);
    final result = await repo.listThreads(page: page);
    final current = state.value;
    final merged = append && current != null
        ? [...current.threads, ...result.threads]
        : result.threads;
    return MessagingThreadsListState(
      threads: merged,
      page: page,
      hasMore: result.hasMore,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetchPage(1, append: false));
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;
    state = AsyncData(current.copyWith(isLoadingMore: true));
    final next = await _fetchPage(current.page + 1, append: true);
    state = AsyncData(next);
  }
}
