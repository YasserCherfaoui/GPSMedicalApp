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
    required this.onTap,
    this.doctor,
    this.clinic,
    this.subtitle,
    this.feeCurrency,
    super.key,
  }) : assert(
         doctor != null || clinic != null,
         'AppointmentRowTile requires a doctor or a clinic',
       );

  final Appointment appointment;
  final Doctor? doctor;
  final Clinic? clinic;
  final String? subtitle;

  /// Override for clinic service currency (`DZD` / `EUR`). When null, inferred
  /// from [clinic.countryCode] for clinic bookings, otherwise `DZD`.
  final String? feeCurrency;
  final VoidCallback onTap;

  bool get _isClinicBooking =>
      appointment.origin == AppointmentOriginEnum.clinicService ||
      clinic != null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final languageCode = Localizations.localeOf(context).languageCode;
    final start = appointment.startAt?.toLocal();
    final dateStr = start != null
        ? DateFormat.yMMMd(languageCode).add_Hm().format(start)
        : '';

    final doctorName = doctor == null
        ? null
        : '${doctor!.title ?? 'Dr.'} ${doctor!.fullName ?? ''}'.trim();
    final specialty = doctor?.specialties?.isNotEmpty == true
        ? specialtyDisplayName(doctor!.specialties!.first, languageCode)
        : null;

    final String name;
    final String secondary;
    if (_isClinicBooking) {
      name = clinic?.name?.trim().isNotEmpty == true
          ? clinic!.name!.trim()
          : (doctorName ?? '');
      if (doctorName != null && doctorName.isNotEmpty) {
        secondary = specialty != null && specialty.isNotEmpty
            ? '$doctorName · $specialty'
            : doctorName;
      } else {
        secondary = subtitle?.trim().isNotEmpty == true
            ? subtitle!.trim()
            : l10n.appointmentDetailAwaitingSpecialist;
      }
    } else {
      name = doctorName ?? '';
      secondary = specialty ?? subtitle ?? '';
    }

    final feeAmount = appointment.feeDzd ?? doctor?.consultationFeeDzd;
    final currency =
        feeCurrency ??
        (_isClinicBooking
            ? catalogCurrencyForCountryIso(clinic?.countryCode)
            : 'DZD');
    final feeLabel = feeAmount == null
        ? null
        : formatMoneyMajor(
            amount: feeAmount,
            currency: currency,
            languageCode: languageCode,
          );

    return Padding(
      padding: const EdgeInsets.only(bottom: GpsSpacing.sm),
      child: GpsCard(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isClinicBooking)
              CircleAvatar(
                radius: 28,
                backgroundColor: colorScheme.primaryContainer,
                child: Icon(
                  Icons.local_hospital_outlined,
                  color: colorScheme.onPrimaryContainer,
                ),
              )
            else
              GpsDoctorPhoto(
                size: 56,
                imageUrl: doctor?.photoUrl,
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
                  if (secondary.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      secondary,
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
                      if (_isClinicBooking)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: GpsSpacing.sm,
                            vertical: GpsSpacing.xs,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.tertiaryContainer.withValues(
                              alpha: 0.55,
                            ),
                            borderRadius: BorderRadius.circular(GpsRadii.full),
                          ),
                          child: Text(
                            l10n.appointmentDetailClinicBooking,
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onTertiaryContainer,
                            ),
                          ),
                        ),
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
            if (feeLabel != null)
              Text(
                feeLabel,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
