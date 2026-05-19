import 'package:flutter/material.dart';

import '../theme/gps_colors.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';

/// Primary CTA with teal gradient per brand guidelines.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;

    final child = AnimatedScale(
      scale: enabled ? 1 : 1,
      duration: const Duration(milliseconds: 120),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: GpsRadii.button,
          gradient: enabled
              ? const LinearGradient(
                  colors: [GpsColors.primaryContainer, GpsColors.primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: enabled ? null : Theme.of(context).colorScheme.outlineVariant,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: enabled ? onPressed : null,
            borderRadius: GpsRadii.button,
            child: SizedBox(
              height: GpsSpacing.minTouchTarget,
              width: expand ? double.infinity : null,
              child: Center(
                child: isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: GpsColors.onPrimary,
                        ),
                      )
                    : Text(
                        label,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: GpsColors.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );

    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      child: child,
    );
  }
}
