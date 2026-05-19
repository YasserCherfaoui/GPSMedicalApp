import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../l10n/auth_strings.dart';
import '../models/app_info.dart';
import '../routing/gps_routes.dart';
import '../theme/gps_spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.appInfo, super.key});

  final GpsMedicalAppInfo appInfo;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigateTimer;

  @override
  void initState() {
    super.initState();
    _navigateTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(GpsRoutes.language);
      }
    });
  }

  @override
  void dispose() {
    _navigateTimer?.cancel();
    super.dispose();
  }

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
            colors: [
              theme.colorScheme.surface,
              theme.colorScheme.surfaceContainerLowest,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.medical_services_outlined,
                size: 72,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: GpsSpacing.md),
              Text(
                'GPS MÉDICAL',
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
