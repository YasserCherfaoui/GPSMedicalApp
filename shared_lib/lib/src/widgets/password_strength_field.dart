import 'package:flutter/material.dart';

import '../l10n/auth_strings.dart';
import '../theme/gps_spacing.dart';
import '../validation/password_strength.dart';
import 'gps_text_field.dart';

class PasswordStrengthField extends StatefulWidget {
  const PasswordStrengthField({
    required this.controller,
    required this.strength,
    required this.onChanged,
    super.key,
    this.label,
    this.confirmController,
    this.confirmError,
  });

  final TextEditingController controller;
  final TextEditingController? confirmController;
  final PasswordStrength strength;
  final ValueChanged<String> onChanged;
  final String? label;
  final String? confirmError;

  @override
  State<PasswordStrengthField> createState() => _PasswordStrengthFieldState();
}

class _PasswordStrengthFieldState extends State<PasswordStrengthField> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GpsTextField(
          controller: widget.controller,
          label: widget.label ?? strings.passwordLabel,
          obscureText: _obscurePassword,
          onChanged: widget.onChanged,
          autofillHints: const [AutofillHints.newPassword],
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: colorScheme.outline,
            ),
            onPressed: () =>
                setState(() => _obscurePassword = !_obscurePassword),
          ),
        ),
        const SizedBox(height: GpsSpacing.sm),
        _StrengthMeter(score: widget.strength.score),
        const SizedBox(height: GpsSpacing.md),
        // Requirements Container
        Container(
          padding: const EdgeInsets.all(GpsSpacing.md),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colorScheme.outlineVariant.withOpacity(0.3),
            ),
          ),
          child: Column(
            children: [
              _RequirementRow(
                met: widget.strength.minLength,
                label: 'Au moins 10 caractères',
              ),
              const SizedBox(height: GpsSpacing.sm),
              _RequirementRow(
                met: widget.strength.hasUppercase,
                label: 'Une majuscule',
              ),
              const SizedBox(height: GpsSpacing.sm),
              _RequirementRow(
                met: widget.strength.hasDigit,
                label: 'Un chiffre',
              ),
              const SizedBox(height: GpsSpacing.sm),
              _RequirementRow(
                met: widget.strength.hasSpecial,
                label: 'Un caractère spécial',
              ),
            ],
          ),
        ),
        if (widget.confirmController != null) ...[
          const SizedBox(height: GpsSpacing.md),
          GpsTextField(
            controller: widget.confirmController!,
            label: strings.confirmPasswordLabel,
            obscureText: _obscureConfirm,
            errorText: widget.confirmError,
            autofillHints: const [AutofillHints.newPassword],
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirm ? Icons.visibility : Icons.visibility_off,
                color: colorScheme.outline,
              ),
              onPressed: () =>
                  setState(() => _obscureConfirm = !_obscureConfirm),
            ),
          ),
        ],
      ],
    );
  }
}

class _StrengthMeter extends StatelessWidget {
  const _StrengthMeter({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    String textStrength = 'Faible';
    if (score == 2) textStrength = 'Moyen';
    if (score >= 3) textStrength = 'Fort';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Force du mot de passe :',
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: colorScheme.outline),
            ),
            Text(
              textStrength,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: score >= 3
                    ? colorScheme.primary
                    : (score == 2 ? colorScheme.tertiary : colorScheme.error),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: GpsSpacing.xs),
        Row(
          children: List.generate(4, (index) {
            final filled = index < score;
            Color color;
            if (score <= 1) {
              color = colorScheme.error;
            } else if (score <= 2) {
              color = colorScheme.tertiary;
            } else {
              color = colorScheme.primary;
            }
            return Expanded(
              child: Container(
                height: 4,
                margin: EdgeInsets.only(right: index < 3 ? 4 : 0),
                decoration: BoxDecoration(
                  color: filled ? color : colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _RequirementRow extends StatelessWidget {
  const _RequirementRow({required this.met, required this.label});

  final bool met;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          met ? Icons.check_circle : Icons.circle_outlined,
          size: 20,
          color: met
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline,
        ),
        const SizedBox(width: GpsSpacing.sm),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: met
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
