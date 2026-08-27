import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/pain_selection.dart';

class PainSelectionNotifier extends Notifier<List<PainSelection>> {
  @override
  List<PainSelection> build() => const [];

  void add(PainSelection selection) {
    final exists = state.any(
      (item) => item.code == selection.code && item.model == selection.model,
    );
    if (exists) return;
    state = [...state, selection];
  }

  void addFromJs(Object? raw) {
    add(PainSelection.fromJs(raw));
  }

  void clear() => state = const [];
}

final painSelectionProvider =
    NotifierProvider<PainSelectionNotifier, List<PainSelection>>(
      PainSelectionNotifier.new,
    );
