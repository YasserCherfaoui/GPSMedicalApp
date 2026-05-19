import 'package:flutter/material.dart';

/// Corner radii from `docs/DESIGN-GPS-Medical.md`.
abstract final class GpsRadii {
  static const double sm = 4;
  static const double md = 8;
  static const double lg = 12;
  static const double xl = 16;
  static const double xxl = 24;
  static const double full = 9999;

  static BorderRadius get card => BorderRadius.circular(xl);
  static BorderRadius get button => BorderRadius.circular(lg);
  static BorderRadius get input => BorderRadius.circular(md);
  static BorderRadius get chip => BorderRadius.circular(sm);
}
