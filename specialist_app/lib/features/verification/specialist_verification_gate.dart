import 'package:flutter/foundation.dart';

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
    _state = _state.copyWith(
      isLoading: true,
      refreshStatus: VerificationRefreshStatus.loading,
    );
    _notifyIfActive();

    try {
      _state = (await _repository.fetch()).copyWith(
        refreshStatus: VerificationRefreshStatus.completed,
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Specialist verification refresh failed: $e');
      }
      _state = _state.copyWith(
        refreshStatus: VerificationRefreshStatus.failed,
      );
    } finally {
      _state = _state.copyWith(
        isLoading: false,
        lastCheckedAt: DateTime.now(),
      );
      _notifyIfActive();
    }
  }

  void reset() {
    _state = const SpecialistVerificationState(
      status: SpecialistVerificationStatus.pending,
      refreshStatus: VerificationRefreshStatus.idle,
    );
    _notifyIfActive();
  }

  void _notifyIfActive() {
    if (!hasListeners) return;
    notifyListeners();
  }
}
