/// Phase 6.1 EUR rail feature flags (dart-define / flavor config).
abstract final class EurRailFlags {
  /// Stripe publishable key. Empty ⇒ PaymentSheet service no-ops.
  static const publishableKey = String.fromEnvironment(
    'STRIPE_PUBLISHABLE_KEY',
  );

  /// Master switch for the EUR/Stripe rail (default off until DoD + G-3).
  static const enabled = bool.fromEnvironment(
    'EUR_RAIL_ENABLED',
    defaultValue: false,
  );

  /// True when the live Stripe PaymentSheet path may be used.
  static bool get paymentSheetAvailable =>
      enabled && publishableKey.trim().isNotEmpty;
}
