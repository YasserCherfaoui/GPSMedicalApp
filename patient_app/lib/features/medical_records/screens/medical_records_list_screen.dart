import 'dart:async';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:image_picker/image_picker.dart';

import '../models/medical_record_upload_draft.dart';
import '../providers/medical_records_list.provider.dart';
import '../providers/medical_records_type_filter.provider.dart';
import '../utils/medical_record_display.dart';
import '../utils/medical_record_validation.dart';

class MedicalRecordsListScreen extends ConsumerStatefulWidget {
  const MedicalRecordsListScreen({super.key});

  @override
  ConsumerState<MedicalRecordsListScreen> createState() =>
      _MedicalRecordsListScreenState();
}

class _MedicalRecordsListScreenState
    extends ConsumerState<MedicalRecordsListScreen> {
  final _scrollController = ScrollController();
  final _imagePicker = ImagePicker();

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

  Future<void> _showAddSheet() async {
    final l10n = AppLocalizations.of(context)!;
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: Text(l10n.medicalRecordsUploadAddGallery),
                subtitle: Text(l10n.medicalRecordsOcrGalleryHint),
                onTap: () {
                  Navigator.pop(ctx);
                  unawaited(_pickGalleryAndUpload());
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera_outlined),
                title: Text(l10n.medicalRecordsUploadAddCamera),
                onTap: () {
                  Navigator.pop(ctx);
                  unawaited(_pickCameraAndUpload());
                },
              ),
              ListTile(
                leading: const Icon(Icons.picture_as_pdf_outlined),
                title: Text(l10n.medicalRecordsUploadAddFiles),
                onTap: () {
                  Navigator.pop(ctx);
                  unawaited(_pickPdfAndUpload());
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_note_outlined),
                title: Text(l10n.medicalRecordsUploadForm),
                onTap: () {
                  Navigator.pop(ctx);
                  context.push(GpsRoutes.medicalRecordsUpload);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openUpload(MedicalRecordUploadDraft draft) async {
    if (!mounted) return;
    await context.push(GpsRoutes.medicalRecordsUpload, extra: draft);
  }

  Future<void> _pickGalleryAndUpload() async {
    final l10n = AppLocalizations.of(context)!;
    final images = await _imagePicker.pickMultiImage(imageQuality: 85);
    if (images.isEmpty) return;
    final files = <MedicalRecordPickedFile>[];
    for (final image in images.take(medicalRecordMaxFilesPerSession)) {
      final bytes = await image.readAsBytes();
      final err = validateMedicalRecordFileBytes(bytes: bytes, l10n: l10n);
      if (err != null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
        continue;
      }
      files.add(MedicalRecordPickedFile(fileName: image.name, bytes: bytes));
    }
    if (files.isEmpty) return;
    await _openUpload(
      MedicalRecordUploadDraft(
        files: files,
        preferredType: MedicalDocumentTypeEnum.imaging,
      ),
    );
  }

  Future<void> _pickCameraAndUpload() async {
    final l10n = AppLocalizations.of(context)!;
    final image = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );
    if (image == null) return;
    final bytes = await image.readAsBytes();
    final err = validateMedicalRecordFileBytes(bytes: bytes, l10n: l10n);
    if (err != null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
      return;
    }
    await _openUpload(
      MedicalRecordUploadDraft(
        files: [MedicalRecordPickedFile(fileName: image.name, bytes: bytes)],
        preferredType: MedicalDocumentTypeEnum.imaging,
      ),
    );
  }

  Future<void> _pickPdfAndUpload() async {
    final l10n = AppLocalizations.of(context)!;
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['pdf', 'jpg', 'jpeg', 'png'],
      allowMultiple: true,
      withData: true,
    );
    if (result == null || result.files.isEmpty) return;
    final files = <MedicalRecordPickedFile>[];
    for (final file in result.files.take(medicalRecordMaxFilesPerSession)) {
      final bytes = file.bytes;
      if (bytes == null) continue;
      final err = validateMedicalRecordFileBytes(bytes: bytes, l10n: l10n);
      if (err != null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
        continue;
      }
      files.add(
        MedicalRecordPickedFile(
          fileName: file.name,
          bytes: Uint8List.fromList(bytes),
        ),
      );
    }
    if (files.isEmpty) return;
    await _openUpload(
      MedicalRecordUploadDraft(
        files: files,
        preferredType: MedicalDocumentTypeEnum.report,
      ),
    );
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
        onPressed: () => unawaited(_showAddSheet()),
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
                    SecondaryButton(
                      label: l10n.retry,
                      onPressed: () => ref
                          .read(medicalRecordsListProvider.notifier)
                          .refresh(),
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
