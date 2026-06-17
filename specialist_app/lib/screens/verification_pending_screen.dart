import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../features/verification/specialist_verification.provider.dart';
import '../routing/specialist_routes.dart';
import '../routing/specialist_verification_status.dart';

class VerificationPendingScreen extends ConsumerWidget {
  const VerificationPendingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final gate = ref.watch(specialistVerificationGateProvider);
    final state = gate.state;

    final title = switch (state.status) {
      SpecialistVerificationStatus.rejected =>
        l10n.specialistVerificationRejectedTitle,
      SpecialistVerificationStatus.moreInfo =>
        l10n.specialistVerificationMoreInfoTitle,
      _ => l10n.specialistVerificationPendingTitle,
    };

    final body = switch (state.status) {
      SpecialistVerificationStatus.rejected =>
        l10n.specialistVerificationRejectedBody,
      SpecialistVerificationStatus.moreInfo =>
        l10n.specialistVerificationMoreInfoBody,
      _ => l10n.specialistVerificationPendingBody,
    };

    final icon = switch (state.status) {
      SpecialistVerificationStatus.rejected => Icons.cancel_outlined,
      SpecialistVerificationStatus.moreInfo => Icons.info_outline,
      _ => Icons.hourglass_top_rounded,
    };

    final showResubmitCta =
        state.status == SpecialistVerificationStatus.moreInfo ||
        state.status == SpecialistVerificationStatus.rejected;
    final showSubmitCta =
        state.status == SpecialistVerificationStatus.pending &&
        !state.hasSubmittedCredentials;
    final showCredentialsCta = showResubmitCta || showSubmitCta;
    final credentialsCtaLabel = showResubmitCta
        ? l10n.specialistVerificationResubmitCta
        : l10n.specialistVerificationSubmitCta;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(GpsSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VerificationStatusBanner(
              title: title,
              body: body,
              icon: icon,
              comment: state.comment,
              isLoading: state.isLoading,
            ),
            const Spacer(),
            if (showCredentialsCta)
              PrimaryButton(
                label: credentialsCtaLabel,
                onPressed: () => context.push(SpecialistRoutes.credentials),
              ),
            if (showCredentialsCta) const SizedBox(height: GpsSpacing.sm),
            SecondaryButton(
              label: l10n.specialistVerificationCompleteProfileCta,
              onPressed: () => context.push(SpecialistRoutes.profileEdit),
            ),
            const SizedBox(height: GpsSpacing.md),
          ],
        ),
      ),
    );
  }
}
