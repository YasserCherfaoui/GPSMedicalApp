import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/dependents_list.provider.dart';
import '../../booking/utils/booking_api_error.dart';
import '../utils/dependent_display.dart';

class DependentFormScreen extends ConsumerStatefulWidget {
  const DependentFormScreen({this.dependentId, super.key});

  final String? dependentId;

  bool get isEdit => dependentId != null;

  @override
  ConsumerState<DependentFormScreen> createState() =>
      _DependentFormScreenState();
}

class _DependentFormScreenState extends ConsumerState<DependentFormScreen> {
  final _fullNameController = TextEditingController();
  Date? _birthDate;
  DependentCreateRelationEnum? _relation;
  DependentCreateGenderEnum? _gender;
  Map<String, String> _fieldErrors = {};
  bool _saving = false;
  bool _seeded = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  void _seedFromDependent(Dependent dependent) {
    if (_seeded || !widget.isEdit) return;
    _seeded = true;
    _fullNameController.text = dependent.fullName ?? '';
    _birthDate = dependent.birthDate;
    _relation = toCreateRelation(dependent.relation);
    _gender = toCreateGender(dependent.gender);
  }

  Future<void> _pickBirthDate(AppLocalizations l10n) async {
    final now = DateTime.now();
    final initial = _birthDate == null
        ? DateTime(now.year - 10, now.month, now.day)
        : DateTime(_birthDate!.year, _birthDate!.month, _birthDate!.day);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial.isAfter(now) ? now : initial,
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

  Future<void> _save(AppLocalizations l10n) async {
    final clientErrors = validateDependentForm(
      fullName: _fullNameController.text,
      birthDate: _birthDate,
      l10n: l10n,
    );
    if (_relation == null) {
      clientErrors['relation'] = l10n.profileNotSet;
    }
    if (_gender == null) {
      clientErrors['gender'] = l10n.profileNotSet;
    }
    if (clientErrors.isNotEmpty) {
      setState(() => _fieldErrors = clientErrors);
      return;
    }

    final payload = DependentCreate(
      (b) => b
        ..fullName = _fullNameController.text.trim()
        ..relation = _relation!
        ..birthDate = _birthDate!
        ..gender = _gender!,
    );

    setState(() {
      _saving = true;
      _fieldErrors = {};
    });

    try {
      final notifier = ref.read(dependentsListProvider.notifier);
      if (widget.isEdit) {
        await notifier.updateDependent(
          dependentId: widget.dependentId!,
          payload: payload,
        );
      } else {
        await notifier.create(payload);
      }
      if (!mounted) return;
      context.pop();
    } on BookingValidationException catch (e) {
      setState(() => _fieldErrors = e.fieldErrors);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.dependentSaveError)));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final dependentsAsync = ref.watch(dependentsListProvider);

    Dependent? existing;
    if (widget.isEdit) {
      existing = dependentsAsync.valueOrNull
          ?.where((d) => d.id == widget.dependentId)
          .firstOrNull;
      if (existing != null) _seedFromDependent(existing);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? l10n.dependentsEdit : l10n.dependentsAdd),
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
      body: widget.isEdit && dependentsAsync.isLoading && existing == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(GpsSpacing.md),
              children: [
                GpsTextField(
                  controller: _fullNameController,
                  label: l10n.dependentFullName,
                  errorText: _fieldErrors['full_name'],
                  onChanged: (_) => setState(
                    () =>
                        _fieldErrors = Map.from(_fieldErrors)
                          ..remove('full_name'),
                  ),
                ),
                const SizedBox(height: GpsSpacing.md),
                DropdownButtonFormField<DependentCreateRelationEnum>(
                  value: _relation,
                  decoration: InputDecoration(
                    labelText: l10n.dependentRelation,
                    errorText: _fieldErrors['relation'],
                  ),
                  items: [
                    for (final value in DependentCreateRelationEnum.values)
                      DropdownMenuItem(
                        value: value,
                        child: Text(dependentCreateRelationLabel(value, l10n)),
                      ),
                  ],
                  onChanged: (value) => setState(() {
                    _relation = value;
                    _fieldErrors = Map.from(_fieldErrors)..remove('relation');
                  }),
                ),
                const SizedBox(height: GpsSpacing.md),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.dependentBirthDate),
                  subtitle: Text(
                    _birthDate == null
                        ? l10n.profileNotSet
                        : formatDependentBirthDate(_birthDate, locale),
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
                DropdownButtonFormField<DependentCreateGenderEnum>(
                  value: _gender,
                  decoration: InputDecoration(
                    labelText: l10n.dependentGender,
                    errorText: _fieldErrors['gender'],
                  ),
                  items: [
                    DropdownMenuItem(
                      value: DependentCreateGenderEnum.male,
                      child: Text(l10n.profileGenderMale),
                    ),
                    DropdownMenuItem(
                      value: DependentCreateGenderEnum.female,
                      child: Text(l10n.profileGenderFemale),
                    ),
                  ],
                  onChanged: (value) => setState(() {
                    _gender = value;
                    _fieldErrors = Map.from(_fieldErrors)..remove('gender');
                  }),
                ),
              ],
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
