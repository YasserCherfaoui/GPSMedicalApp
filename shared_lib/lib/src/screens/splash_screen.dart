import 'package:flutter/material.dart';

import '../l10n/auth_strings.dart';
import '../models/app_info.dart';
import '../theme/gps_brand.dart';
import '../theme/gps_colors.dart';
import '../theme/gps_spacing.dart';
import '../widgets/gps_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.appInfo, super.key});

  final GpsMedicalAppInfo appInfo;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [theme.colorScheme.surface, GpsColors.surfaceDim],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GpsLogo(size: 88),
              const SizedBox(height: GpsSpacing.md),
              Text(
                GpsBrand.splashTitle,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: GpsSpacing.sm),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.xl),
                child: Text(
                  strings.splashSubtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(height: GpsSpacing.xl),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
