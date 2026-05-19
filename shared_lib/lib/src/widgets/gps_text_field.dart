import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/gps_spacing.dart';

/// Design-system text field — 48px min height, soft fill, teal focus ring.
class GpsTextField extends StatelessWidget {
  const GpsTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.autofillHints,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Text(label!, style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: GpsSpacing.xs),
        ],
        TextField(
          controller: controller,
          enabled: enabled,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            constraints: const BoxConstraints(
              minHeight: GpsSpacing.minTouchTarget,
            ),
          ),
        ),
      ],
    );
  }
}
