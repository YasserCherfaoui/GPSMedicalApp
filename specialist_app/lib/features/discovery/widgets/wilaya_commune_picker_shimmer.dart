import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Shimmer placeholder while wilaya or commune lists are loading.
class WilayaCommunePickerShimmer extends StatelessWidget {
  const WilayaCommunePickerShimmer({super.key, this.rowCount = 8});

  final int rowCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rowCount,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: GpsSpacing.md,
          vertical: GpsSpacing.xs,
        ),
        child: LoadingSkeleton(height: 48),
      ),
    );
  }
}
