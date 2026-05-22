import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_exception.dart';
import '../auth/auth_repository.provider.dart';
import '../auth/auth_session.provider.dart';
import '../l10n/auth_strings.dart';
import '../routing/gps_routes.dart';
import '../theme/gps_spacing.dart';
import '../widgets/algerian_phone_field.dart';
import '../widgets/auth_flow_scaffold.dart';
import '../widgets/gps_text_field.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _passwordController = TextEditingController();
  String? _phoneE164;
  String? _phoneError;
  String? _error;
  bool _loading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final strings = AuthStrings.of(context);
    if (_phoneE164 == null) {
      setState(() => _phoneError = strings.invalidPhone);
      return;
    }
    if (_passwordController.text.isEmpty) {
      setState(() => _error = strings.passwordLabel);
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final tokens = await ref
          .read(authRepositoryProvider)
          .login(phoneE164: _phoneE164!, password: _passwordController.text);
      await ref.read(authSessionProvider).signIn(tokens);
      if (mounted) {
        context.go(GpsRoutes.profile);
      }
    } on AuthException catch (e) {
      setState(() => _error = e.message);
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
      title: strings.loginTitle,
      subtitle: strings.loginSubtitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: GpsSpacing.md),
          // Form Card
          Container(
            padding: const EdgeInsets.all(GpsSpacing.lg),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.04),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AlgerianPhoneField(
                  errorText: _phoneError,
                  onChanged: (e164) => setState(() {
                    _phoneE164 = e164;
                    _phoneError = null;
                  }),
                ),
                const SizedBox(height: GpsSpacing.md),
                GpsTextField(
                  controller: _passwordController,
                  label: strings.passwordLabel,
                  obscureText: true,
                  autofillHints: const [AutofillHints.password],
                ),
                const SizedBox(height: GpsSpacing.sm),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () => context.go(GpsRoutes.forgotPassword),
                    child: Text(
                      strings.forgotPassword,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (_error != null) ...[
                  const SizedBox(height: GpsSpacing.sm),
                  Text(
                    _error!,
                    style: TextStyle(color: colorScheme.error),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: GpsSpacing.md),
                PrimaryButton(
                  label: strings.signIn,
                  onPressed: _signIn,
                  isLoading: _loading,
                ),
                const SizedBox(height: GpsSpacing.md),
                Row(
                  children: [
                    Expanded(child: Divider(color: colorScheme.outlineVariant)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: GpsSpacing.md,
                      ),
                      child: Text(
                        'OU',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.outline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: colorScheme.outlineVariant)),
                  ],
                ),
                const SizedBox(height: GpsSpacing.md),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.fingerprint),
                  label: const Text('Se connecter avec biométrie'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: colorScheme.outline),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: GpsSpacing.xl),
          // Signup footer redirect
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pas encore inscrit ?',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              TextButton(
                onPressed: () => context.go(GpsRoutes.registerNin),
                child: Text(
                  strings.createAccount,
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colorScheme.primary,
        child: const Icon(Icons.help_outline, color: Colors.white),
      ),
    );
  }
}
