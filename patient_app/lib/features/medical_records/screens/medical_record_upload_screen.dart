import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:image_picker/image_picker.dart';

import '../../booking/providers/dependents_list.provider.dart';
import '../providers/medical_records_list.provider.dart';
import '../providers/medical_records_repositories.provider.dart';
import '../utils/medical_record_display.dart';
import '../utils/medical_record_validation.dart';
import '../utils/medical_records_api_error.dart';

enum _UploadFileStatus { pending, uploading, done, failed, cancelled }

class _PendingUploadFile {
  _PendingUploadFile({
    required this.id,
    required this.fileName,
    required this.bytes,
    required this.mimeType,
  });

  final String id;
  final String fileName;
  final Uint8List bytes;
  final String mimeType;
  _UploadFileStatus status = _UploadFileStatus.pending;
  double progress = 0;
  String? errorMessage;
  CancelToken? cancelToken;
}

class MedicalRecordUploadScreen extends ConsumerStatefulWidget {
  const MedicalRecordUploadScreen({super.key});

  @override
  ConsumerState<MedicalRecordUploadScreen> createState() =>
      _MedicalRecordUploadScreenState();
}

class _MedicalRecordUploadScreenState
    extends ConsumerState<MedicalRecordUploadScreen> {
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();
  final _imagePicker = ImagePicker();
  final _pendingFiles = <_PendingUploadFile>[];
  MedicalDocumentTypeEnum? _type;
  String? _selectedDependentId;
  Map<String, String> _fieldErrors = {};
  bool _submitting = false;
  int _nextFileId = 0;

  @override
  void dispose() {
    for (final file in _pendingFiles) {
      file.cancelToken?.cancel();
    }
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  int get _remainingSlots =>
      medicalRecordMaxFilesPerSession - _pendingFiles.length;

  void _setStateSafe(VoidCallback fn) {
    if (!mounted) return;
    setState(fn);
  }

  Future<void> _addValidatedFile({
    required String fileName,
    required Uint8List bytes,
  }) async {
    final l10n = AppLocalizations.of(context)!;
    final validationError = validateMedicalRecordFileBytes(
      bytes: bytes,
      l10n: l10n,
    );
    if (validationError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validationError)),
      );
      return;
    }
    final mime = detectMedicalRecordMimeType(bytes)!;
    _setStateSafe(() {
      _pendingFiles.add(
        _PendingUploadFile(
          id: 'local-${_nextFileId++}',
          fileName: fileName,
          bytes: bytes,
          mimeType: mime,
        ),
      );
      _fieldErrors = Map.from(_fieldErrors)..remove('file');
    });
  }

  Future<void> _pickFromCamera() async {
    if (_remainingSlots <= 0) return;
    final image = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );
    if (image == null) return;
    final bytes = await image.readAsBytes();
    await _addValidatedFile(
      fileName: image.name,
      bytes: bytes,
    );
  }

  Future<void> _pickFromGallery() async {
    if (_remainingSlots <= 0) return;
    final images = await _imagePicker.pickMultiImage(imageQuality: 85);
    for (final image in images.take(_remainingSlots)) {
      final bytes = await image.readAsBytes();
      await _addValidatedFile(fileName: image.name, bytes: bytes);
      if (_remainingSlots <= 0) break;
    }
  }

  Future<void> _pickPdfFiles() async {
    if (_remainingSlots <= 0) return;
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
      allowMultiple: true,
      withData: true,
    );
    if (result == null) return;
    for (final file in result.files.take(_remainingSlots)) {
      final bytes = file.bytes;
      if (bytes == null) continue;
      await _addValidatedFile(
        fileName: file.name,
        bytes: bytes,
      );
      if (_remainingSlots <= 0) break;
    }
  }

  void _removeFile(_PendingUploadFile file) {
    file.cancelToken?.cancel();
    _setStateSafe(() {
      _pendingFiles.remove(file);
    });
  }

  Future<void> _submit(AppLocalizations l10n) async {
    final clientErrors = validateMedicalRecordUploadForm(
      type: _type,
      title: _titleController.text,
      notes: _notesController.text,
      files: _pendingFiles.map((f) => f.bytes).toList(),
      l10n: l10n,
    );
    if (clientErrors.isNotEmpty) {
      _setStateSafe(() => _fieldErrors = clientErrors);
      return;
    }

    _setStateSafe(() {
      _submitting = true;
      _fieldErrors = {};
    });

    final repo = ref.read(medicalRecordsRepositoryProvider);
    final title = _titleController.text.trim();
    final notes = _notesController.text.trim();
    var storageUnavailable = false;
    var uploadedCount = 0;

    for (final file in _pendingFiles) {
      if (file.status == _UploadFileStatus.done ||
          file.status == _UploadFileStatus.cancelled) {
        continue;
      }

      file.cancelToken = CancelToken();
      _setStateSafe(() {
        file.status = _UploadFileStatus.uploading;
        file.progress = 0;
        file.errorMessage = null;
      });

      try {
        final document = await repo.upload(
          bytes: file.bytes,
          fileName: file.fileName,
          mimeType: file.mimeType,
          type: _type!,
          title: title.isEmpty ? null : title,
          notes: notes.isEmpty ? null : notes,
          cancelToken: file.cancelToken,
          onSendProgress: (sent, total) {
            if (total <= 0 || !mounted) return;
            _setStateSafe(() {
              file.progress = sent / total;
            });
          },
        );
        ref.read(medicalRecordsListProvider.notifier).prependDocument(document);
        _setStateSafe(() {
          file.status = _UploadFileStatus.done;
          file.progress = 1;
        });
        uploadedCount++;
      } on MedicalRecordsStorageUnavailableException {
        storageUnavailable = true;
        _setStateSafe(() {
          file.status = _UploadFileStatus.failed;
          file.errorMessage = l10n.medicalRecordUploadStorageUnavailable;
        });
        break;
      } on MedicalRecordsValidationException catch (e) {
        _setStateSafe(() {
          _fieldErrors = e.fieldErrors;
          file.status = _UploadFileStatus.failed;
          file.errorMessage = l10n.medicalRecordUploadFailed;
        });
        break;
      } on DioException catch (e) {
        if (CancelToken.isCancel(e)) {
          _setStateSafe(() {
            file.status = _UploadFileStatus.cancelled;
          });
          continue;
        }
        _setStateSafe(() {
          file.status = _UploadFileStatus.failed;
          file.errorMessage = l10n.medicalRecordUploadFailed;
        });
      } catch (_) {
        _setStateSafe(() {
          file.status = _UploadFileStatus.failed;
          file.errorMessage = l10n.medicalRecordUploadFailed;
        });
      }
    }

    _setStateSafe(() => _submitting = false);

    if (!mounted) return;

    if (storageUnavailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.medicalRecordUploadStorageUnavailable)),
      );
      return;
    }

    if (uploadedCount > 0 &&
        _pendingFiles.every(
          (f) =>
              f.status == _UploadFileStatus.done ||
              f.status == _UploadFileStatus.cancelled,
        )) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.medicalRecordUploadSuccess)),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dependentsAsync = ref.watch(dependentsListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.medicalRecordsUpload)),
      body: ListView(
        padding: const EdgeInsets.all(GpsSpacing.md),
        children: [
          DropdownButtonFormField<MedicalDocumentTypeEnum>(
            value: _type,
            decoration: InputDecoration(
              labelText: l10n.medicalRecordUploadType,
              errorText: _fieldErrors['type'],
            ),
            items: [
              for (final type in medicalRecordUploadTypes)
                DropdownMenuItem(
                  value: type,
                  child: Text(medicalRecordTypeLabel(type, l10n)),
                ),
            ],
            onChanged: _submitting
                ? null
                : (value) => _setStateSafe(() {
                      _type = value;
                      _fieldErrors = Map.from(_fieldErrors)..remove('type');
                    }),
          ),
          const SizedBox(height: GpsSpacing.md),
          TextField(
            controller: _titleController,
            enabled: !_submitting,
            maxLength: medicalRecordMaxTitleLength,
            decoration: InputDecoration(
              labelText: l10n.medicalRecordUploadTitle,
              errorText: _fieldErrors['title'],
            ),
          ),
          const SizedBox(height: GpsSpacing.sm),
          TextField(
            controller: _notesController,
            enabled: !_submitting,
            maxLength: medicalRecordMaxNotesLength,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: l10n.medicalRecordUploadNotes,
              errorText: _fieldErrors['notes'],
            ),
          ),
          const SizedBox(height: GpsSpacing.md),
          Text(
            l10n.medicalRecordUploadPatient,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: GpsSpacing.sm),
          RadioListTile<String?>(
            title: Text(l10n.bookingForMe),
            value: null,
            groupValue: _selectedDependentId,
            onChanged: _submitting
                ? null
                : (value) => _setStateSafe(() => _selectedDependentId = value),
          ),
          dependentsAsync.when(
            data: (dependents) => Column(
              children: [
                for (final dependent in dependents)
                  RadioListTile<String?>(
                    title: Text(dependent.fullName ?? ''),
                    value: dependent.id,
                    groupValue: _selectedDependentId,
                    onChanged: _submitting
                        ? null
                        : (value) =>
                            _setStateSafe(() => _selectedDependentId = value),
                  ),
              ],
            ),
            loading: () => const LinearProgressIndicator(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          const SizedBox(height: GpsSpacing.md),
          Text(
            l10n.medicalRecordUploadMaxFiles(medicalRecordMaxFilesPerSession),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          if (_fieldErrors['file'] != null) ...[
            const SizedBox(height: GpsSpacing.xs),
            Text(
              _fieldErrors['file']!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          const SizedBox(height: GpsSpacing.sm),
          Wrap(
            spacing: GpsSpacing.sm,
            runSpacing: GpsSpacing.sm,
            children: [
              OutlinedButton.icon(
                onPressed: _submitting || _remainingSlots <= 0
                    ? null
                    : _pickFromCamera,
                icon: const Icon(Icons.photo_camera_outlined),
                label: Text(l10n.medicalRecordsUploadAddCamera),
              ),
              OutlinedButton.icon(
                onPressed: _submitting || _remainingSlots <= 0
                    ? null
                    : _pickFromGallery,
                icon: const Icon(Icons.photo_library_outlined),
                label: Text(l10n.medicalRecordsUploadAddGallery),
              ),
              OutlinedButton.icon(
                onPressed: _submitting || _remainingSlots <= 0
                    ? null
                    : _pickPdfFiles,
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: Text(l10n.medicalRecordsUploadAddFiles),
              ),
            ],
          ),
          const SizedBox(height: GpsSpacing.md),
          for (final file in _pendingFiles) ...[
            GpsCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(file.fileName),
                    subtitle: Text(
                      formatMedicalRecordFileSize(file.bytes.length, l10n),
                    ),
                    trailing: file.status == _UploadFileStatus.uploading
                        ? IconButton(
                            tooltip: l10n.medicalRecordUploadCancel,
                            onPressed: () => file.cancelToken?.cancel(),
                            icon: const Icon(Icons.close),
                          )
                        : IconButton(
                            onPressed: _submitting
                                ? null
                                : () => _removeFile(file),
                            icon: const Icon(Icons.delete_outline),
                          ),
                  ),
                  if (file.status == _UploadFileStatus.uploading)
                    LinearProgressIndicator(value: file.progress),
                  if (file.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: GpsSpacing.xs),
                      child: Text(
                        file.errorMessage!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: GpsSpacing.sm),
          ],
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: FilledButton(
            onPressed: _submitting || _pendingFiles.isEmpty
                ? null
                : () => _submit(l10n),
            child: _submitting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l10n.medicalRecordUploadSubmit),
          ),
        ),
      ),
    );
  }
}
