import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/clinic_display.dart';
import '../utils/distance_utils.dart';

Widget buildClinicCardTile({
  required BuildContext context,
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

  return ClinicCard(
    variant: variant,
    name: clinic.name ?? '',
    city: clinic.address?.communeName ?? clinic.address?.wilayaName ?? '',
    rating: clinic.ratingAverage ?? 0,
    reviewCount: clinic.ratingCount ?? 0,
    serviceSummary: clinicServiceSummary(clinic),
    startingFee: clinicStartingFee(clinic),
    currency: clinicStartingCurrency(clinic),
    isVerified: clinic.verified ?? false,
    offersTelehealth: clinic.offersTelehealth ?? false,
    distanceKm: distanceKm,
    onTap: () => context.push(GpsRoutes.clinicDetail(id)),
    onBookPressed: () => context.push(GpsRoutes.clinicDetail(id)),
  );
}
