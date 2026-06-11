import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routing/specialist_routes.dart';
import '../providers/credentials_repository.provider.dart';
import '../providers/doctor_credentials_profile.provider.dart';
import '../utils/credential_display.dart';
import '../utils/credential_validation.dart';
import '../utils/credentials_api_error.dart';

enum _UploadFileStatus { pending, uploading, done, failed }

class _PendingCredentialFile {
  _PendingCredentialFile({
    required this.id,
    required this.fileName,
    required this.bytes,
    required this.mimeType,
    required this.type,
  });

  final String id;
  final String fileName;
  final Uint8List bytes;
  final String mimeType;
  CredentialTypeEnum type;
  _UploadFileStatus status = _UploadFileStatus.pending;
  double progress = 0;
  String? errorMessage;
  CancelToken? cancelToken;
}

class CredentialsSubmissionScreen extends ConsumerStatefulWidget {
  const CredentialsSubmissionScreen({super.key});

  @override
  ConsumerState<CredentialsSubmissionScreen> createState() =>
      _CredentialsSubmissionScreenState();
}

class _CredentialsSubmissionScreenState
    extends ConsumerState<CredentialsSubmissionScreen> {
  final _councilController = TextEditingController();
  final _imagePicker = ImagePicker();
  final _pendingFiles = <_PendingCredentialFile>[];
  CredentialTypeEnum _selectedType = CredentialTypeEnum.councilCard;
  String? _councilError;
  String? _filesError;
  bool _submitting = false;
  int _nextFileId = 0;

  @override
  void dispose() {
    for (final file in _pendingFiles) {
      file.cancelToken?.cancel();
    }
    _councilController.dispose();
    super.dispose();
  }

  int get _remainingSlots =>
      credentialMaxFilesPerSession - _pendingFiles.length;

  void _setStateSafe(VoidCallback fn) {
    if (!mounted) return;
    setState(fn);
  }

  void _prefillCouncilNumber(DoctorPrivate? profile) {
    if (_councilController.text.isNotEmpty || profile == null) return;
    final council = profile.councilNumber?.trim();
    if (council != null && council.isNotEmpty && council != 'pending') {
      _councilController.text = council;
    }
  }

  Future<void> _addValidatedFile({
    required String fileName,
    required Uint8List bytes,
  }) async {
    final l10n = AppLocalizations.of(context)!;
    final validationError = validateCredentialFileBytes(
      bytes: bytes,
      l10n: l10n,
    );
    if (validationError != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(validationError)));
      return;
    }
    final mime = detectCredentialMimeType(bytes)!;
    _setStateSafe(() {
      _pendingFiles.add(
        _PendingCredentialFile(
          id: 'local-${_nextFileId++}',
          fileName: fileName,
          bytes: bytes,
          mimeType: mime,
          type: _selectedType,
        ),
      );
      _filesError = null;
    });
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
      await _addValidatedFile(fileName: file.name, bytes: bytes);
      if (_remainingSlots <= 0) break;
    }
  }

  Future<void> _submit(AppLocalizations l10n) async {
    final council = _councilController.text.trim();
    if (council.isEmpty) {
      _setStateSafe(
        () => _councilError = l10n.specialistCredentialsCouncilRequired,
      );
      return;
    }
    if (_pendingFiles.isEmpty) {
      _setStateSafe(() => _filesError = l10n.specialistCredentialsNoFiles);
      return;
    }

    _setStateSafe(() {
      _submitting = true;
      _councilError = null;
      _filesError = null;
    });

    final repo = ref.read(credentialsRepositoryProvider);
    var storageUnavailable = false;
    var uploadedCount = 0;

    for (final file in _pendingFiles) {
      if (file.status == _UploadFileStatus.done) continue;

      file.cancelToken = CancelToken();
      _setStateSafe(() {
        file.status = _UploadFileStatus.uploading;
        file.progress = 0;
        file.errorMessage = null;
      });

      try {
        await repo.upload(
          bytes: file.bytes,
          fileName: file.fileName,
          mimeType: file.mimeType,
          type: file.type,
          cancelToken: file.cancelToken,
          onSendProgress: (sent, total) {
            if (total <= 0 || !mounted) return;
            _setStateSafe(() => file.progress = sent / total);
          },
        );
        _setStateSafe(() {
          file.status = _UploadFileStatus.done;
          file.progress = 1;
        });
        uploadedCount++;
      } on CredentialsStorageUnavailableException {
        storageUnavailable = true;
        _setStateSafe(() {
          file.status = _UploadFileStatus.failed;
          file.errorMessage = l10n.medicalRecordUploadStorageUnavailable;
        });
        break;
      } on DioException catch (_) {
        _setStateSafe(() {
          file.status = _UploadFileStatus.failed;
          file.errorMessage = l10n.specialistCredentialsUploadFailed;
        });
        break;
      } catch (_) {
        _setStateSafe(() {
          file.status = _UploadFileStatus.failed;
          file.errorMessage = l10n.specialistCredentialsUploadFailed;
        });
        break;
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
        _pendingFiles.every((f) => f.status == _UploadFileStatus.done)) {
      ref.invalidate(doctorCredentialsProfileProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.specialistCredentialsSubmitSuccess)),
      );
      context.go(SpecialistRoutes.verificationPending);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final profileAsync = ref.watch(doctorCredentialsProfileProvider);

    profileAsync.whenData(_prefillCouncilNumber);

    final existingCredentials = profileAsync.maybeWhen(
      data: (profile) => profile.credentials?.toList() ?? const <Credential>[],
      orElse: () => const <Credential>[],
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.specialistCredentialsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(GpsSpacing.lg),
        children: [
          Text(
            l10n.specialistCredentialsSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          TextField(
            controller: _councilController,
            enabled: !_submitting,
            decoration: InputDecoration(
              labelText: l10n.specialistCredentialsCouncilNumber,
              errorText: _councilError,
            ),
            onChanged: (_) => _setStateSafe(() => _councilError = null),
          ),
          const SizedBox(height: GpsSpacing.lg),
          if (existingCredentials.isNotEmpty) ...[
            Text(
              l10n.specialistCredentialsExisting,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: GpsSpacing.sm),
            for (final credential in existingCredentials)
              _CredentialRow(credential: credential),
            const SizedBox(height: GpsSpacing.lg),
          ],
          DropdownButtonFormField<CredentialTypeEnum>(
            value: _selectedType,
            decoration: InputDecoration(
              labelText: l10n.specialistCredentialsType,
            ),
            items: [
              for (final type in credentialUploadTypes)
                DropdownMenuItem(
                  value: type,
                  child: Text(credentialTypeLabel(type, l10n)),
                ),
            ],
            onChanged: _submitting
                ? null
                : (value) {
                    if (value != null) {
                      _setStateSafe(() => _selectedType = value);
                    }
                  },
          ),
          const SizedBox(height: GpsSpacing.md),
          Wrap(
            spacing: GpsSpacing.sm,
            runSpacing: GpsSpacing.sm,
            children: [
              OutlinedButton.icon(
                onPressed: _submitting || _remainingSlots <= 0
                    ? null
                    : _pickFromGallery,
                icon: const Icon(Icons.photo_library_outlined),
                label: Text(l10n.specialistCredentialsAddFile),
              ),
              OutlinedButton.icon(
                onPressed: _submitting || _remainingSlots <= 0
                    ? null
                    : _pickPdfFiles,
                icon: const Icon(Icons.picture_as_pdf_outlined),
                label: const Text('PDF'),
              ),
            ],
          ),
          if (_filesError != null) ...[
            const SizedBox(height: GpsSpacing.sm),
            Text(
              _filesError!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          const SizedBox(height: GpsSpacing.md),
          for (final file in _pendingFiles) ...[
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(file.fileName),
              subtitle: Text(credentialTypeLabel(file.type, l10n)),
              trailing: file.status == _UploadFileStatus.uploading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(value: file.progress),
                    )
                  : IconButton(
                      onPressed: _submitting
                          ? null
                          : () =>
                                _setStateSafe(() => _pendingFiles.remove(file)),
                      icon: const Icon(Icons.close),
                    ),
            ),
            if (file.errorMessage != null)
              Text(
                file.errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
          ],
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: PrimaryButton(
            label: l10n.specialistCredentialsSubmit,
            onPressed: _submitting ? null : () => _submit(l10n),
            isLoading: _submitting,
          ),
        ),
      ),
    );
  }
}

class _CredentialRow extends StatelessWidget {
  const _CredentialRow({required this.credential});

  final Credential credential;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        leading: const Icon(Icons.description_outlined),
        title: Text(credentialTypeLabel(credential.type, l10n)),
        subtitle: Text(credentialStatusLabel(credential.status, l10n)),
        trailing: Chip(
          label: Text(
            credentialStatusLabel(credential.status, l10n),
            style: theme.textTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}
