import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/medical_records_list.provider.dart';
import '../providers/medical_records_type_filter.provider.dart';
import '../utils/medical_record_display.dart';

class MedicalRecordsListScreen extends ConsumerStatefulWidget {
  const MedicalRecordsListScreen({super.key});

  @override
  ConsumerState<MedicalRecordsListScreen> createState() =>
      _MedicalRecordsListScreenState();
}

class _MedicalRecordsListScreenState
    extends ConsumerState<MedicalRecordsListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(medicalRecordsListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final selectedType = ref.watch(medicalRecordsTypeFilterProvider);
    final listAsync = ref.watch(medicalRecordsListProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.medicalRecordsTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(GpsRoutes.medicalRecordsUpload),
        icon: const Icon(Icons.upload_file_outlined),
        label: Text(l10n.medicalRecordsUpload),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(
              GpsSpacing.md,
              GpsSpacing.md,
              GpsSpacing.md,
              GpsSpacing.sm,
            ),
            child: Row(
              children: [
                for (final type in medicalRecordTypeFilters) ...[
                  FilterChip(
                    label: Text(medicalRecordTypeLabel(type, l10n)),
                    selected: selectedType == type,
                    selectedColor: colorScheme.primaryContainer,
                    onSelected: (selected) {
                      if (selected) {
                        ref
                            .read(medicalRecordsTypeFilterProvider.notifier)
                            .select(type);
                      }
                    },
                  ),
                  const SizedBox(width: GpsSpacing.sm),
                ],
              ],
            ),
          ),
          Expanded(
            child: listAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(l10n.medicalRecordsLoadError),
                    const SizedBox(height: GpsSpacing.md),
                    FilledButton(
                      onPressed: () => ref
                          .read(medicalRecordsListProvider.notifier)
                          .refresh(),
                      child: Text(l10n.retry),
                    ),
                  ],
                ),
              ),
              data: (state) {
                if (state.documents.isEmpty) {
                  return Center(child: Text(l10n.medicalRecordsEmpty));
                }

                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(medicalRecordsListProvider.notifier).refresh(),
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(
                      GpsSpacing.md,
                      GpsSpacing.sm,
                      GpsSpacing.md,
                      GpsSpacing.xxl,
                    ),
                    itemCount:
                        state.documents.length + (state.isLoadingMore ? 1 : 0),
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: GpsSpacing.sm),
                    itemBuilder: (context, index) {
                      if (index >= state.documents.length) {
                        return const Padding(
                          padding: EdgeInsets.all(GpsSpacing.md),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final document = state.documents[index];
                      final subtitle = [
                        medicalRecordAuthorRoleLabel(document.authorRole, l10n),
                        formatMedicalRecordDate(document.createdAt, locale),
                        formatMedicalRecordFileSize(document.fileSize, l10n),
                      ].where((part) => part.isNotEmpty).join(' · ');

                      return GpsCard(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            child: Icon(medicalRecordTypeIcon(document.type)),
                          ),
                          title: Text(document.title ?? ''),
                          subtitle: Text(subtitle),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: document.id == null
                              ? null
                              : () => context.push(
                                  GpsRoutes.medicalRecordDetail(document.id!),
                                ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
