import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/patient_profile.provider.dart';
import '../utils/profile_display.dart';
import '../widgets/profile_field_row.dart';

class PatientProfileScreen extends ConsumerWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final profileAsync = ref.watch(patientProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profileTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: l10n.profileEdit,
            onPressed: () => context.push(GpsRoutes.profileEdit),
          ),
        ],
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Padding(
            padding: const EdgeInsets.all(GpsSpacing.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.profileLoadError),
                const SizedBox(height: GpsSpacing.md),
                FilledButton(
                  onPressed: () =>
                      ref.read(patientProfileProvider.notifier).refresh(),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (patient) => RefreshIndicator(
          onRefresh: () => ref.read(patientProfileProvider.notifier).refresh(),
          child: ListView(
            padding: const EdgeInsets.all(GpsSpacing.md),
            children: [
              GpsCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ProfileFieldRow(
                      label: l10n.profileFullName,
                      value: patient.fullName ?? '',
                    ),
                    ProfileFieldRow(
                      label: l10n.profilePhone,
                      value: patient.phone ?? '',
                    ),
                    ProfileFieldRow(
                      label: l10n.profileEmail,
                      value: patient.email ?? '',
                    ),
                    ProfileFieldRow(
                      label: l10n.profileBirthDate,
                      value: patient.birthDate == null
                          ? l10n.profileNotSet
                          : formatProfileBirthDate(patient.birthDate, locale),
                    ),
                    ProfileFieldRow(
                      label: l10n.profileGender,
                      value: profileGenderLabel(patient.gender, l10n),
                    ),
                    ProfileFieldRow(
                      label: l10n.profileBloodType,
                      value: patient.bloodType == null
                          ? l10n.profileNotSet
                          : profileBloodTypeLabel(patient.bloodType),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: GpsSpacing.md),
              GpsCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.profileAddress,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: GpsSpacing.sm),
                    ProfileFieldRow(
                      label: l10n.profileAddress,
                      value: patient.address == null
                          ? l10n.profileNotSet
                          : formatProfileAddress(patient.address, locale),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: GpsSpacing.md),
              GpsCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ProfileFieldRow(
                      label: l10n.profileAllergies,
                      value: patient.allergies == null ||
                              patient.allergies!.isEmpty
                          ? l10n.profileNotSet
                          : joinProfileTags(patient.allergies),
                    ),
                    ProfileFieldRow(
                      label: l10n.profileChronicConditions,
                      value: patient.chronicConditions == null ||
                              patient.chronicConditions!.isEmpty
                          ? l10n.profileNotSet
                          : joinProfileTags(patient.chronicConditions),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: GpsSpacing.md),
              GpsCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.profileInsurance,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: GpsSpacing.sm),
                    ProfileFieldRow(
                      label: l10n.profileInsuranceProvider,
                      value: profileInsuranceProviderLabel(
                        patient.insurance?.provider,
                        l10n,
                      ),
                    ),
                    ProfileFieldRow(
                      label: l10n.profileInsuranceNumber,
                      value: patient.insurance?.number ?? l10n.profileNotSet,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: GpsSpacing.lg),
              ListTile(
                leading: const Icon(Icons.folder_copy_outlined),
                title: Text(l10n.medicalRecordsTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(GpsRoutes.medicalRecords),
              ),
              ListTile(
                leading: const Icon(Icons.family_restroom_outlined),
                title: Text(l10n.dependentsTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(GpsRoutes.profileDependents),
              ),
              ListTile(
                leading: const Icon(Icons.verified_user_outlined),
                title: Text(l10n.profileConsents),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(GpsRoutes.profileConsents),
              ),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: Text(l10n.profileAccount),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(GpsRoutes.profileAccount),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
