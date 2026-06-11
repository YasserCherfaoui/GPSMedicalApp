import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Shimmer placeholder while [specialtiesProvider] is loading.
class SpecialtiesPickerShimmer extends StatelessWidget {
  const SpecialtiesPickerShimmer({super.key, this.rowCount = 6});

  final int rowCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GpsSpacing.md),
      child: Column(
        children: List.generate(
          rowCount,
          (_) => const Padding(
            padding: EdgeInsets.only(bottom: GpsSpacing.sm),
            child: LoadingSkeleton(height: 48),
          ),
        ),
      ),
    );
  }
}
