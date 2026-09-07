//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'concierge_case_create.g.dart';

/// ConciergeCaseCreate
///
/// Properties:
/// * [patientUserId] 
/// * [conciergeUserId] - Requis pour admin ; ignoré si l'appelant est concierge (auto-assignation).
/// * [note] 
@BuiltValue()
abstract class ConciergeCaseCreate implements Built<ConciergeCaseCreate, ConciergeCaseCreateBuilder> {
  @BuiltValueField(wireName: r'patient_user_id')
  String get patientUserId;

  /// Requis pour admin ; ignoré si l'appelant est concierge (auto-assignation).
  @BuiltValueField(wireName: r'concierge_user_id')
  String? get conciergeUserId;

  @BuiltValueField(wireName: r'note')
  String? get note;

  ConciergeCaseCreate._();

  factory ConciergeCaseCreate([void updates(ConciergeCaseCreateBuilder b)]) = _$ConciergeCaseCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConciergeCaseCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConciergeCaseCreate> get serializer => _$ConciergeCaseCreateSerializer();
}

class _$ConciergeCaseCreateSerializer implements PrimitiveSerializer<ConciergeCaseCreate> {
  @override
  final Iterable<Type> types = const [ConciergeCaseCreate, _$ConciergeCaseCreate];

  @override
  final String wireName = r'ConciergeCaseCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConciergeCaseCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'patient_user_id';
    yield serializers.serialize(
      object.patientUserId,
      specifiedType: const FullType(String),
    );
    if (object.conciergeUserId != null) {
      yield r'concierge_user_id';
      yield serializers.serialize(
        object.conciergeUserId,
        specifiedType: const FullType(String),
      );
    }
    if (object.note != null) {
      yield r'note';
      yield serializers.serialize(
        object.note,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConciergeCaseCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConciergeCaseCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'patient_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.patientUserId = valueDes;
          break;
        case r'concierge_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.conciergeUserId = valueDes;
          break;
        case r'note':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.note = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConciergeCaseCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConciergeCaseCreateBuilder();
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

