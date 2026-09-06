import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../payments/providers/payments_fx.provider.dart';
import '../../payments/utils/price_format.dart';
import '../../payments/widgets/price_with_fx_label.dart';
import '../utils/clinic_display.dart';
import '../utils/distance_utils.dart';

Widget buildClinicCardTile({
  required BuildContext context,
  required WidgetRef ref,
  required Clinic clinic,
  double? userLat,
  double? userLng,
  ClinicCardVariant variant = ClinicCardVariant.list,
}) {
  final distanceKm = clinic is ClinicWithDistance && clinic.distanceKm != null
      ? clinic.distanceKm
      : (userLat != null && userLng != null
            ? haversineKm(
                userLat: userLat,
                userLng: userLng,
                address: clinic.address,
              )
            : null);

  final id = clinic.id ?? '';
  final fee = clinicStartingFee(clinic);
  final currency = clinicStartingCurrency(clinic);
  final l10n = AppLocalizations.of(context)!;
  final languageCode = Localizations.localeOf(context).languageCode;

  String? startingFeeLabel;
  String? priceSubtitle;
  String? priceCaveat;
  if (fee != null) {
    final formatted = formatMoneyMajor(
      amount: fee,
      currency: currency,
      languageCode: languageCode,
    );
    if (isEurCurrency(currency)) {
      startingFeeLabel = l10n.clinicCardFromPriceLabel(formatted);
      final fx = ref.watch(indicativeEurDzdRateProvider).asData?.value;
      final notes = eurPriceAnnotations(
        l10n: l10n,
        currency: currency,
        amount: fee,
        fxRate: fx?.rate,
      );
      priceSubtitle = notes.subtitle;
      priceCaveat = notes.caveat;
    }
  }

  return ClinicCard(
    variant: variant,
    name: clinic.name ?? '',
    city: clinic.address?.communeName ?? clinic.address?.wilayaName ?? '',
    rating: clinic.ratingAverage ?? 0,
    reviewCount: clinic.ratingCount ?? 0,
    serviceSummary: clinicServiceSummary(clinic),
    startingFee: fee,
    currency: currency,
    startingFeeLabel: startingFeeLabel,
    priceSubtitle: priceSubtitle,
    priceCaveat: priceCaveat,
    isVerified: clinic.verified ?? false,
    offersTelehealth: clinic.offersTelehealth ?? false,
    distanceKm: distanceKm,
    onTap: () => context.push(GpsRoutes.clinicDetail(id)),
    onBookPressed: () => context.push(GpsRoutes.clinicDetail(id)),
  );
}
