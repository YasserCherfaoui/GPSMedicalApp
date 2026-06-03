import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/distance_utils.dart';

List<String> doctorSpecialtyLabels(Doctor doc, bool isAr) {
  return doc.specialties
          ?.map(
            (s) => isAr ? (s.nameAr ?? s.nameFr ?? '') : (s.nameFr ?? ''),
          )
          .where((n) => n.isNotEmpty)
          .toList() ??
      [];
}

Widget buildDoctorCardTile({
  required BuildContext context,
  required Doctor doc,
  required bool isAr,
  double? userLat,
  double? userLng,
  VoidCallback? onBookPressed,
}) {
  final labels = doctorSpecialtyLabels(doc, isAr);
  final distanceKm = doc is DoctorWithDistance && doc.distanceKm != null
      ? doc.distanceKm
      : (userLat != null && userLng != null
            ? haversineKm(
                userLat: userLat,
                userLng: userLng,
                address: doc.practiceAddress,
              )
            : null);

  return DoctorCard(
    name: '${doc.title ?? 'Dr.'} ${doc.fullName ?? ''}',
    specialty: labels.firstOrNull ?? '',
    specialtyChips: labels.length > 1 ? labels : null,
    rating: doc.ratingAverage ?? 0,
    reviewCount: doc.ratingCount ?? 0,
    city:
        doc.practiceAddress?.communeName ??
        doc.practiceAddress?.wilayaName ??
        '',
    fee: doc.consultationFeeDzd ?? 0,
    photoUrl: doc.photoUrl,
    isVerified: doc.verified ?? false,
    offersTelehealth: doc.offersTelehealth ?? false,
    distanceKm: distanceKm,
    onTap: () => context.push(GpsRoutes.doctorDetail(doc.id ?? '')),
    onBookPressed:
        onBookPressed ??
        () => context.push('${GpsRoutes.doctorDetail(doc.id ?? '')}?book=true'),
    onFavoritePressed: () {},
  );
}
