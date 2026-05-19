import 'package:flutter/material.dart';

import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';

/// Modal dialog with design-system shape and spacing.
class GpsModal extends StatelessWidget {
  const GpsModal({
    required this.title,
    super.key,
    this.message,
    this.primaryActionLabel,
    this.onPrimaryAction,
    this.secondaryActionLabel,
    this.onSecondaryAction,
    this.child,
  });

  final String title;
  final String? message;
  final String? primaryActionLabel;
  final VoidCallback? onPrimaryAction;
  final String? secondaryActionLabel;
  final VoidCallback? onSecondaryAction;
  final Widget? child;

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? message,
    String? primaryActionLabel,
    VoidCallback? onPrimaryAction,
    String? secondaryActionLabel,
    VoidCallback? onSecondaryAction,
    Widget? child,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => GpsModal(
        title: title,
        message: message,
        primaryActionLabel: primaryActionLabel,
        onPrimaryAction: onPrimaryAction,
        secondaryActionLabel: secondaryActionLabel,
        onSecondaryAction: onSecondaryAction,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: GpsRadii.card),
      child: Padding(
        padding: const EdgeInsets.all(GpsSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
            if (message != null) ...[
              const SizedBox(height: GpsSpacing.sm),
              Text(message!, style: Theme.of(context).textTheme.bodyMedium),
            ],
            if (child != null) ...[
              const SizedBox(height: GpsSpacing.md),
              child!,
            ],
            const SizedBox(height: GpsSpacing.lg),
            if (primaryActionLabel != null)
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onPrimaryAction?.call();
                },
                child: Text(primaryActionLabel!),
              ),
            if (secondaryActionLabel != null) ...[
              const SizedBox(height: GpsSpacing.sm),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onSecondaryAction?.call();
                },
                child: Text(secondaryActionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
