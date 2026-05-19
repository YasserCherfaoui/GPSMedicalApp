import 'package:flutter/material.dart';

import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';

/// Shimmer-style loading placeholder for lists and cards.
class LoadingSkeleton extends StatefulWidget {
  const LoadingSkeleton({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius,
  });

  const LoadingSkeleton.card({super.key})
    : width = double.infinity,
      height = 120,
      borderRadius = null;

  final double? width;
  final double height;
  final BorderRadius? borderRadius;

  @override
  State<LoadingSkeleton> createState() => _LoadingSkeletonState();
}

class _LoadingSkeletonState extends State<LoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainer;
    final highlight = Theme.of(context).colorScheme.surfaceContainerHigh;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          margin: const EdgeInsets.only(bottom: GpsSpacing.sm),
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? GpsRadii.input,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [base, highlight, base],
              stops: [0, _controller.value, 1],
            ),
          ),
        );
      },
    );
  }
}
