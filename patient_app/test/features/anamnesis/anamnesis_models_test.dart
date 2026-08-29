import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/anamnesis/models/anamnesis_models.dart';
import 'package:patient_app/features/pain_localization/models/pain_selection.dart';

void main() {
  test('AnamnesisSession parses API payload', () {
    final session = AnamnesisSession.fromJson({
      'id': '11111111-1111-1111-1111-111111111111',
      'status': 'in_progress',
      'zone_code': 'knee_l',
      'body_model': 'male',
      'tree_id': 'knee_v1',
      'tree_version': '2026.08.1',
      'progress': {'answered_count': 1, 'estimated_total': 3},
    });

    expect(session.zoneCode, 'knee_l');
    expect(session.progress.answeredCount, 1);
    expect(session.progress.estimatedTotal, 3);
  });

  test('painSelectionToApi drops labels and keeps codes', () {
    final selection = PainSelection(
      model: 'male',
      kind: 'zone',
      code: 'knee_l',
      side: 'left',
      system: 'musculoskeletal',
      selectedAt: DateTime.utc(2026, 8, 29),
    );

    final api = painSelectionToApi(selection);
    expect(api['code'], 'knee_l');
    expect(api['body_model'], 'male');
    expect(api.containsKey('label'), isFalse);
  });

  test('buildAnswerValue single choice', () {
    final value = buildAnswerValue(type: 'single_choice', optionId: 'mechanical');
    expect(value['option_id'], 'mechanical');
  });

  test('AnamnesisSessionDocument and extraction parse', () {
    final doc = AnamnesisSessionDocument.fromJson({
      'document_id': '22222222-2222-2222-2222-222222222222',
      'session_id': '11111111-1111-1111-1111-111111111111',
      'extraction_status': 'extracted',
      'attached_at': '2026-08-29T12:00:00Z',
      'title': 'IRM genou',
    });
    expect(doc.isTerminal, isTrue);
    expect(doc.title, 'IRM genou');

    final ext = AnamnesisDocumentExtraction.fromJson({
      'document_id': doc.documentId,
      'status': 'extracted',
      'raw_ocr_text': 'MOCK OCR',
      'structured': {
        'exam_type': 'IRM',
        'key_findings': ['menisque'],
      },
    });
    expect(ext.structured?.examType, 'IRM');
    expect(ext.structured?.keyFindings, ['menisque']);
  });
}
