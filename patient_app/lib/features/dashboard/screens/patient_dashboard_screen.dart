import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class PatientDashboardScreen extends StatelessWidget {
  const PatientDashboardScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore, color: colorScheme.primary),
            label: l10n.patientTabDiscover,
          ),
          NavigationDestination(
            icon: const Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map, color: colorScheme.primary),
            label: l10n.patientTabMap,
          ),
          NavigationDestination(
            icon: const Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long, color: colorScheme.primary),
            label: l10n.patientTabAppointments,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: colorScheme.primary),
            label: l10n.patientTabProfile,
          ),
        ],
      ),
    );
  }
}
