import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../medical_records/providers/medical_records_list.provider.dart';
import '../../medical_records/utils/medical_record_display.dart';

Future<List<String>?> showMedicalRecordPickerSheet(BuildContext context) {
  return showModalBottomSheet<List<String>>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => const _MedicalRecordPickerSheet(),
  );
}

class _MedicalRecordPickerSheet extends ConsumerStatefulWidget {
  const _MedicalRecordPickerSheet();

  @override
  ConsumerState<_MedicalRecordPickerSheet> createState() =>
      _MedicalRecordPickerSheetState();
}

class _MedicalRecordPickerSheetState
    extends ConsumerState<_MedicalRecordPickerSheet> {
  final _selected = <String>{};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final listAsync = ref.watch(medicalRecordsListProvider);

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(GpsSpacing.md),
              child: Text(
                l10n.messagingPickAttachments,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: listAsync.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (_, __) => Center(
                  child: Text(l10n.medicalRecordsLoadError),
                ),
                data: (state) {
                  if (state.documents.isEmpty) {
                    return Center(child: Text(l10n.medicalRecordsEmpty));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GpsSpacing.md,
                    ),
                    itemCount: state.documents.length,
                    itemBuilder: (context, index) {
                      final document = state.documents[index];
                      final id = document.id;
                      if (id == null) return const SizedBox.shrink();

                      final selected = _selected.contains(id);
                      return CheckboxListTile(
                        value: selected,
                        onChanged: (checked) {
                          setState(() {
                            if (checked == true) {
                              _selected.add(id);
                            } else {
                              _selected.remove(id);
                            }
                          });
                        },
                        secondary: Icon(medicalRecordTypeIcon(document.type)),
                        title: Text(document.title ?? ''),
                        subtitle: Text(
                          medicalRecordTypeLabel(document.type, l10n),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(GpsSpacing.md),
              child: FilledButton(
                onPressed: _selected.isEmpty
                    ? null
                    : () => Navigator.pop(context, _selected.toList()),
                child: Text(l10n.messagingAttachConfirm),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
