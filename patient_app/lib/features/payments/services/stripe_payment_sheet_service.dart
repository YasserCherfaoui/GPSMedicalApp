import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../utils/eur_rail_flags.dart';

/// Design tokens for PaymentSheet (Phase 6.1 W30 — navy `#0A2540`, Manrope).
///
/// Manrope must be injected natively on iOS/Android for Stripe SDKs; the Flutter
/// appearance API does not expose `fontFamily` yet.
const stripePaymentSheetNavy = Color(0xFF0A2540);

/// Thin wrapper around [Stripe] PaymentSheet.
///
/// No-ops when [EurRailFlags.paymentSheetAvailable] is false so the existing
/// `stripe_test` sandbox deposit/freemium flows stay untouched.
class StripePaymentSheetService {
  StripePaymentSheetService({
    this.publishableKey = EurRailFlags.publishableKey,
    this.enabled = EurRailFlags.enabled,
  });

  final String publishableKey;
  final bool enabled;

  bool get isAvailable =>
      enabled && publishableKey.trim().isNotEmpty && !kIsWeb;

  bool _initialized = false;

  Future<void> ensureInitialized() async {
    if (!isAvailable || _initialized) return;
    Stripe.publishableKey = publishableKey.trim();
    await Stripe.instance.applySettings();
    _initialized = true;
  }

  /// Presents the native PaymentSheet for a Stripe PaymentIntent client secret.
  ///
  /// Throws [StateError] when the rail is disabled / key unset — callers
  /// (Week 31 booking) must check [isAvailable] first.
  ///
  /// Locale / RTL follow the device (and app) language; Stripe PaymentSheet
  /// honors system AR/FR localization. Manrope typeface is the design target —
  /// native font injection is platform-specific and deferred until the font is
  /// bundled for Stripe SDKs.
  Future<void> present({
    required String clientSecret,
    required String merchantDisplayName,
  }) async {
    if (!isAvailable) {
      throw StateError('Stripe PaymentSheet is not configured');
    }
    await ensureInitialized();

    final appearance = PaymentSheetAppearance(
      colors: PaymentSheetAppearanceColors(
        primary: stripePaymentSheetNavy,
        background: Colors.white,
        primaryText: stripePaymentSheetNavy,
        secondaryText: stripePaymentSheetNavy.withValues(alpha: 0.72),
        componentBackground: Colors.white,
        componentBorder: const Color(0xFFD0D7DE),
        componentDivider: const Color(0xFFE6EBF0),
        componentText: stripePaymentSheetNavy,
        placeholderText: stripePaymentSheetNavy.withValues(alpha: 0.45),
        icon: stripePaymentSheetNavy,
        error: const Color(0xFFBA1A1A),
      ),
      shapes: const PaymentSheetShape(
        borderRadius: 12,
        borderWidth: 1,
      ),
      primaryButton: const PaymentSheetPrimaryButtonAppearance(
        colors: PaymentSheetPrimaryButtonTheme(
          light: PaymentSheetPrimaryButtonThemeColors(
            background: stripePaymentSheetNavy,
            text: Colors.white,
            border: stripePaymentSheetNavy,
          ),
        ),
      ),
    );

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: merchantDisplayName,
        style: ThemeMode.light,
        appearance: appearance,
        billingDetailsCollectionConfiguration:
            const BillingDetailsCollectionConfiguration(
              address: AddressCollectionMode.never,
            ),
      ),
    );

    await Stripe.instance.presentPaymentSheet();
  }
}
