import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/payments_fx.provider.dart';
import '../utils/price_format.dart';

/// Price line with optional K-4 indicative DZD + EUR debit caveat.
class PriceWithFxLabel extends ConsumerWidget {
  const PriceWithFxLabel({
    required this.amount,
    required this.currency,
    this.style,
    this.subtitleStyle,
    this.prefixBuilder,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    super.key,
  });

  final int amount;
  final String currency;

  /// Wraps the primary price string (e.g. clinic "À partir de …").
  final String Function(String formattedPrice)? prefixBuilder;
  final TextStyle? style;
  final TextStyle? subtitleStyle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final languageCode = Localizations.localeOf(context).languageCode;
    final theme = Theme.of(context);
    final formatted = formatMoneyMajor(
      amount: amount,
      currency: currency,
      languageCode: languageCode,
    );
    final primary = prefixBuilder?.call(formatted) ?? formatted;
    final eur = isEurCurrency(currency);

    String? indicative;
    if (eur) {
      final fx = ref.watch(indicativeEurDzdRateProvider).asData?.value;
      if (fx != null) {
        final dzd = indicativeQuoteAmount(baseAmount: amount, rate: fx.rate);
        if (dzd > 0) {
          indicative = l10n.priceIndicativeApprox(dzd, 'DZD');
        }
      }
    }

    final subStyle =
        subtitleStyle ??
        theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        );

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(primary, style: style),
        if (indicative != null) ...[
          const SizedBox(height: 2),
          Text(indicative, style: subStyle),
        ],
        if (eur) ...[
          const SizedBox(height: 2),
          Text(
            l10n.priceEurDebitCaveat,
            style: subStyle?.copyWith(fontStyle: FontStyle.italic),
          ),
        ],
      ],
    );
  }
}

/// Builds subtitle / caveat strings for cards that cannot embed [PriceWithFxLabel].
({String? subtitle, String? caveat}) eurPriceAnnotations({
  required AppLocalizations l10n,
  required String currency,
  required int amount,
  required double? fxRate,
}) {
  if (!isEurCurrency(currency)) {
    return (subtitle: null, caveat: null);
  }
  String? subtitle;
  if (fxRate != null && fxRate > 0) {
    final dzd = indicativeQuoteAmount(baseAmount: amount, rate: fxRate);
    if (dzd > 0) {
      subtitle = l10n.priceIndicativeApprox(dzd, 'DZD');
    }
  }
  return (subtitle: subtitle, caveat: l10n.priceEurDebitCaveat);
}
