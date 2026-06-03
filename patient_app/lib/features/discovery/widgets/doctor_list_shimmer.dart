import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class DoctorListShimmer extends StatelessWidget {
  const DoctorListShimmer({super.key, this.count = 4});

  final int count;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => const Padding(
            padding: EdgeInsets.only(bottom: GpsSpacing.md),
            child: LoadingSkeleton.card(),
          ),
          childCount: count,
        ),
      ),
    );
  }
}
