import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../discovery/providers/location_filter.provider.dart';
import '../../discovery/utils/geo_display.dart';
import '../../discovery/widgets/wilaya_commune_picker.dart';
import '../providers/patient_profile.provider.dart';
import '../utils/profile_api_error.dart';
import '../utils/profile_display.dart';
import '../utils/profile_validation.dart';
import '../widgets/tag_list_input.dart';

class PatientProfileEditScreen extends ConsumerStatefulWidget {
  const PatientProfileEditScreen({super.key});

  @override
  ConsumerState<PatientProfileEditScreen> createState() =>
      _PatientProfileEditScreenState();
}

class _PatientProfileEditScreenState
    extends ConsumerState<PatientProfileEditScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _line1Controller = TextEditingController();
  final _line2Controller = TextEditingController();
  final _postalController = TextEditingController();

  Date? _birthDate;
  PatientUpdateGenderEnum? _gender;
  PatientUpdateBloodTypeEnum? _bloodType;
  List<String> _allergies = [];
  List<String> _chronicConditions = [];
  Map<String, String> _fieldErrors = {};
  bool _saving = false;
  bool _seeded = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _line1Controller.dispose();
    _line2Controller.dispose();
    _postalController.dispose();
    super.dispose();
  }

  void _seedFromPatient(Patient patient) {
    if (_seeded) return;
    _seeded = true;
    _fullNameController.text = patient.fullName ?? '';
    _emailController.text = patient.email ?? '';
    _birthDate = patient.birthDate;
    _gender = toUpdateGender(patient.gender);
    _bloodType = toUpdateBloodType(patient.bloodType);
    _allergies = patient.allergies?.toList() ?? [];
    _chronicConditions = patient.chronicConditions?.toList() ?? [];
    _line1Controller.text = patient.address?.line1 ?? '';
    _line2Controller.text = patient.address?.line2 ?? '';
    _postalController.text = patient.address?.postalCode ?? '';
    _seedLocationFilter(patient.address);
  }

  Future<void> _seedLocationFilter(Address? address) async {
    final wilayaCode = address?.wilayaCode;
    if (wilayaCode == null) return;
    final wilayas = await ref.read(wilayasFetchProvider.future);
    final wilaya = wilayas.where((w) => w.code == wilayaCode).firstOrNull;
    if (wilaya == null) return;

    ref.read(locationFilterProvider.notifier).selectWilaya(wilaya);
    final communeId = address?.communeId;
    final wilayaCodeValue = wilaya.code;
    if (communeId != null) {
      final communes = await ref
          .read(communesFetchProvider.notifier)
          .fetchForWilaya(wilayaCodeValue);
      final commune = communes.where((c) => c.id == communeId).firstOrNull;
      if (commune != null) {
        ref.read(locationFilterProvider.notifier).selectCommune(commune);
      }
    }
  }

  Future<void> _pickBirthDate(AppLocalizations l10n) async {
    final now = DateTime.now();
    final initial = _birthDate == null
        ? DateTime(now.year - 30, now.month, now.day)
        : DateTime(_birthDate!.year, _birthDate!.month, _birthDate!.day);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: l10n.profilePickBirthDate,
    );
    if (picked == null) return;
    setState(() {
      _birthDate = Date(picked.year, picked.month, picked.day);
      _fieldErrors = Map.from(_fieldErrors)..remove('birth_date');
    });
  }

  Future<void> _openAddressPicker(AppLocalizations l10n) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(ctx).bottom,
            ),
            child: SizedBox(
              height: MediaQuery.sizeOf(ctx).height * 0.75,
              child: WilayaCommunePicker(
                closeOnWilayaPick: true,
                onLocationChanged: (wilaya, commune) {
                  if (commune != null) Navigator.pop(ctx);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  String _addressSummary(AppLocalizations l10n) {
    final filter = ref.read(locationFilterProvider);
    final locale = Localizations.localeOf(context).languageCode;
    final wilaya = filter.selectedWilaya;
    final commune = filter.selectedCommune;
    if (wilaya == null) return l10n.profileNotSet;
    final wilayaName = wilayaDisplayName(wilaya, locale);
    if (commune == null) return wilayaName;
    return '${communeDisplayName(commune, locale)}, $wilayaName';
  }

  Future<void> _save(AppLocalizations l10n) async {
    final clientErrors = validateProfileForm(
      fullName: _fullNameController.text,
      email: _emailController.text,
      birthDate: _birthDate,
      l10n: l10n,
    );
    if (clientErrors.isNotEmpty) {
      setState(() => _fieldErrors = clientErrors);
      return;
    }

    final filter = ref.read(locationFilterProvider);
    final wilaya = filter.selectedWilaya;
    final commune = filter.selectedCommune;
    final locale = Localizations.localeOf(context).languageCode;

    final update = PatientUpdate((b) {
      b
        ..fullName = _fullNameController.text.trim()
        ..email = _emailController.text.trim().isEmpty
            ? null
            : _emailController.text.trim()
        ..birthDate = _birthDate
        ..gender = _gender
        ..bloodType = _bloodType
        ..allergies = ListBuilder(_allergies)
        ..chronicConditions = ListBuilder(_chronicConditions);
      if (wilaya != null || _line1Controller.text.trim().isNotEmpty) {
        b.address.replace(
          Address(
            (a) => a
              ..line1 = _line1Controller.text.trim().isEmpty
                  ? null
                  : _line1Controller.text.trim()
              ..line2 = _line2Controller.text.trim().isEmpty
                  ? null
                  : _line2Controller.text.trim()
              ..postalCode = _postalController.text.trim().isEmpty
                  ? null
                  : _postalController.text.trim()
              ..wilayaCode = wilaya?.code
              ..wilayaName = wilaya == null
                  ? null
                  : wilayaDisplayName(wilaya, locale)
              ..communeId = commune?.id
              ..communeName = commune == null
                  ? null
                  : communeDisplayName(commune, locale),
          ),
        );
      }
    });

    setState(() {
      _saving = true;
      _fieldErrors = {};
    });

    try {
      await ref.read(patientProfileProvider.notifier).patchProfile(update);
      if (!mounted) return;
      context.pop();
    } on ProfileValidationException catch (e) {
      setState(() => _fieldErrors = e.fieldErrors);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.profileSaveError)));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final profileAsync = ref.watch(patientProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profileEdit),
        actions: [
          TextButton(
            onPressed: _saving ? null : () => _save(l10n),
            child: _saving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l10n.profileSave),
          ),
        ],
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.profileLoadError)),
        data: (patient) {
          _seedFromPatient(patient);
          final locationFilter = ref.watch(locationFilterProvider);

          return ListView(
            padding: const EdgeInsets.all(GpsSpacing.md),
            children: [
              GpsTextField(
                controller: _fullNameController,
                label: l10n.profileFullName,
                errorText: _fieldErrors['full_name'],
                onChanged: (_) => setState(
                  () =>
                      _fieldErrors = Map.from(_fieldErrors)
                        ..remove('full_name'),
                ),
              ),
              const SizedBox(height: GpsSpacing.md),
              InputDecorator(
                decoration: InputDecoration(
                  labelText: l10n.profilePhone,
                  enabled: false,
                ),
                child: Text(patient.phone ?? '—'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: GpsSpacing.xs),
                child: Text(
                  l10n.profileReadOnlyField,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(height: GpsSpacing.md),
              GpsTextField(
                controller: _emailController,
                label: l10n.profileEmail,
                keyboardType: TextInputType.emailAddress,
                errorText: _fieldErrors['email'],
                onChanged: (_) => setState(
                  () => _fieldErrors = Map.from(_fieldErrors)..remove('email'),
                ),
              ),
              const SizedBox(height: GpsSpacing.md),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.profileBirthDate),
                subtitle: Text(
                  _birthDate == null
                      ? l10n.profileNotSet
                      : formatProfileBirthDate(_birthDate, locale),
                ),
                trailing: const Icon(Icons.calendar_today_outlined),
                onTap: () => _pickBirthDate(l10n),
              ),
              if (_fieldErrors['birth_date'] != null)
                Text(
                  _fieldErrors['birth_date']!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              const SizedBox(height: GpsSpacing.md),
              DropdownButtonFormField<PatientUpdateGenderEnum>(
                value: _gender,
                decoration: InputDecoration(labelText: l10n.profileGender),
                items: [
                  for (final value in PatientUpdateGenderEnum.values)
                    DropdownMenuItem(
                      value: value,
                      child: Text(profileUpdateGenderLabel(value, l10n)),
                    ),
                ],
                onChanged: (value) => setState(() => _gender = value),
              ),
              const SizedBox(height: GpsSpacing.md),
              DropdownButtonFormField<PatientUpdateBloodTypeEnum>(
                value: _bloodType,
                decoration: InputDecoration(
                  labelText: l10n.profileBloodType,
                  errorText: _fieldErrors['blood_type'],
                ),
                items: [
                  for (final value in profileBloodTypeOptions())
                    DropdownMenuItem(
                      value: value,
                      child: Text(profileBloodTypeWireLabel(value.name)),
                    ),
                ],
                onChanged: (value) => setState(() => _bloodType = value),
              ),
              const SizedBox(height: GpsSpacing.lg),
              Text(
                l10n.profileAddress,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: GpsSpacing.sm),
              GpsTextField(
                controller: _line1Controller,
                label: l10n.profileAddressLine1,
                errorText: _fieldErrors['address.line1'],
              ),
              const SizedBox(height: GpsSpacing.sm),
              GpsTextField(
                controller: _line2Controller,
                label: l10n.profileAddressLine2,
              ),
              const SizedBox(height: GpsSpacing.sm),
              GpsTextField(
                controller: _postalController,
                label: l10n.profilePostalCode,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: GpsSpacing.sm),
              OutlinedButton.icon(
                onPressed: () => _openAddressPicker(l10n),
                icon: const Icon(Icons.location_on_outlined),
                label: Text(
                  locationFilter.selectedWilaya == null
                      ? l10n.profilePickAddress
                      : _addressSummary(l10n),
                ),
              ),
              const SizedBox(height: GpsSpacing.lg),
              TagListInput(
                label: l10n.profileAllergies,
                hint: l10n.profileTagHint,
                addLabel: l10n.profileAddTag,
                tags: _allergies,
                errorText: _fieldErrors['allergies'],
                onChanged: (tags) => setState(() => _allergies = tags),
              ),
              const SizedBox(height: GpsSpacing.lg),
              TagListInput(
                label: l10n.profileChronicConditions,
                hint: l10n.profileTagHint,
                addLabel: l10n.profileAddTag,
                tags: _chronicConditions,
                errorText: _fieldErrors['chronic_conditions'],
                onChanged: (tags) => setState(() => _chronicConditions = tags),
              ),
            ],
          );
        },
      ),
    );
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull {
    final it = iterator;
    if (!it.moveNext()) return null;
    return it.current;
  }
}
