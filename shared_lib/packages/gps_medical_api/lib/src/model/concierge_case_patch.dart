//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/concierge_case_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'concierge_case_patch.g.dart';

/// ConciergeCasePatch
///
/// Properties:
/// * [status] 
/// * [note] 
/// * [conciergeUserId] - Réassignation (admin ou concierge selon politique RBAC).
@BuiltValue()
abstract class ConciergeCasePatch implements Built<ConciergeCasePatch, ConciergeCasePatchBuilder> {
  @BuiltValueField(wireName: r'status')
  ConciergeCaseStatus? get status;
  // enum statusEnum {  open,  active,  closed,  };

  @BuiltValueField(wireName: r'note')
  String? get note;

  /// Réassignation (admin ou concierge selon politique RBAC).
  @BuiltValueField(wireName: r'concierge_user_id')
  String? get conciergeUserId;

  ConciergeCasePatch._();

  factory ConciergeCasePatch([void updates(ConciergeCasePatchBuilder b)]) = _$ConciergeCasePatch;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConciergeCasePatchBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConciergeCasePatch> get serializer => _$ConciergeCasePatchSerializer();
}

class _$ConciergeCasePatchSerializer implements PrimitiveSerializer<ConciergeCasePatch> {
  @override
  final Iterable<Type> types = const [ConciergeCasePatch, _$ConciergeCasePatch];

  @override
  final String wireName = r'ConciergeCasePatch';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConciergeCasePatch object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ConciergeCaseStatus),
      );
    }
    if (object.note != null) {
      yield r'note';
      yield serializers.serialize(
        object.note,
        specifiedType: const FullType(String),
      );
    }
    if (object.conciergeUserId != null) {
      yield r'concierge_user_id';
      yield serializers.serialize(
        object.conciergeUserId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConciergeCasePatch object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConciergeCasePatchBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType(String),
          ) as String;
          result.note = valueDes;
          break;
        case r'concierge_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.conciergeUserId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConciergeCasePatch deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConciergeCasePatchBuilder();
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

