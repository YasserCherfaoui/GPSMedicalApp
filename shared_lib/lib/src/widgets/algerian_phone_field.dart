import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/auth_strings.dart';
import '../theme/gps_spacing.dart';
import '../validation/algerian_phone.dart';
import 'gps_text_field.dart';

/// Phone input with locked +213 prefix; emits E.164 on valid national digits.
class AlgerianPhoneField extends StatefulWidget {
  const AlgerianPhoneField({
    required this.onChanged,
    super.key,
    this.errorText,
    this.initialNationalDigits = '',
  });

  final ValueChanged<String?> onChanged;
  final String? errorText;
  final String initialNationalDigits;

  @override
  State<AlgerianPhoneField> createState() => _AlgerianPhoneFieldState();
}

class _AlgerianPhoneFieldState extends State<AlgerianPhoneField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialNationalDigits);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _notify(String value) {
    widget.onChanged(AlgerianPhone.validateNationalInput(value));
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return GpsTextField(
      controller: _controller,
      label: strings.phoneLabel,
      hint: '5XX XX XX XX',
      keyboardType: TextInputType.phone,
      errorText: widget.errorText,
      onChanged: _notify,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(9),
      ],
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: GpsSpacing.md),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🇩🇿', style: TextStyle(fontSize: 18)),
            const SizedBox(width: GpsSpacing.xs),
            Text(
              '+213',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 1,
              height: 24,
              margin: const EdgeInsets.symmetric(horizontal: GpsSpacing.sm),
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ],
        ),
      ),
    );
  }
}
