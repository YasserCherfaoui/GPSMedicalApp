import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/registration_countries.dart';
import '../l10n/auth_strings.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';
import '../validation/phone_e164.dart';
import 'gps_text_field.dart';

/// Phone input with a country dialing code; emits E.164 when valid.
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
    final hint = widget.country == RegistrationCountry.dz
        ? '5XX XX XX XX'
        : widget.country == RegistrationCountry.tn
        ? '2X XXX XXX'
        : '6XX XXX XXX';
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
    isScrollControlled: true,
    builder: (ctx) {
      return _CountryDialSheet(selected: selected);
    },
  );
}

class _CountryDialSheet extends StatefulWidget {
  const _CountryDialSheet({required this.selected});

  final RegistrationCountry selected;

  @override
  State<_CountryDialSheet> createState() => _CountryDialSheetState();
}

class _CountryDialSheetState extends State<_CountryDialSheet> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final options = RegistrationCountries.search(_query);
    final height = MediaQuery.sizeOf(context).height * 0.7;

    return SafeArea(
      child: SizedBox(
        height: height,
        child: Column(
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
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.lg),
              child: TextField(
                decoration: InputDecoration(
                  hintText: strings.countrySearchHint,
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            const SizedBox(height: GpsSpacing.sm),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (ctx, index) {
                  final option = options[index];
                  return ListTile(
                    leading: ExcludeSemantics(
                      child: Text(
                        option.flag,
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                    title: Text(strings.countryName(option)),
                    subtitle: Text(option.dialingCode),
                    selected: option == widget.selected,
                    trailing: option == widget.selected
                        ? Icon(Icons.check, color: colorScheme.primary)
                        : null,
                    onTap: () => Navigator.pop(ctx, option),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
