import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

import '../auth/auth_exception.dart';
import '../auth/auth_repository.provider.dart';
import '../auth/auth_session.provider.dart';
import '../auth/recovery_phone.provider.dart';
import '../auth/registration_draft.provider.dart';
import '../constants/registration_countries.dart';
import '../l10n/auth_strings.dart';
import '../models/app_info.dart';
import '../models/app_info.provider.dart';
import '../routing/gps_routes.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';
import '../validation/nin.dart';
import '../validation/password_strength.dart';
import '../validation/phone_e164.dart';
import '../widgets/auth_flow_scaffold.dart';
import '../widgets/auth_toast.dart';
import '../widgets/country_phone_field.dart';
import '../widgets/gps_text_field.dart';
import '../widgets/gps_logo.dart';
import '../widgets/otp_pin_input.dart';
import '../widgets/password_strength_field.dart';
import '../widgets/primary_button.dart';

// --- STEP 1: COUNTRY ---
class RegisterCountryScreen extends ConsumerStatefulWidget {
  const RegisterCountryScreen({super.key});

  @override
  ConsumerState<RegisterCountryScreen> createState() =>
      _RegisterCountryScreenState();
}

class _RegisterCountryScreenState extends ConsumerState<RegisterCountryScreen> {
  RegistrationCountry? _selected;
  String? _error;

  @override
  void initState() {
    super.initState();
    _selected = ref.read(registrationDraftProvider).country;
  }

