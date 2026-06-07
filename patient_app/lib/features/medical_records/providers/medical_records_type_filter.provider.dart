import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medical_records_type_filter.provider.g.dart';

@riverpod
class MedicalRecordsTypeFilter extends _$MedicalRecordsTypeFilter {
  @override
  MedicalDocumentTypeEnum? build() => null;

  void select(MedicalDocumentTypeEnum? type) {
    state = type;
  }
}
