import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routing/specialist_verification_status.dart';
import 'specialist_verification_repository.dart';
import 'specialist_verification_state.dart';

/// Listenable verification gate — drives go_router redirects.
class SpecialistVerificationGate extends ChangeNotifier {
  SpecialistVerificationGate(this._repository);

  final SpecialistVerificationRepository _repository;

  SpecialistVerificationState _state = SpecialistVerificationState.initial;

  SpecialistVerificationState get state => _state;

  SpecialistVerificationStatus get status => _state.status;

  Future<void> refresh() async {
    _state = _state.copyWith(isLoading: true);
    _notifyIfActive();

    try {
      _state = await _repository.fetch();
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Specialist verification refresh failed: $e');
      }
      _state = const SpecialistVerificationState(
        status: SpecialistVerificationStatus.pending,
      );
    } finally {
      _state = _state.copyWith(isLoading: false);
      _notifyIfActive();
    }
  }

  void reset() {
    _state = const SpecialistVerificationState(
      status: SpecialistVerificationStatus.pending,
    );
    _notifyIfActive();
  }

  void _notifyIfActive() {
    if (!hasListeners) return;
    notifyListeners();
  }
}
