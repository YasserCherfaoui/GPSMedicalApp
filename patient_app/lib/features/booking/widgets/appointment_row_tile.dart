import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../../discovery/utils/specialty_display.dart';
import '../utils/booking_enums.dart';
import 'mode_badge.dart';
import 'status_pill.dart';

class AppointmentRowTile extends StatelessWidget {
  const AppointmentRowTile({
    required this.appointment,
    required this.doctor,
    required this.onTap,
    super.key,
  });

  final Appointment appointment;
  final Doctor doctor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final languageCode = Localizations.localeOf(context).languageCode;
    final start = appointment.startAt?.toLocal();
    final dateStr = start != null
        ? DateFormat.yMMMd(languageCode).add_Hm().format(start)
        : '';
    final name = '${doctor.title ?? 'Dr.'} ${doctor.fullName ?? ''}';
    final specialty = doctor.specialties?.isNotEmpty == true
        ? specialtyDisplayName(doctor.specialties!.first, languageCode)
        : '';
    final fee = appointment.feeDzd ?? doctor.consultationFeeDzd;

    return Card(
      margin: const EdgeInsets.only(bottom: GpsSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(GpsRadii.md),
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GpsDoctorPhoto(
                size: 56,
                imageUrl: doctor.photoUrl,
                shape: GpsDoctorPhotoShape.circle,
              ),
              const SizedBox(width: GpsSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (specialty.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        specialty,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    const SizedBox(height: GpsSpacing.xs),
                    Text(dateStr, style: theme.textTheme.bodyMedium),
                    const SizedBox(height: GpsSpacing.xs),
                    Wrap(
                      spacing: GpsSpacing.xs,
                      runSpacing: GpsSpacing.xs,
                      children: [
                        if (appointment.mode != null)
                          ModeBadge(
                            mode: appointmentModeWire(appointment.mode),
                          ),
                        if (appointment.status != null)
                          StatusPill(
                            status: appointmentStatusWire(appointment.status),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (fee != null)
                Text(
                  '$fee DZD',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
