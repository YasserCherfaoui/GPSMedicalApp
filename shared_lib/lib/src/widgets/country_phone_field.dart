import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/registration_countries.dart';
import '../l10n/auth_strings.dart';
import '../theme/gps_spacing.dart';
import '../validation/phone_e164.dart';
import 'gps_text_field.dart';

/// Phone input with a locked country dialing code; emits E.164 when valid.
class CountryPhoneField extends StatefulWidget {
  const CountryPhoneField({
    required this.country,
    required this.onChanged,
    super.key,
    this.errorText,
    this.initialNationalDigits = '',
  });

  final RegistrationCountry country;
  final ValueChanged<String?> onChanged;
  final String? errorText;
  final String initialNationalDigits;

  @override
  State<CountryPhoneField> createState() => _CountryPhoneFieldState();
}

class _CountryPhoneFieldState extends State<CountryPhoneField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialNationalDigits);
  }

  @override
  void didUpdateWidget(CountryPhoneField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.country != widget.country) {
      _controller.clear();
      widget.onChanged(null);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _notify(String value) {
    widget.onChanged(PhoneE164.validateNationalInput(widget.country, value));
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final maxDigits = PhoneE164.nationalDigitCount(widget.country);
    final hint = switch (widget.country) {
      RegistrationCountry.dz => '5XX XX XX XX',
      RegistrationCountry.tn => '2X XXX XXX',
    };

    return GpsTextField(
      controller: _controller,
      label: strings.phoneLabel,
      hint: hint,
      keyboardType: TextInputType.phone,
      errorText: widget.errorText,
      onChanged: _notify,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(maxDigits),
      ],
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: GpsSpacing.md),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.country.flag, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: GpsSpacing.xs),
            Text(
              widget.country.dialingCode,
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
