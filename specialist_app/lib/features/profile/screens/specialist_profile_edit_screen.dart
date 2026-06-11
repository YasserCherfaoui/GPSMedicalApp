import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../discovery/providers/location_filter.provider.dart';
import '../../discovery/providers/specialties.provider.dart';
import '../../discovery/utils/geo_display.dart';
import '../../discovery/utils/specialty_display.dart';
import '../../discovery/widgets/specialties_picker.dart';
import '../../discovery/widgets/wilaya_commune_picker.dart';
import '../providers/specialist_profile.provider.dart';
import '../repositories/specialist_profile_repository.dart';
import '../utils/doctor_language_display.dart';
import '../utils/profile_api_error.dart';

class SpecialistProfileEditScreen extends ConsumerStatefulWidget {
  const SpecialistProfileEditScreen({super.key});

  @override
  ConsumerState<SpecialistProfileEditScreen> createState() =>
      _SpecialistProfileEditScreenState();
}

class _SpecialistProfileEditScreenState
    extends ConsumerState<SpecialistProfileEditScreen> {
  final _titleController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _bioController = TextEditingController();
  final _feeController = TextEditingController();
  final _photoUrlController = TextEditingController();
  final _line1Controller = TextEditingController();
  final _line2Controller = TextEditingController();
  final _bookingWindowController = TextEditingController();

  String? _selectedSpecialtyId;
  final Set<DoctorLanguagesEnum> _languages = {};
  bool _acceptsCnas = false;
  bool _acceptsCasnos = false;
  bool _offersTelehealth = false;
  DoctorUpdateConfirmationPolicyEnum _confirmationPolicy =
      DoctorUpdateConfirmationPolicyEnum.manual;
  Map<String, String> _fieldErrors = {};
  bool _saving = false;
  bool _seeded = false;

  static const _bioMaxLength = 2000;

  @override
  void dispose() {
    _titleController.dispose();
    _fullNameController.dispose();
    _bioController.dispose();
    _feeController.dispose();
    _photoUrlController.dispose();
    _line1Controller.dispose();
    _line2Controller.dispose();
    _bookingWindowController.dispose();
    super.dispose();
  }

  void _seedFromProfile(DoctorPrivate profile) {
    if (_seeded) return;
    _seeded = true;

    _titleController.text = profile.title ?? '';
    _fullNameController.text = profile.fullName ?? '';
    _bioController.text = profile.bio ?? '';
    _feeController.text = '${profile.consultationFeeDzd ?? 0}';
    _photoUrlController.text = profile.photoUrl ?? '';
    _bookingWindowController.text = '${profile.bookingWindowDays ?? 30}';
    _selectedSpecialtyId = profile.specialties?.firstOrNull?.id;
    _languages
      ..clear()
      ..addAll(profile.languages ?? const <DoctorLanguagesEnum>[]);
    _acceptsCnas = profile.acceptsCnas ?? false;
    _acceptsCasnos = profile.acceptsCasnos ?? false;
    _offersTelehealth = profile.offersTelehealth ?? false;
    _confirmationPolicy = profile.confirmationPolicy ==
            DoctorPrivateConfirmationPolicyEnum.auto
        ? DoctorUpdateConfirmationPolicyEnum.auto
        : DoctorUpdateConfirmationPolicyEnum.manual;

    final addr = profile.practiceAddress;
    _line1Controller.text = addr?.line1 ?? '';
    _line2Controller.text = addr?.line2 ?? '';
    _seedLocationFilter(addr);
  }

  Future<void> _seedLocationFilter(Address? address) async {
    final wilayaCode = address?.wilayaCode;
    if (wilayaCode == null) return;
    final wilayas = await ref.read(wilayasFetchProvider.future);
    final wilaya = wilayas.where((w) => w.code == wilayaCode).firstOrNull;
    if (wilaya == null) return;

    ref.read(locationFilterProvider.notifier).selectWilaya(wilaya);
    final communeId = address?.communeId;
    if (communeId != null) {
      final communes = await ref
          .read(communesFetchProvider.notifier)
          .fetchForWilaya(wilaya.code);
      final commune = communes.where((c) => c.id == communeId).firstOrNull;
      if (commune != null) {
        ref.read(locationFilterProvider.notifier).selectCommune(commune);
      }
    }
  }

  Future<void> _openSpecialtyPicker(AppLocalizations l10n) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.sizeOf(ctx).height * 0.75,
            child: SpecialtiesPicker(
              selectedSpecialtyId: _selectedSpecialtyId,
              onSpecialtySelected: (specialty) {
                setState(() {
                  _selectedSpecialtyId = specialty.id;
                  _fieldErrors = Map.from(_fieldErrors)..remove('specialty_ids');
                });
                Navigator.pop(ctx);
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _openAddressPicker() async {
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
    final filter = ref.read(locationFilterProvider);
    final locale = Localizations.localeOf(context).languageCode;
    final wilaya = filter.selectedWilaya;
    final commune = filter.selectedCommune;

    final fee = int.tryParse(_feeController.text.trim()) ?? 0;
    final bookingWindow = int.tryParse(_bookingWindowController.text.trim()) ?? 30;

    Address? practiceAddress;
    if (wilaya != null || _line1Controller.text.trim().isNotEmpty) {
      practiceAddress = Address(
        (a) => a
          ..line1 = _line1Controller.text.trim().isEmpty
              ? null
              : _line1Controller.text.trim()
          ..line2 = _line2Controller.text.trim().isEmpty
              ? null
              : _line2Controller.text.trim()
          ..wilayaCode = wilaya?.code
          ..wilayaName = wilaya == null
              ? null
              : wilayaDisplayName(wilaya, locale)
          ..communeId = commune?.id
          ..communeName = commune == null
              ? null
              : communeDisplayName(commune, locale),
      );
    }

    final repo = ref.read(specialistProfileRepositoryProvider);
    final body = repo.buildPatchBody(
      fullName: _fullNameController.text.trim(),
      title: _titleController.text.trim(),
      bio: _bioController.text.trim(),
      photoUrl: _photoUrlController.text.trim().isEmpty
          ? null
          : _photoUrlController.text.trim(),
      languages: _languages.map(toUpdateLanguage).toList(),
      consultationFeeDzd: fee,
      acceptsCnas: _acceptsCnas,
      acceptsCasnos: _acceptsCasnos,
      offersTelehealth: _offersTelehealth,
      practiceAddress: practiceAddress,
      confirmationPolicy: _confirmationPolicy,
      bookingWindowDays: bookingWindow,
      specialtyId: _selectedSpecialtyId,
    );

    setState(() {
      _saving = true;
      _fieldErrors = {};
    });

    try {
      await ref.read(specialistProfileProvider.notifier).patchRaw(body);
      if (!mounted) return;
      context.pop();
    } on ProfileValidationException catch (e) {
      setState(() => _fieldErrors = e.fieldErrors);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.profileSaveError)),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: GpsSpacing.lg, bottom: GpsSpacing.sm),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final profileAsync = ref.watch(specialistProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.specialistProfileEditTitle),
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
        data: (profile) {
          _seedFromProfile(profile);
          final specialtiesAsync = ref.watch(specialtiesProvider);
          final selectedSpecialtyName = specialtiesAsync.maybeWhen(
            data: (list) {
              final match = list
                  .where((s) => s.id == _selectedSpecialtyId)
                  .firstOrNull;
              return match == null
                  ? l10n.profileNotSet
                  : specialtyDisplayName(match, locale);
            },
            orElse: () => l10n.profileNotSet,
          );

          return ListView(
            padding: const EdgeInsets.all(GpsSpacing.md),
            children: [
              _sectionHeader(l10n.specialistProfileSectionInfo),
              GpsTextField(
                controller: _titleController,
                label: l10n.specialistProfileTitle,
                errorText: _fieldErrors['title'],
              ),
              const SizedBox(height: GpsSpacing.md),
              GpsTextField(
                controller: _fullNameController,
                label: l10n.profileFullName,
                errorText: _fieldErrors['full_name'],
              ),
              const SizedBox(height: GpsSpacing.md),
              GpsTextField(
                controller: _bioController,
                label: l10n.specialistProfileBio,
                maxLines: 4,
                maxLength: _bioMaxLength,
                errorText: _fieldErrors['bio'],
              ),
              const SizedBox(height: GpsSpacing.md),
              GpsTextField(
                controller: _photoUrlController,
                label: l10n.specialistProfilePhotoUrl,
                keyboardType: TextInputType.url,
                errorText: _fieldErrors['photo_url'],
              ),
              _sectionHeader(l10n.specialistProfileSectionSpecialties),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.specialistProfileSelectSpecialty),
                subtitle: Text(selectedSpecialtyName),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _openSpecialtyPicker(l10n),
              ),
              if (_fieldErrors['specialty_ids'] != null)
                Text(
                  _fieldErrors['specialty_ids']!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              _sectionHeader(l10n.specialistProfileSectionLanguages),
              Wrap(
                spacing: GpsSpacing.sm,
                children: [
                  for (final lang in DoctorLanguagesEnum.values)
                    FilterChip(
                      label: Text(doctorLanguageLabel(lang, l10n)),
                      selected: _languages.contains(lang),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _languages.add(lang);
                          } else {
                            _languages.remove(lang);
                          }
                          _fieldErrors = Map.from(_fieldErrors)
                            ..remove('languages');
                        });
                      },
                    ),
                ],
              ),
              _sectionHeader(l10n.specialistProfileSectionConsultation),
              GpsTextField(
                controller: _feeController,
                label: l10n.specialistProfileFee,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                errorText: _fieldErrors['consultation_fee_dzd'],
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.specialistProfileCnas),
                value: _acceptsCnas,
                onChanged: (v) => setState(() => _acceptsCnas = v),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.specialistProfileCasnos),
                value: _acceptsCasnos,
                onChanged: (v) => setState(() => _acceptsCasnos = v),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.specialistProfileTelehealth),
                value: _offersTelehealth,
                onChanged: (v) => setState(() => _offersTelehealth = v),
              ),
              DropdownButtonFormField<DoctorUpdateConfirmationPolicyEnum>(
                value: _confirmationPolicy,
                decoration: InputDecoration(
                  labelText: l10n.specialistProfileConfirmationPolicy,
                ),
                items: [
                  DropdownMenuItem(
                    value: DoctorUpdateConfirmationPolicyEnum.manual,
                    child: Text(l10n.specialistProfilePolicyManual),
                  ),
                  DropdownMenuItem(
                    value: DoctorUpdateConfirmationPolicyEnum.auto,
                    child: Text(l10n.specialistProfilePolicyAuto),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => _confirmationPolicy = value);
                },
              ),
              const SizedBox(height: GpsSpacing.md),
              GpsTextField(
                controller: _bookingWindowController,
                label: l10n.specialistProfileBookingWindow,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                errorText: _fieldErrors['booking_window_days'],
              ),
              _sectionHeader(l10n.specialistProfileSectionPractice),
              GpsTextField(
                controller: _line1Controller,
                label: l10n.specialistProfileAddressLine1,
                errorText: _fieldErrors['practice_address.line1'],
              ),
              const SizedBox(height: GpsSpacing.md),
              GpsTextField(
                controller: _line2Controller,
                label: l10n.specialistProfileAddressLine2,
              ),
              const SizedBox(height: GpsSpacing.md),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.geoWilayaPickerTitle),
                subtitle: Text(_addressSummary(l10n)),
                trailing: const Icon(Icons.place_outlined),
                onTap: _openAddressPicker,
              ),
              const SizedBox(height: GpsSpacing.xl),
            ],
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: PrimaryButton(
            label: l10n.specialistProfileSaveChanges,
            onPressed: _saving ? null : () => _save(l10n),
          ),
        ),
      ),
    );
  }
}
