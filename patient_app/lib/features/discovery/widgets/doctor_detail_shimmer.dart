import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class DoctorDetailShimmer extends StatelessWidget {
  const DoctorDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(GpsSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingSkeleton.card(),
          SizedBox(height: GpsSpacing.lg),
          LoadingSkeleton(height: 20, width: 120),
          SizedBox(height: GpsSpacing.sm),
          LoadingSkeleton(height: 60),
          SizedBox(height: GpsSpacing.lg),
          LoadingSkeleton(height: 20, width: 160),
          SizedBox(height: GpsSpacing.sm),
          LoadingSkeleton.card(),
        ],
      ),
    );
  }
}
