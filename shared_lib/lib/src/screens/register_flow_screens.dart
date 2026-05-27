import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_exception.dart';
import '../auth/auth_repository.provider.dart';
import '../auth/auth_session.provider.dart';
import '../auth/recovery_phone.provider.dart';
import '../auth/registration_draft.provider.dart';
import '../l10n/auth_strings.dart';
import '../models/app_info.provider.dart';
import '../routing/gps_routes.dart';
import '../theme/gps_spacing.dart';
import '../validation/algerian_phone.dart';
import '../validation/nin.dart';
import '../validation/password_strength.dart';
import '../widgets/algerian_phone_field.dart';
import '../widgets/auth_flow_scaffold.dart';
import '../widgets/auth_toast.dart';
import '../widgets/gps_text_field.dart';
import '../widgets/otp_pin_input.dart';
import '../widgets/password_strength_field.dart';
import '../widgets/primary_button.dart';

// --- STEP 1: NIN ENTRY ---
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
        context.go(GpsRoutes.registerFullName);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e.message);
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

    return AuthFlowScaffold(
      title: strings.registration,
      step: 1,
      totalSteps: 6,
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
              borderRadius: BorderRadius.circular(16),
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
                    borderRadius: BorderRadius.circular(10),
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
    context.go(GpsRoutes.registerPhone);
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return AuthFlowScaffold(
      title: strings.registration,
      step: 2,
      totalSteps: 6,
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
    if (_phoneE164 == null) {
      setState(() => _error = strings.invalidPhone);
      return;
    }

    setState(() {
      _checking = true;
      _error = null;
    });

    try {
      await ref.read(authRepositoryProvider).checkRegisterPhone(_phoneE164!);
      ref.read(registrationDraftProvider.notifier).updatePhone(_phoneE164!);
      if (mounted) {
        context.go(GpsRoutes.registerPassword);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e.message);
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

    return AuthFlowScaffold(
      title: strings.registration,
      step: 3,
      totalSteps: 6,
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
          AlgerianPhoneField(
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
              Text(
                'Format attendu : +213 5XX, 6XX ou 7XX',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
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
    context.go(GpsRoutes.registerConsent);
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return AuthFlowScaffold(
      title: strings.registration,
      step: 4,
      totalSteps: 6,
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
      await repo.register(draft: draft, role: appInfo.clientKind);
      ref.read(registrationDraftProvider.notifier).markOtpSent();
      if (mounted) {
        context.go(GpsRoutes.registerOtp);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e.message);
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
    final canSubmit = _data && _health && _terms && _cgu && !_loading;

    return AuthFlowScaffold(
      title: strings.registration,
      step: 5,
      totalSteps: 6,
      subtitle: strings.consentTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Conformément à la loi algérienne ANPDP',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
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
            title: strings.consentTerms,
            subtitle:
                'Consentement explicite pour la collecte des données conformément à la réglementation ANPDP.',
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
        borderRadius: BorderRadius.circular(16),
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
      await ref.read(authSessionProvider).signIn(tokens);
      if (mounted) {
        context.go(GpsRoutes.biometricSetup);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e.message);
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
        showAuthErrorToast(context, e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final phone = ref.watch(registrationDraftProvider).phoneE164 ?? '+213…';
    final displayPhone = AlgerianPhone.formatDisplay(
      phone.length >= 13 ? phone : '+213500000000',
    );

    return AuthFlowScaffold(
      title: strings.verification,
      step: 6,
      totalSteps: 6,
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
              borderRadius: BorderRadius.circular(16),
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
                    borderRadius: BorderRadius.circular(8),
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
  String? _phoneE164;
  String? _error;
  bool _loading = false;

  Future<void> _submit() async {
    final strings = AuthStrings.of(context);
    if (_phoneE164 == null) {
      setState(() => _error = strings.invalidPhone);
      return;
    }
    setState(() => _loading = true);
    try {
      await ref
          .read(authRepositoryProvider)
          .forgotPassword(phoneE164: _phoneE164!);
      ref.read(recoveryPhoneProvider.notifier).state = _phoneE164;
      if (mounted) {
        context.go(GpsRoutes.resetPassword);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e.message);
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
      title: strings.forgotTitle,
      subtitle: strings.forgotTitle,
      body: AlgerianPhoneField(
        errorText: _error,
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
      await ref.read(authSessionProvider).signIn(tokens);
      if (mounted) {
        context.go(GpsRoutes.profile);
      }
    } on AuthException catch (e) {
      if (mounted) {
        showAuthErrorToast(context, e.message);
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
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: colorScheme.outlineVariant.withOpacity(0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.tertiary.withOpacity(0.08),
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
                    color: colorScheme.tertiary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.fingerprint,
                    size: 64,
                    color: colorScheme.tertiary,
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
                    borderRadius: BorderRadius.circular(12),
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
                    borderRadius: BorderRadius.circular(12),
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
      title: 'GPS Médical Algérie',
      body: Column(
        children: [
          const SizedBox(height: GpsSpacing.lg),
          // Celebratory green check orange glow container
          Center(
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: colorScheme.tertiary.withOpacity(0.1),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.tertiary.withOpacity(0.15),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: colorScheme.tertiary.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    size: 64,
                    color: colorScheme.tertiary,
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
                    borderRadius: BorderRadius.circular(12),
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
                    borderRadius: BorderRadius.circular(12),
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
