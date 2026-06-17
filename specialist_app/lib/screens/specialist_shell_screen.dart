import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../features/appointments/providers/appointments.provider.dart';
import '../features/appointments/screens/appointments_calendar_screen.dart';
import '../features/appointments/screens/appointments_inbox_screen.dart';
import '../features/profile/screens/specialist_profile_hub_screen.dart';

class SpecialistShellScreen extends ConsumerStatefulWidget {
  const SpecialistShellScreen({super.key});

  @override
  ConsumerState<SpecialistShellScreen> createState() =>
      _SpecialistShellScreenState();
}

class _SpecialistShellScreenState extends ConsumerState<SpecialistShellScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pendingCountAsync = ref.watch(specialistPendingCountProvider);

    final labels = [
      l10n.specialistTabInbox,
      l10n.specialistTabCalendar,
      l10n.specialistTabMessages,
      l10n.specialistTabProfile,
      l10n.specialistTabStats,
    ];

    final bodies = [
      const AppointmentsInboxScreen(),
      const AppointmentsCalendarScreen(),
      Center(child: Text(l10n.specialistShellPlaceholder)),
      const SpecialistProfileHubScreen(),
      Center(child: Text(l10n.specialistShellPlaceholder)),
    ];

    final pendingCount = pendingCountAsync.valueOrNull ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text(labels[_index])),
      body: bodies[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: [
          NavigationDestination(
            icon: Badge(
              isLabelVisible: pendingCount > 0,
              label: Text(pendingCount > 99 ? '99+' : '$pendingCount'),
              child: const Icon(Icons.inbox_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: pendingCount > 0,
              label: Text(pendingCount > 99 ? '99+' : '$pendingCount'),
              child: const Icon(Icons.inbox),
            ),
            label: l10n.specialistTabInbox,
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_month_outlined),
            label: l10n.specialistTabCalendar,
          ),
          NavigationDestination(
            icon: const Icon(Icons.chat_bubble_outline),
            label: l10n.specialistTabMessages,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            label: l10n.specialistTabProfile,
          ),
          NavigationDestination(
            icon: const Icon(Icons.insights_outlined),
            label: l10n.specialistTabStats,
          ),
        ],
      ),
    );
  }
}