  void _continue() {
    final strings = AuthStrings.of(context);
    final selected = _selected;
    if (selected == null) {
      return;
    }
    final appInfo = ref.read(appInfoProvider);
    if (appInfo.clientKind == GpsMedicalClientKind.specialist &&
        selected == RegistrationCountry.tn) {
      setState(() => _error = strings.countryNotSupportedForRole);
      return;
    }
    ref.read(registrationDraftProvider.notifier).updateCountry(selected);
    if (selected.requiresNin) {
      context.push(GpsRoutes.registerNin);
    } else {
      context.push(GpsRoutes.registerFullName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final country = _selected;

    return AuthFlowScaffold(
      fallbackPopLocation: GpsRoutes.authWelcome,
      title: strings.registration,
      step: RegistrationSteps.country(country),
      totalSteps: RegistrationSteps.total(country),
      subtitle: strings.countryTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            strings.countrySubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          for (final option in RegistrationCountries.all) ...[
            _CountryOptionCard(
              country: option,
              label: strings.countryName(option),
              selected: _selected == option,
              onTap: () => setState(() {
                _selected = option;
                _error = null;
              }),
            ),
            const SizedBox(height: GpsSpacing.md),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, size: 16, color: colorScheme.outline),
              const SizedBox(width: GpsSpacing.xs),
              Expanded(
                child: Text(
                  strings.countryImmutableNotice,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          if (_error != null) ...[
            const SizedBox(height: GpsSpacing.md),
            Text(
              _error!,
              style: TextStyle(color: colorScheme.error),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
      bottom: PrimaryButton(
        label: strings.continueLabel,
        onPressed: _selected == null ? null : _continue,
      ),
    );
  }
}

class _CountryOptionCard extends StatelessWidget {
  const _CountryOptionCard({
    required this.country,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final RegistrationCountry country;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: GpsRadii.card,
        child: Ink(
          padding: const EdgeInsets.all(GpsSpacing.md),
          decoration: BoxDecoration(
            color: selected
                ? colorScheme.primary.withOpacity(0.08)
                : colorScheme.surfaceContainerLowest.withOpacity(0.8),
            borderRadius: GpsRadii.card,
            border: Border.all(
              color: selected
                  ? colorScheme.primary
                  : colorScheme.outlineVariant.withOpacity(0.3),
              width: selected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Text(country.flag, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: GpsSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      country.dialingCode,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: selected ? colorScheme.primary : colorScheme.outline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- STEP 2 (DZ): NIN ENTRY ---
class RegisterNinScreen extends ConsumerStatefulWidget {
  const RegisterNinScreen({super.key});

  @override
  ConsumerState<RegisterNinScreen> createState() => _RegisterNinScreenState();
}

class _RegisterNinScreenState extends ConsumerState<RegisterNinScreen> {
  final _controller = TextEditingController();
  String? _error;
  bool _checking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final country = ref.read(registrationDraftProvider).country;
      if (country == null) {
        context.go(GpsRoutes.registerCountry);
      } else if (!country.requiresNin) {
        context.go(GpsRoutes.registerFullName);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    final strings = AuthStrings.of(context);
    final nin = NinValidator.validate(_controller.text);
    if (nin == null) {
      setState(() => _error = strings.invalidNin);
      return;
    }

    setState(() {
      _checking = true;
      _error = null;
    });

    try {
      await ref.read(authRepositoryProvider).checkRegisterNin(nin);
      ref.read(registrationDraftProvider.notifier).updateNin(nin);
      if (mounted) {
        context.push(GpsRoutes.registerFullName);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e);
      }
    } finally {
      if (mounted) {
        setState(() => _checking = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final country = ref.watch(registrationDraftProvider).country;

    return AuthFlowScaffold(
      fallbackPopLocation: GpsRoutes.registerCountry,
      title: strings.registration,
      step: RegistrationSteps.nin(country),
      totalSteps: RegistrationSteps.total(country),
      subtitle: strings.ninTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            strings.ninSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          // Bento guide visual card
          Container(
            padding: const EdgeInsets.all(GpsSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: GpsRadii.card,
              border: Border.all(
                color: colorScheme.outlineVariant.withOpacity(0.3),
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.02),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(GpsSpacing.sm),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.08),
                    borderRadius: GpsRadii.button,
                  ),
                  child: Icon(
                    Icons.badge,
                    color: colorScheme.primary,
                    size: 28,
                  ),
                ),
                const SizedBox(width: GpsSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GUIDE VISUEL',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.xs),
                      Text(
                        'Le NIN se situe en haut à droite de votre carte biométrique.',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: GpsSpacing.xl),
          // Label and text count layout
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'NIN',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colorScheme.outline,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '18 CHIFFRES',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colorScheme.outlineVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: GpsSpacing.xs),
          GpsTextField(
            controller: _controller,
            hint: '1234 5678 9012 3456 78',
            keyboardType: TextInputType.number,
            errorText: _error,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(18),
            ],
            onChanged: (_) => setState(() => _error = null),
          ),
          const SizedBox(height: GpsSpacing.sm),
          Row(
            children: [
              Icon(Icons.info_outline, size: 16, color: colorScheme.outline),
              const SizedBox(width: GpsSpacing.xs),
              Expanded(
                child: Text(
                  strings.ninHint,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: GpsSpacing.xl),
          Center(
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.help_outline, size: 16),
              label: Text(
                'Pourquoi le NIN ?',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      bottom: PrimaryButton(
        label: strings.continueLabel,
        onPressed: _checking ? null : _continue,
        isLoading: _checking,
      ),
    );
  }
}

// --- Full name (required by API) ---
class RegisterFullNameScreen extends ConsumerStatefulWidget {
  const RegisterFullNameScreen({super.key});

  @override
  ConsumerState<RegisterFullNameScreen> createState() =>
      _RegisterFullNameScreenState();
}

class _RegisterFullNameScreenState
    extends ConsumerState<RegisterFullNameScreen> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _continue() {
    final strings = AuthStrings.of(context);
    final trimmed = _controller.text.trim();
    if (trimmed.length < 2 || trimmed.length > 120) {
      setState(() => _error = strings.invalidFullName);
      return;
    }
    ref.read(registrationDraftProvider.notifier).updateFullName(trimmed);
    context.push(GpsRoutes.registerPhone);
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final country = ref.watch(registrationDraftProvider).country;

    return AuthFlowScaffold(
      title: strings.registration,
      step: RegistrationSteps.fullName(country),
      totalSteps: RegistrationSteps.total(country),
      subtitle: strings.fullNameTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            strings.fullNameSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          GpsTextField(
            controller: _controller,
            hint: strings.fullNameHint,
            keyboardType: TextInputType.name,
            errorText: _error,
            inputFormatters: [LengthLimitingTextInputFormatter(120)],
            onChanged: (_) => setState(() => _error = null),
          ),
        ],
      ),
      bottom: PrimaryButton(label: strings.continueLabel, onPressed: _continue),
    );
  }
}

// --- STEP 3: PHONE ENTRY ---
class RegisterPhoneScreen extends ConsumerStatefulWidget {
  const RegisterPhoneScreen({super.key});

  @override
  ConsumerState<RegisterPhoneScreen> createState() =>
      _RegisterPhoneScreenState();
}

class _RegisterPhoneScreenState extends ConsumerState<RegisterPhoneScreen> {
  String? _phoneE164;
  String? _error;
  bool _checking = false;

  Future<void> _continue() async {
    final strings = AuthStrings.of(context);
    final country = ref.read(registrationDraftProvider).country;
    if (country == null) {
      context.go(GpsRoutes.registerCountry);
      return;
    }
    if (_phoneE164 == null) {
      setState(() => _error = strings.invalidPhoneFor(country));
      return;
    }
    if (!PhoneE164.matchesCountry(_phoneE164!, country)) {
      setState(() => _error = strings.phoneCountryMismatch);
      return;
    }

    setState(() {
      _checking = true;
      _error = null;
    });

    try {
      await ref
          .read(authRepositoryProvider)
          .checkRegisterPhone(phoneE164: _phoneE164!, country: country);
      ref.read(registrationDraftProvider.notifier).updatePhone(_phoneE164!);
      if (mounted) {
        context.push(GpsRoutes.registerPassword);
      }
    } on AuthException catch (e) {
      if (!mounted) {
        return;
      }
      if (e is AuthValidationException &&
          e.problemCode == 'phone_country_mismatch') {
        setState(() => _error = strings.phoneCountryMismatch);
      } else {
        showAuthErrorToast(context, e);
      }
    } finally {
      if (mounted) {
        setState(() => _checking = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final country = ref.watch(registrationDraftProvider).country;

    if (country == null) {
      return AuthFlowScaffold(
        fallbackPopLocation: GpsRoutes.registerCountry,
        title: strings.registration,
        subtitle: strings.phoneTitle,
        body: const SizedBox.shrink(),
        bottom: PrimaryButton(
          label: strings.continueLabel,
          onPressed: () => context.go(GpsRoutes.registerCountry),
        ),
      );
    }

    return AuthFlowScaffold(
      title: strings.registration,
      step: RegistrationSteps.phone(country),
      totalSteps: RegistrationSteps.total(country),
      subtitle: strings.phoneTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            strings.phoneSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          CountryPhoneField(
            country: country,
            errorText: _error,
            onChanged: (e164) => setState(() {
              _phoneE164 = e164;
              _error = null;
            }),
          ),
          const SizedBox(height: GpsSpacing.xs),
          Row(
            children: [
              Icon(Icons.info_outline, size: 14, color: colorScheme.outline),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  strings.phoneFormatHintFor(country),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: GpsSpacing.xl),
          // SMS illustration
          Center(
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.secondaryContainer.withOpacity(0.15),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.primary.withOpacity(0.1),
                        width: 1.5,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.sms_outlined,
                    size: 56,
                    color: colorScheme.primary.withOpacity(0.6),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottom: PrimaryButton(
        label: strings.continueLabel,
        onPressed: _checking ? null : _continue,
        isLoading: _checking,
      ),
    );
  }
}

// --- STEP 4: PASSWORD CREATION ---
class RegisterPasswordScreen extends ConsumerStatefulWidget {
  const RegisterPasswordScreen({super.key});

  @override
  ConsumerState<RegisterPasswordScreen> createState() =>
      _RegisterPasswordScreenState();
}

class _RegisterPasswordScreenState
    extends ConsumerState<RegisterPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  PasswordStrength _strength = const PasswordStrength(
    minLength: false,
    hasUppercase: false,
    hasDigit: false,
    hasSpecial: false,
  );
  String? _confirmError;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _continue() {
    final strings = AuthStrings.of(context);
    if (!_strength.isValid) {
      return;
    }
    if (_passwordController.text != _confirmController.text) {
      setState(() => _confirmError = strings.passwordsMismatch);
      return;
    }
    ref
        .read(registrationDraftProvider.notifier)
        .updatePassword(_passwordController.text);
    context.push(GpsRoutes.registerConsent);
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final country = ref.watch(registrationDraftProvider).country;

    return AuthFlowScaffold(
      title: strings.registration,
      step: RegistrationSteps.password(country),
      totalSteps: RegistrationSteps.total(country),
      subtitle: strings.passwordTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PasswordStrengthField(
            controller: _passwordController,
            confirmController: _confirmController,
            strength: _strength,
            confirmError: _confirmError,
            onChanged: (value) {
              setState(() {
                _strength = PasswordStrength.evaluate(value);
                _confirmError = null;
              });
            },
          ),
          const SizedBox(height: GpsSpacing.lg),
          Row(
            children: [
              Icon(Icons.lock_outline, size: 14, color: colorScheme.outline),
              const SizedBox(width: GpsSpacing.xs),
              Expanded(
                child: Text(
                  'Chiffrement de bout en bout conforme ANPDP',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottom: PrimaryButton(
        label: strings.continueLabel,
        onPressed: _strength.isValid ? _continue : null,
      ),
    );
  }
}

// --- STEP 4: CONSENTS ---
class RegisterConsentScreen extends ConsumerStatefulWidget {
  const RegisterConsentScreen({super.key});

  @override
  ConsumerState<RegisterConsentScreen> createState() =>
      _RegisterConsentScreenState();
}

class _RegisterConsentScreenState extends ConsumerState<RegisterConsentScreen> {
  bool _data = true;
  bool _health = true;
  bool _terms = false;
  bool _marketing = false;
  bool _cgu = false;
  bool _loading = false;
  String? _error;

  Future<void> _submit() async {
    final strings = AuthStrings.of(context);
    if (!_data || !_health || !_terms || !_cgu) {
      setState(() => _error = strings.requiredConsents);
      return;
    }

    ref
        .read(registrationDraftProvider.notifier)
        .updateConsents(
          dataProcessing: _data,
          healthData: _health,
          anpdpTerms: _terms,
          marketing: _marketing,
        );

    final draft = ref.read(registrationDraftProvider);
    final appInfo = ref.read(appInfoProvider);

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final repo = ref.read(authRepositoryProvider);
      final response = await repo.register(
        draft: draft,
        role: appInfo.clientKind,
      );
      final draftNotifier = ref.read(registrationDraftProvider.notifier);
      draftNotifier.markOtpSent();
      draftNotifier.setNinVerificationStatus(response.ninVerificationStatus);
      if (mounted) {
        context.push(GpsRoutes.registerOtp);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e);
      }
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final country =
        ref.watch(registrationDraftProvider).country ?? RegistrationCountry.dz;
    final canSubmit = _data && _health && _terms && _cgu && !_loading;

    return AuthFlowScaffold(
      title: strings.registration,
      step: RegistrationSteps.consent(country),
      totalSteps: RegistrationSteps.total(country),
      subtitle: strings.consentTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            strings.consentSubtitleFor(country),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.xs),
          Text(
            strings.consentLegalVersion(country.consentPolicyVersion),
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: colorScheme.outline),
          ),
          const SizedBox(height: GpsSpacing.lg),
          // Consent Cards List
          _ConsentCard(
            title: strings.consentHealth,
            subtitle:
                "Nécessaire pour le fonctionnement de l'application et le suivi de votre dossier médical.",
            value: _health,
            isRequired: true,
            onChanged: (v) => setState(() => _health = v),
          ),
          const SizedBox(height: GpsSpacing.md),
          _ConsentCard(
            title: strings.consentData,
            subtitle:
                "Autoriser le traitement sécurisé et l'hébergement de vos données cliniques.",
            value: _data,
            isRequired: true,
            onChanged: (v) => setState(() => _data = v),
          ),
          const SizedBox(height: GpsSpacing.md),
          _ConsentCard(
            title: strings.consentTermsFor(country),
            subtitle: strings.consentSubtitleFor(country),
            value: _terms,
            onChanged: (v) => setState(() => _terms = v),
          ),
          const SizedBox(height: GpsSpacing.md),
          _ConsentCard(
            title: strings.consentMarketing,
            subtitle:
                'Recevez des conseils de coaching biologique personnalisés et des actualités de santé.',
            value: _marketing,
            onChanged: (v) => setState(() => _marketing = v),
          ),
          const SizedBox(height: GpsSpacing.lg),
          // CGU/CGV Checkbox
          CheckboxListTile(
            value: _cgu,
            activeColor: colorScheme.primary,
            onChanged: (v) => setState(() => _cgu = v ?? false),
            title: Text(
              strings.acceptTerms,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          if (_error != null) ...[
            const SizedBox(height: GpsSpacing.sm),
            Text(
              _error!,
              style: TextStyle(color: colorScheme.error),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
      bottom: PrimaryButton(
        label: strings.createMyAccount,
        onPressed: canSubmit ? _submit : null,
        isLoading: _loading,
      ),
    );
  }
}

class _ConsentCard extends StatelessWidget {
  const _ConsentCard({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.isRequired = false,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(GpsSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest.withOpacity(0.8),
        borderRadius: GpsRadii.card,
        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: GpsSpacing.md),
          Switch(
            value: isRequired ? true : value,
            activeColor: colorScheme.primary,
            onChanged: isRequired ? null : onChanged,
          ),
        ],
      ),
    );
  }
}

// --- STEP 5: OTP VERIFICATION ---
class RegisterOtpScreen extends ConsumerStatefulWidget {
  const RegisterOtpScreen({super.key});

  @override
  ConsumerState<RegisterOtpScreen> createState() => _RegisterOtpScreenState();
}

class _RegisterOtpScreenState extends ConsumerState<RegisterOtpScreen> {
  int _resendSeconds = 45;
  Timer? _timer;
  bool _loading = false;
  String? _error;

  bool get _showNinVerificationBanner {
    final status = ref.watch(registrationDraftProvider).ninVerificationStatus;
    return status == RegisterResponseNinVerificationStatusEnum.pending ||
        status == RegisterResponseNinVerificationStatusEnum.failed;
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _resendSeconds = 45);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_resendSeconds <= 0) {
        t.cancel();
      } else if (mounted) {
        setState(() => _resendSeconds--);
      }
    });
  }

  Future<void> _verify(String code) async {
    if (_loading || code.length != 6) {
      return;
    }
    final phone = ref.read(registrationDraftProvider).phoneE164;
    if (phone == null) {
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final repo = ref.read(authRepositoryProvider);
      final tokens = await repo.verifyRegistrationOtp(
        phoneE164: phone,
        code: code,
      );
      await ref.read(authSessionProvider).signIn(tokens, phone: phone);
      if (mounted) {
        context.go(GpsRoutes.biometricSetup);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e);
      }
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _resend() async {
    final phone = ref.read(registrationDraftProvider).phoneE164;
    if (phone == null || _resendSeconds > 0) {
      return;
    }
    try {
      await ref.read(authRepositoryProvider).resendOtp(phoneE164: phone);
      _startTimer();
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final draft = ref.watch(registrationDraftProvider);
    final country = draft.country;
    final phone = draft.phoneE164 ?? country?.dialingCode ?? '+213…';
    final displayPhone = PhoneE164.formatDisplay(phone);

    return AuthFlowScaffold(
      title: strings.verification,
      step: RegistrationSteps.otp(country),
      totalSteps: RegistrationSteps.total(country),
      subtitle: strings.otpTitle,
      body: Column(
        children: [
          // Visual Shield lock icon container
          Container(
            width: 88,
            height: 88,
            margin: const EdgeInsets.symmetric(vertical: GpsSpacing.md),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primaryContainer.withOpacity(0.1),
            ),
            child: Icon(
              Icons.shield_outlined,
              size: 40,
              color: colorScheme.primary,
            ),
          ),
          Text(
            strings.otpSubtitle(displayPhone),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: GpsSpacing.xl),
          if (_showNinVerificationBanner) ...[
            _NinVerificationBanner(
              message: strings.ninVerificationPendingBanner,
            ),
            const SizedBox(height: GpsSpacing.md),
          ],
          OtpPinInput(
            enabled: !_loading,
            onChanged: (_) {},
            onCompleted: _verify,
          ),
          const SizedBox(height: GpsSpacing.lg),
          // Timer row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.schedule, size: 18, color: colorScheme.outline),
              const SizedBox(width: 6),
              if (_resendSeconds > 0)
                Text(
                  'Renvoyer le code dans 0:${_resendSeconds.toString().padLeft(2, '0')}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                )
              else
                TextButton(
                  onPressed: _resend,
                  child: Text(
                    strings.resendCode,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
          if (_error != null) ...[
            const SizedBox(height: GpsSpacing.md),
            Text(
              _error!,
              style: TextStyle(color: colorScheme.error),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: GpsSpacing.xl),
          // Bento helper guide
          Container(
            padding: const EdgeInsets.all(GpsSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest.withOpacity(0.8),
              borderRadius: GpsRadii.card,
              border: Border.all(
                color: colorScheme.outlineVariant.withOpacity(0.3),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer.withOpacity(0.3),
                    borderRadius: GpsRadii.input,
                  ),
                  child: Icon(
                    Icons.info_outline,
                    color: colorScheme.onSecondaryContainer,
                    size: 20,
                  ),
                ),
                const SizedBox(width: GpsSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Besoin d'aide ?",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Si vous ne recevez pas le code, vérifiez votre connexion réseau ou contactez notre support.',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              height: 1.4,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottom: PrimaryButton(
        label: strings.verify,
        onPressed: _loading ? null : () {},
        isLoading: _loading,
      ),
    );
  }
}

// --- FORGOT PASSWORD ---
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  RegistrationCountry _country = RegistrationCountry.dz;
  String? _phoneE164;
  String? _error;
  bool _loading = false;

  Future<void> _submit() async {
    final strings = AuthStrings.of(context);
    if (_phoneE164 == null) {
      setState(() => _error = strings.invalidPhoneFor(_country));
      return;
    }
    setState(() => _loading = true);
    try {
      await ref
          .read(authRepositoryProvider)
          .forgotPassword(phoneE164: _phoneE164!);
      ref.read(recoveryPhoneProvider.notifier).set(_phoneE164);
      if (mounted) {
        context.push(GpsRoutes.resetPassword);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e);
      }
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return AuthFlowScaffold(
      fallbackPopLocation: GpsRoutes.login,
      showBrandMark: true,
      title: strings.forgotTitle,
      subtitle: strings.forgotTitle,
      body: CountryPhoneField(
        country: _country,
        errorText: _error,
        onCountryChanged: (country) => setState(() {
          _country = country;
          _phoneE164 = null;
          _error = null;
        }),
        onChanged: (e164) => setState(() {
          _phoneE164 = e164;
          _error = null;
        }),
      ),
      bottom: PrimaryButton(
        label: strings.sendCode,
        onPressed: _submit,
        isLoading: _loading,
      ),
    );
  }
}

// --- RESET PASSWORD ---
class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  PasswordStrength _strength = const PasswordStrength(
    minLength: false,
    hasUppercase: false,
    hasDigit: false,
    hasSpecial: false,
  );
  String? _confirmError;
  String? _error;
  bool _loading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit(String otp) async {
    final strings = AuthStrings.of(context);
    final phone = ref.read(recoveryPhoneProvider);
    if (phone == null) {
      return;
    }
    if (!_strength.isValid) {
      return;
    }
    if (_passwordController.text != _confirmController.text) {
      setState(() => _confirmError = strings.passwordsMismatch);
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final tokens = await ref
          .read(authRepositoryProvider)
          .resetPassword(
            phoneE164: phone,
            code: otp,
            newPassword: _passwordController.text,
          );
      await ref.read(authSessionProvider).signIn(tokens, phone: phone);
      if (mounted) {
        context.go(GpsRoutes.profile);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e);
      }
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return AuthFlowScaffold(
      fallbackPopLocation: GpsRoutes.forgotPassword,
      title: strings.resetTitle,
      body: Column(
        children: [
          OtpPinInput(
            enabled: !_loading,
            onChanged: (_) {},
            onCompleted: _submit,
          ),
          const SizedBox(height: GpsSpacing.lg),
          PasswordStrengthField(
            controller: _passwordController,
            confirmController: _confirmController,
            strength: _strength,
            confirmError: _confirmError,
            onChanged: (value) {
              setState(() {
                _strength = PasswordStrength.evaluate(value);
                _confirmError = null;
              });
            },
          ),
          if (_error != null) ...[
            const SizedBox(height: GpsSpacing.sm),
            Text(_error!, style: TextStyle(color: colorScheme.error)),
          ],
        ],
      ),
      bottom: PrimaryButton(
        label: strings.resetAction,
        isLoading: _loading,
        onPressed: null,
      ),
    );
  }
}

// --- BIOMETRIC SETUP ---
class BiometricSetupScreen extends StatelessWidget {
  const BiometricSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return AuthFlowScaffold(
      title: strings.biometricTitle,
      showBack: false,
      showBrandMark: true,
      body: Column(
        children: [
          const SizedBox(height: GpsSpacing.lg),
          // Biometric premium fingerprint card
          Center(
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(GpsRadii.xxl),
                border: Border.all(
                  color: colorScheme.outlineVariant.withOpacity(0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.08),
                    blurRadius: 40,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.fingerprint,
                    size: 64,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: GpsSpacing.xl),
          Text(
            'Activez la connexion biométrique',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: GpsSpacing.sm),
          Text(
            'Connectez-vous plus rapidement avec Face ID ou votre empreinte digitale, en toute sécurité.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: GpsSpacing.xl),
          // Trust features badging
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: GpsRadii.button,
                    border: Border.all(
                      color: colorScheme.outlineVariant.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.verified_user,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Sécurisé',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: GpsSpacing.md),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: GpsRadii.button,
                    border: Border.all(
                      color: colorScheme.outlineVariant.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bolt, color: colorScheme.primary, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Instantané',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottom: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PrimaryButton(
            label: 'Activer',
            onPressed: () => context.go(GpsRoutes.registrationSuccess),
          ),
          const SizedBox(height: GpsSpacing.sm),
          OutlinedButton(
            onPressed: () => context.go(GpsRoutes.registrationSuccess),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: GpsRadii.button),
              side: BorderSide(color: colorScheme.primary),
            ),
            child: Text(
              'Plus tard',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: GpsSpacing.md),
        ],
      ),
    );
  }
}

// --- REGISTRATION SUCCESS ---
class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return AuthFlowScaffold(
      showBack: false,
      showBrandMark: true,
      title: 'GPS Médical Algérie',
      body: Column(
        children: [
          const SizedBox(height: GpsSpacing.lg),
          const Center(
            child: GpsLogo(size: 56, variant: GpsLogoVariant.iconGradient),
          ),
          const SizedBox(height: GpsSpacing.lg),
          // Celebratory success check with brand green accent
          Center(
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer.withOpacity(0.35),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.secondary.withOpacity(0.15),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: colorScheme.secondary.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    size: 64,
                    color: colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: GpsSpacing.xl),
          Text(
            'Bienvenue sur GPS Médical !',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: GpsSpacing.sm),
          Text(
            strings.successSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: GpsSpacing.xl),
          // Highlight feature grid
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: GpsRadii.button,
                    border: Border.all(
                      color: colorScheme.outlineVariant.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.map, color: colorScheme.primary, size: 24),
                      const SizedBox(height: 8),
                      Text(
                        'NAVIGATION',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.outline,
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Trouvez des cliniques',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: GpsSpacing.md),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow,
                    borderRadius: GpsRadii.button,
                    border: Border.all(
                      color: colorScheme.outlineVariant.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: colorScheme.primary,
                        size: 24,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'RENDEZ-VOUS',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.outline,
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Gestion facile',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: GpsSpacing.xl),
        ],
      ),
      bottom: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PrimaryButton(
            label: strings.discoverApp,
            onPressed: () => context.go(GpsRoutes.profile),
          ),
          const SizedBox(height: GpsSpacing.md),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Besoin d'aide ? ",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                children: [
                  TextSpan(
                    text: 'Consulter le guide',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: GpsSpacing.md),
        ],
      ),
    );
  }
}

class _NinVerificationBanner extends StatelessWidget {
  const _NinVerificationBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(GpsSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withOpacity(0.35),
        borderRadius: GpsRadii.button,
        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.verified_user_outlined, color: colorScheme.primary),
          const SizedBox(width: GpsSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
