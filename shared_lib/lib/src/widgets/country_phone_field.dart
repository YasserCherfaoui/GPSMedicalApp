import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/registration_countries.dart';
import '../l10n/auth_strings.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';
import '../validation/phone_e164.dart';
import 'gps_text_field.dart';

/// Phone input with a country dialing code; emits E.164 when valid.
///
/// Pass [onCountryChanged] to let the user pick DZ `+213` or TN `+216`
/// from a bottom sheet. Omit it to keep the prefix locked (registration).
class CountryPhoneField extends StatefulWidget {
  const CountryPhoneField({
    required this.country,
    required this.onChanged,
    super.key,
    this.errorText,
    this.initialNationalDigits = '',
    this.onCountryChanged,
  });

  final RegistrationCountry country;
  final ValueChanged<String?> onChanged;
  final String? errorText;
  final String initialNationalDigits;

  /// When set, tapping the dialing-code prefix opens a country picker sheet.
  final ValueChanged<RegistrationCountry>? onCountryChanged;

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
    if (oldWidget.country == widget.country) return;
    _controller.clear();
    // Parent setState (e.g. login country switch) is what triggered this
    // update. Notify after the frame so we don't setState during build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      widget.onChanged(null);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _notify(String value) {
    widget.onChanged(PhoneE164.validateNationalInput(widget.country, value));
  }

  Future<void> _pickCountry() async {
    final onChanged = widget.onCountryChanged;
    if (onChanged == null) return;
    final selected = await showCountryDialCodeSheet(
      context: context,
      selected: widget.country,
    );
    if (selected == null || selected == widget.country) return;
    onChanged(selected);
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final maxDigits = PhoneE164.nationalDigitCount(widget.country);
    final hint = switch (widget.country) {
      RegistrationCountry.dz => '5XX XX XX XX',
      RegistrationCountry.tn => '2X XXX XXX',
    };
    final selectable = widget.onCountryChanged != null;

    Widget prefix = Padding(
      padding: const EdgeInsets.only(left: GpsSpacing.md),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.country.flag, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: GpsSpacing.xs),
          Text(
            widget.country.dialingCode,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (selectable) ...[
            Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: colorScheme.primary,
            ),
          ],
          Container(
            width: 1,
            height: 24,
            margin: const EdgeInsets.symmetric(horizontal: GpsSpacing.sm),
            color: colorScheme.outlineVariant,
          ),
        ],
      ),
    );

    if (selectable) {
      prefix = InkWell(
        key: const Key('country-dial-code-picker'),
        onTap: _pickCountry,
        borderRadius: GpsRadii.input,
        child: Semantics(
          button: true,
          label:
              '${widget.country.dialingCode}, ${strings.countryName(widget.country)}',
          child: prefix,
        ),
      );
    }

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
      prefixIconConstraints: const BoxConstraints(
        minHeight: GpsSpacing.minTouchTarget,
        minWidth: 0,
      ),
      prefixIcon: prefix,
    );
  }
}

Future<RegistrationCountry?> showCountryDialCodeSheet({
  required BuildContext context,
  required RegistrationCountry selected,
}) {
  return showModalBottomSheet<RegistrationCountry>(
    context: context,
    showDragHandle: true,
    builder: (ctx) {
      final strings = AuthStrings.of(ctx);
      final colorScheme = Theme.of(ctx).colorScheme;
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                GpsSpacing.lg,
                0,
                GpsSpacing.lg,
                GpsSpacing.sm,
              ),
              child: Text(
                strings.countryTitle,
                style: Theme.of(
                  ctx,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            for (final option in RegistrationCountries.all)
              ListTile(
                leading: ExcludeSemantics(
                  child: Text(
                    option.flag,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
                title: Text(strings.countryName(option)),
                subtitle: Text(option.dialingCode),
                selected: option == selected,
                trailing: option == selected
                    ? Icon(Icons.check, color: colorScheme.primary)
                    : null,
                onTap: () => Navigator.pop(ctx, option),
              ),
            const SizedBox(height: GpsSpacing.sm),
          ],
        ),
      );
    },
  );
}
