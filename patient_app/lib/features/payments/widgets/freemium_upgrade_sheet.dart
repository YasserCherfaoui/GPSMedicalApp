import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/freemium_payments_provider.dart';
import '../utils/payments_api_error.dart';

Future<bool> showFreemiumUpgradeSheet({
  required BuildContext context,
  required WidgetRef ref,
  required String sessionId,
  required String purpose,
  required int amountDzd,
  required String title,
  required String body,
}) async {
  final l10n = AppLocalizations.of(context)!;
  final confirmed = await showModalBottomSheet<bool>(
    context: context,
    showDragHandle: true,
    builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          GpsSpacing.lg,
          GpsSpacing.sm,
          GpsSpacing.lg,
          GpsSpacing.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(ctx).textTheme.titleLarge),
            const SizedBox(height: GpsSpacing.sm),
            Text(body),
            const SizedBox(height: GpsSpacing.md),
            Text(
              l10n.freemiumAmountLabel(amountDzd),
              style: Theme.of(ctx).textTheme.titleMedium,
            ),
            const SizedBox(height: GpsSpacing.lg),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(l10n.freemiumUnlockCta),
            ),
          ],
        ),
      );
    },
  );
  if (confirmed != true || !context.mounted) return false;

  try {
    await ref.read(freemiumPaymentsRepositoryProvider).unlockFeature(
          sessionId: sessionId,
          purpose: purpose,
          amountDzd: amountDzd,
        );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.freemiumUnlockSuccess)),
      );
    }
    return true;
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            paymentErrorMessage(e, l10n.freemiumUnlockFailed),
          ),
        ),
      );
    }
    return false;
  }
}
