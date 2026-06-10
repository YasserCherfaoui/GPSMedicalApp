import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/notification_preferences.provider.dart';
import '../utils/notification_display.dart';

class NotificationPreferencesScreen extends ConsumerWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final prefsAsync = ref.watch(notificationPreferencesControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.notificationsPreferencesTitle)),
      body: prefsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.notificationsLoadError),
              const SizedBox(height: GpsSpacing.md),
              FilledButton(
                onPressed: () =>
                    ref.invalidate(notificationPreferencesControllerProvider),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
        data: (prefs) {
          final reminderHours = reminderHoursBeforeValue(
            prefs.reminderHoursBefore,
          );

          Future<void> save(NotificationPreferences updated) async {
            try {
              await ref
                  .read(notificationPreferencesControllerProvider.notifier)
                  .save(updated);
            } catch (_) {
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.notificationsPrefSaveError)),
              );
            }
          }

          return ListView(
            padding: const EdgeInsets.all(GpsSpacing.md),
            children: [
              SwitchListTile(
                title: Text(l10n.notificationsPrefPush),
                value: prefs.pushEnabled ?? false,
                onChanged: (value) =>
                    save(prefs.rebuild((b) => b..pushEnabled = value)),
              ),
              SwitchListTile(
                title: Text(l10n.notificationsPrefSms),
                value: prefs.smsEnabled ?? false,
                onChanged: (value) =>
                    save(prefs.rebuild((b) => b..smsEnabled = value)),
              ),
              SwitchListTile(
                title: Text(l10n.notificationsPrefEmail),
                value: prefs.emailEnabled ?? false,
                onChanged: (value) =>
                    save(prefs.rebuild((b) => b..emailEnabled = value)),
              ),
              SwitchListTile(
                title: Text(l10n.notificationsPrefAppointmentReminders),
                value: prefs.appointmentReminders ?? false,
                onChanged: (value) =>
                    save(prefs.rebuild((b) => b..appointmentReminders = value)),
              ),
              SwitchListTile(
                title: Text(l10n.notificationsPrefMarketing),
                value: prefs.marketing ?? false,
                onChanged: (value) =>
                    save(prefs.rebuild((b) => b..marketing = value)),
              ),
              const SizedBox(height: GpsSpacing.md),
              Text(
                l10n.notificationsPrefReminderHours,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: GpsSpacing.sm),
              Wrap(
                spacing: GpsSpacing.sm,
                children: [
                  for (final hours in const [1, 2, 6, 12, 24])
                    ChoiceChip(
                      label: Text(
                        l10n.notificationsPrefReminderHoursValue(hours),
                      ),
                      selected: reminderHours == hours,
                      onSelected: (selected) {
                        if (!selected) return;
                        save(
                          prefs.rebuild(
                            (b) => b.reminderHoursBefore =
                                reminderHoursBeforeEnum(hours),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
