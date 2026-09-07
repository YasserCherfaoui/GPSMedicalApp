//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/concierge_case_status.dart';
import 'package:gps_medical_api/src/model/concierge_patient_summary.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'concierge_case.g.dart';

/// ConciergeCase
///
/// Properties:
/// * [id] 
/// * [patient] 
/// * [conciergeUserId] 
/// * [conciergeName] 
/// * [threadId] 
/// * [status] 
/// * [note] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue(instantiable: false)
abstract class ConciergeCase  {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'patient')
  ConciergePatientSummary get patient;

  @BuiltValueField(wireName: r'concierge_user_id')
  String get conciergeUserId;

  @BuiltValueField(wireName: r'concierge_name')
  String? get conciergeName;

  @BuiltValueField(wireName: r'thread_id')
  String get threadId;

  @BuiltValueField(wireName: r'status')
  ConciergeCaseStatus get status;
  // enum statusEnum {  open,  active,  closed,  };

  @BuiltValueField(wireName: r'note')
  String? get note;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConciergeCase> get serializer => _$ConciergeCaseSerializer();
}

class _$ConciergeCaseSerializer implements PrimitiveSerializer<ConciergeCase> {
  @override
  final Iterable<Type> types = const [ConciergeCase];

  @override
  final String wireName = r'ConciergeCase';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConciergeCase object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'patient';
    yield serializers.serialize(
      object.patient,
      specifiedType: const FullType(ConciergePatientSummary),
    );
    yield r'concierge_user_id';
    yield serializers.serialize(
      object.conciergeUserId,
      specifiedType: const FullType(String),
    );
    if (object.conciergeName != null) {
      yield r'concierge_name';
      yield serializers.serialize(
        object.conciergeName,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'thread_id';
    yield serializers.serialize(
      object.threadId,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ConciergeCaseStatus),
    );
    if (object.note != null) {
      yield r'note';
      yield serializers.serialize(
        object.note,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConciergeCase object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  ConciergeCase deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($ConciergeCase)) as $ConciergeCase;
  }
}

/// a concrete implementation of [ConciergeCase], since [ConciergeCase] is not instantiable
@BuiltValue(instantiable: true)
abstract class $ConciergeCase implements ConciergeCase, Built<$ConciergeCase, $ConciergeCaseBuilder> {
  $ConciergeCase._();

  factory $ConciergeCase([void Function($ConciergeCaseBuilder)? updates]) = _$$ConciergeCase;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ConciergeCaseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$ConciergeCase> get serializer => _$$ConciergeCaseSerializer();
}

class _$$ConciergeCaseSerializer implements PrimitiveSerializer<$ConciergeCase> {
  @override
  final Iterable<Type> types = const [$ConciergeCase, _$$ConciergeCase];

  @override
  final String wireName = r'$ConciergeCase';

  @override
  Object serialize(
    Serializers serializers,
    $ConciergeCase object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(ConciergeCase))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConciergeCaseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'patient':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConciergePatientSummary),
          ) as ConciergePatientSummary;
          result.patient.replace(valueDes);
          break;
        case r'concierge_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.conciergeUserId = valueDes;
          break;
        case r'concierge_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.conciergeName = valueDes;
          break;
        case r'thread_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.threadId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConciergeCaseStatus),
          ) as ConciergeCaseStatus;
          result.status = valueDes;
          break;
        case r'note':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.note = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $ConciergeCase deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $ConciergeCaseBuilder();
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

