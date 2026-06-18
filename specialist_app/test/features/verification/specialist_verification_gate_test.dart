import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:specialist_app/features/verification/specialist_verification_gate.dart';
import 'package:specialist_app/features/verification/specialist_verification_repository.dart';
import 'package:specialist_app/features/verification/specialist_verification_state.dart';
import 'package:specialist_app/routing/specialist_verification_status.dart';

void main() {
  test('refresh notifies listeners and clears loading state', () async {
    final gate = SpecialistVerificationGate(_VerifiedRepository());
    var notifications = 0;
    gate.addListener(() => notifications++);

    final refreshFuture = gate.refresh();
    expect(gate.state.isLoading, isTrue);
    expect(gate.state.refreshStatus, VerificationRefreshStatus.loading);

    await refreshFuture;

    expect(gate.status, SpecialistVerificationStatus.verified);
    expect(gate.state.isLoading, isFalse);
    expect(gate.state.refreshStatus, VerificationRefreshStatus.completed);
    expect(notifications, greaterThanOrEqualTo(2));
  });

  test('publish notifies listeners without refetching', () async {
    final gate = SpecialistVerificationGate(_VerifiedRepository());
    var notifications = 0;
    gate.addListener(() => notifications++);

    await gate.refresh();
    final countAfterRefresh = notifications;

    gate.publish();

    expect(notifications, countAfterRefresh + 1);
    expect(gate.status, SpecialistVerificationStatus.verified);
  });
}

class _VerifiedRepository extends SpecialistVerificationRepository {
  _VerifiedRepository()
    : super(
        GpsMedicalClient(
          tokenStore: InMemoryTokenStore(),
          apiRootUrl: 'http://localhost:8080',
        ),
      );

  @override
  Future<SpecialistVerificationState> fetch() async {
    return const SpecialistVerificationState(
      status: SpecialistVerificationStatus.verified,
    );
  }
}
