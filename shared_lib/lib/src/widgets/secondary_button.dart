import 'package:flutter/material.dart';

/// Secondary action — outlined, minimum 48px touch target.
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expand ? double.infinity : null,
      child: OutlinedButton(onPressed: onPressed, child: Text(label)),
    );
  }
}
