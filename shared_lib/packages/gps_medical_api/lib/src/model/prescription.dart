//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/prescription_create.dart';
import 'package:gps_medical_api/src/model/prescription_item.dart';
import 'package:gps_medical_api/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prescription.g.dart';

/// Prescription
///
/// Properties:
/// * [appointmentId]
/// * [diagnosis]
/// * [items]
/// * [validUntil]
/// * [id]
/// * [doctorId]
/// * [patientId]
/// * [pdfDocumentId]
/// * [issuedAt]
@BuiltValue()
abstract class Prescription
    implements PrescriptionCreate, Built<Prescription, PrescriptionBuilder> {
  @BuiltValueField(wireName: r'doctor_id')
  String? get doctorId;

  @BuiltValueField(wireName: r'patient_id')
  String? get patientId;

  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'issued_at')
  DateTime? get issuedAt;

  @BuiltValueField(wireName: r'pdf_document_id')
  String? get pdfDocumentId;

  Prescription._();

  factory Prescription([void updates(PrescriptionBuilder b)]) = _$Prescription;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PrescriptionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Prescription> get serializer => _$PrescriptionSerializer();
}

class _$PrescriptionSerializer implements PrimitiveSerializer<Prescription> {
  @override
  final Iterable<Type> types = const [Prescription, _$Prescription];

  @override
  final String wireName = r'Prescription';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Prescription object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.doctorId != null) {
      yield r'doctor_id';
      yield serializers.serialize(
        object.doctorId,
        specifiedType: const FullType(String),
      );
    }
    if (object.patientId != null) {
      yield r'patient_id';
      yield serializers.serialize(
        object.patientId,
        specifiedType: const FullType(String),
      );
    }
    yield r'appointment_id';
    yield serializers.serialize(
      object.appointmentId,
      specifiedType: const FullType(String),
    );
    if (object.diagnosis != null) {
      yield r'diagnosis';
      yield serializers.serialize(
        object.diagnosis,
        specifiedType: const FullType(String),
      );
    }
    if (object.validUntil != null) {
      yield r'valid_until';
      yield serializers.serialize(
        object.validUntil,
        specifiedType: const FullType(Date),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.issuedAt != null) {
      yield r'issued_at';
      yield serializers.serialize(
        object.issuedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.pdfDocumentId != null) {
      yield r'pdf_document_id';
      yield serializers.serialize(
        object.pdfDocumentId,
        specifiedType: const FullType(String),
      );
    }
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(PrescriptionItem)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Prescription object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PrescriptionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'doctor_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.doctorId = valueDes;
          break;
        case r'patient_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.patientId = valueDes;
          break;
        case r'appointment_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.appointmentId = valueDes;
          break;
        case r'diagnosis':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.diagnosis = valueDes;
          break;
        case r'valid_until':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Date),
                  )
                  as Date;
          result.validUntil = valueDes;
          break;
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
          break;
        case r'issued_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.issuedAt = valueDes;
          break;
        case r'pdf_document_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.pdfDocumentId = valueDes;
          break;
        case r'items':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(PrescriptionItem),
                    ]),
                  )
                  as BuiltList<PrescriptionItem>;
          result.items.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Prescription deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PrescriptionBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
