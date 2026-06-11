import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'specialist_verification.provider.dart';
import 'specialist_verification_push.dart';

/// Refreshes verification state on app resume and wires verification push.
class SpecialistVerificationLifecycle extends ConsumerStatefulWidget {
  const SpecialistVerificationLifecycle({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<SpecialistVerificationLifecycle> createState() =>
      _SpecialistVerificationLifecycleState();
}

class _SpecialistVerificationLifecycleState
    extends ConsumerState<SpecialistVerificationLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrapPush());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _bootstrapPush() async {
    if (!ref.read(authSessionProvider).isAuthenticated) return;
    await ref.read(specialistVerificationPushProvider).initialize();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    if (!ref.read(authSessionProvider).isAuthenticated) return;
    ref.read(specialistVerificationGateProvider).refresh();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthSessionNotifier>(authSessionProvider, (previous, next) {
      if (next.isAuthenticated) {
        ref.read(specialistVerificationPushProvider).initialize();
      }
    });

    return widget.child;
  }
}
