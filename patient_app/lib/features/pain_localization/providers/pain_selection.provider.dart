import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/pain_selection.dart';
import '../services/pain3d_analytics.dart';
import 'pain_localization_flag.provider.dart';

class PainSelectionNotifier extends Notifier<List<PainSelection>> {
  @override
  List<PainSelection> build() => const [];

  void restore(List<PainSelection> items) {
    state = List.unmodifiable(items);
  }

  void add(PainSelection selection) {
    final exists = state.any(
      (item) => item.code == selection.code && item.model == selection.model,
    );
    if (exists) return;
    state = [...state, selection];
    unawaited(_persist());
  }

  void addFromJs(Object? raw) {
    add(PainSelection.fromJs(raw));
  }

  void remove({required String code, required String model}) {
    state = [
      for (final item in state)
        if (item.code != code || item.model != model) item,
    ];
    unawaited(_persist());
  }

  void clear() {
    state = const [];
    unawaited(_persist());
  }

  Future<void> hydrate() async {
    state = await ref.read(painSelectionStoreProvider).read();
  }

  Future<void> confirm() async {
    await _persist();
    ref
        .read(pain3dAnalyticsProvider)
        .log(
          Pain3dAnalytics.selectionConfirmed,
          properties: {'count': state.length},
        );
  }

  Future<void> _persist() {
    return ref.read(painSelectionStoreProvider).write(state);
  }
}

final painSelectionProvider =
    NotifierProvider<PainSelectionNotifier, List<PainSelection>>(
      PainSelectionNotifier.new,
    );
