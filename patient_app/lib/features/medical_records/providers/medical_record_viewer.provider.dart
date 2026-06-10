import 'dart:typed_data';

import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'medical_records_repositories.provider.dart';

part 'medical_record_viewer.provider.g.dart';

class MedicalRecordViewerState {
  const MedicalRecordViewerState({required this.document, required this.bytes});

  final MedicalDocument document;
  final Uint8List bytes;
}

@riverpod
class MedicalRecordViewer extends _$MedicalRecordViewer {
  @override
  Future<MedicalRecordViewerState> build(String documentId) async {
    final repo = ref.watch(medicalRecordsRepositoryProvider);
    final document = await repo.fetchById(documentId);
    final bytes = await repo.fetchDocumentBytes(documentId);
    return MedicalRecordViewerState(document: document, bytes: bytes);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(medicalRecordsRepositoryProvider);
      final document = await repo.fetchById(documentId);
      final bytes = await repo.fetchDocumentBytes(documentId);
      return MedicalRecordViewerState(document: document, bytes: bytes);
    });
  }
}
