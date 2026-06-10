import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class SpecialistShellScreen extends StatefulWidget {
  const SpecialistShellScreen({super.key});

  @override
  State<SpecialistShellScreen> createState() => _SpecialistShellScreenState();
}

class _SpecialistShellScreenState extends State<SpecialistShellScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final labels = [
      l10n.specialistTabInbox,
      l10n.specialistTabCalendar,
      l10n.specialistTabMessages,
      l10n.specialistTabProfile,
      l10n.specialistTabStats,
    ];

    return Scaffold(
      appBar: AppBar(title: Text(labels[_index])),
      body: Center(
        child: Text(
          l10n.specialistShellPlaceholder,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.inbox_outlined),
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
