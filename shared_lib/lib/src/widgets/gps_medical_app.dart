import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../l10n/app_locale.dart';
import '../l10n/auth_strings.dart';
import '../l10n/generated/app_localizations.dart';
import '../l10n/locale_notifier.dart';
import '../theme/gps_theme.dart';
import 'design_system_showcase.dart';

/// Shared [MaterialApp.router] with locale, RTL, and auth localizations.
class GpsMedicalMaterialApp extends ConsumerWidget {
  const GpsMedicalMaterialApp({
    required this.title,
    required this.routerConfig,
    super.key,
  });

  final String title;
  final GoRouter routerConfig;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocale = ref.watch(appLocaleProvider);

    return MaterialApp.router(
      title: title,
      theme: GpsTheme.light(),
      darkTheme: GpsTheme.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      locale: appLocale.locale,
      supportedLocales: AppLocale.values.map((e) => e.locale),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        AuthStrings.delegate,
        FallbackMaterialLocalizationsDelegate(),
        FallbackCupertinoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: routerConfig,
      builder: (context, child) {
        final responsiveChild = ResponsiveBreakpoints.builder(
          child: child ?? const SizedBox.shrink(),
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );

        return Directionality(
          textDirection: appLocale.textDirection,
          child: DesignSystemShowcaseLauncher(
            router: routerConfig,
            child: responsiveChild,
          ),
        );
      },
    );
  }
}
