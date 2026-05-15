//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'medical_document.g.dart';

/// MedicalDocument
///
/// Properties:
/// * [id]
/// * [type]
/// * [title]
/// * [notes]
/// * [appointmentId]
/// * [patientId]
/// * [authorId]
/// * [authorRole]
/// * [fileSize]
/// * [mimeType]
/// * [createdAt]
@BuiltValue()
abstract class MedicalDocument
    implements Built<MedicalDocument, MedicalDocumentBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'type')
  MedicalDocumentTypeEnum? get type;
  // enum typeEnum {  prescription,  report,  lab_result,  imaging,  certificate,  other,  };

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  @BuiltValueField(wireName: r'appointment_id')
  String? get appointmentId;

  @BuiltValueField(wireName: r'patient_id')
  String? get patientId;

  @BuiltValueField(wireName: r'author_id')
  String? get authorId;

  @BuiltValueField(wireName: r'author_role')
  MedicalDocumentAuthorRoleEnum? get authorRole;
  // enum authorRoleEnum {  patient,  specialist,  concierge,  };

  @BuiltValueField(wireName: r'file_size')
  int? get fileSize;

  @BuiltValueField(wireName: r'mime_type')
  String? get mimeType;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  MedicalDocument._();

  factory MedicalDocument([void updates(MedicalDocumentBuilder b)]) =
      _$MedicalDocument;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MedicalDocumentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MedicalDocument> get serializer =>
      _$MedicalDocumentSerializer();
}

class _$MedicalDocumentSerializer
    implements PrimitiveSerializer<MedicalDocument> {
  @override
  final Iterable<Type> types = const [MedicalDocument, _$MedicalDocument];

  @override
  final String wireName = r'MedicalDocument';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MedicalDocument object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(MedicalDocumentTypeEnum),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType(String),
      );
    }
    if (object.appointmentId != null) {
      yield r'appointment_id';
      yield serializers.serialize(
        object.appointmentId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.patientId != null) {
      yield r'patient_id';
      yield serializers.serialize(
        object.patientId,
        specifiedType: const FullType(String),
      );
    }
    if (object.authorId != null) {
      yield r'author_id';
      yield serializers.serialize(
        object.authorId,
        specifiedType: const FullType(String),
      );
    }
    if (object.authorRole != null) {
      yield r'author_role';
      yield serializers.serialize(
        object.authorRole,
        specifiedType: const FullType(MedicalDocumentAuthorRoleEnum),
      );
    }
    if (object.fileSize != null) {
      yield r'file_size';
      yield serializers.serialize(
        object.fileSize,
        specifiedType: const FullType(int),
      );
    }
    if (object.mimeType != null) {
      yield r'mime_type';
      yield serializers.serialize(
        object.mimeType,
        specifiedType: const FullType(String),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MedicalDocument object, {
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
    required MedicalDocumentBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
          break;
        case r'type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(MedicalDocumentTypeEnum),
                  )
                  as MedicalDocumentTypeEnum;
          result.type = valueDes;
          break;
        case r'title':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.title = valueDes;
          break;
        case r'notes':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.notes = valueDes;
          break;
        case r'appointment_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.appointmentId = valueDes;
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
        case r'author_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.authorId = valueDes;
          break;
        case r'author_role':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      MedicalDocumentAuthorRoleEnum,
                    ),
                  )
                  as MedicalDocumentAuthorRoleEnum;
          result.authorRole = valueDes;
          break;
        case r'file_size':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.fileSize = valueDes;
          break;
        case r'mime_type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.mimeType = valueDes;
          break;
        case r'created_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MedicalDocument deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MedicalDocumentBuilder();
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

class MedicalDocumentTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'prescription')
  static const MedicalDocumentTypeEnum prescription =
      _$medicalDocumentTypeEnum_prescription;
  @BuiltValueEnumConst(wireName: r'report')
  static const MedicalDocumentTypeEnum report =
      _$medicalDocumentTypeEnum_report;
  @BuiltValueEnumConst(wireName: r'lab_result')
  static const MedicalDocumentTypeEnum labResult =
      _$medicalDocumentTypeEnum_labResult;
  @BuiltValueEnumConst(wireName: r'imaging')
  static const MedicalDocumentTypeEnum imaging =
      _$medicalDocumentTypeEnum_imaging;
  @BuiltValueEnumConst(wireName: r'certificate')
  static const MedicalDocumentTypeEnum certificate =
      _$medicalDocumentTypeEnum_certificate;
  @BuiltValueEnumConst(wireName: r'other')
  static const MedicalDocumentTypeEnum other = _$medicalDocumentTypeEnum_other;

  static Serializer<MedicalDocumentTypeEnum> get serializer =>
      _$medicalDocumentTypeEnumSerializer;

  const MedicalDocumentTypeEnum._(String name) : super(name);

  static BuiltSet<MedicalDocumentTypeEnum> get values =>
      _$medicalDocumentTypeEnumValues;
  static MedicalDocumentTypeEnum valueOf(String name) =>
      _$medicalDocumentTypeEnumValueOf(name);
}

class MedicalDocumentAuthorRoleEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'patient')
  static const MedicalDocumentAuthorRoleEnum patient =
      _$medicalDocumentAuthorRoleEnum_patient;
  @BuiltValueEnumConst(wireName: r'specialist')
  static const MedicalDocumentAuthorRoleEnum specialist =
      _$medicalDocumentAuthorRoleEnum_specialist;
  @BuiltValueEnumConst(wireName: r'concierge')
  static const MedicalDocumentAuthorRoleEnum concierge =
      _$medicalDocumentAuthorRoleEnum_concierge;

  static Serializer<MedicalDocumentAuthorRoleEnum> get serializer =>
      _$medicalDocumentAuthorRoleEnumSerializer;

  const MedicalDocumentAuthorRoleEnum._(String name) : super(name);

  static BuiltSet<MedicalDocumentAuthorRoleEnum> get values =>
      _$medicalDocumentAuthorRoleEnumValues;
  static MedicalDocumentAuthorRoleEnum valueOf(String name) =>
      _$medicalDocumentAuthorRoleEnumValueOf(name);
}
