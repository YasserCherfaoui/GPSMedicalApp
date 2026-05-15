//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'schedule_exception.g.dart';

/// ScheduleException
///
/// Properties:
/// * [id]
/// * [startAt]
/// * [endAt]
/// * [kind]
/// * [note]
@BuiltValue()
abstract class ScheduleException
    implements Built<ScheduleException, ScheduleExceptionBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'start_at')
  DateTime? get startAt;

  @BuiltValueField(wireName: r'end_at')
  DateTime? get endAt;

  @BuiltValueField(wireName: r'kind')
  ScheduleExceptionKindEnum? get kind;
  // enum kindEnum {  vacation,  sick,  blocked,  extra,  };

  @BuiltValueField(wireName: r'note')
  String? get note;

  ScheduleException._();

  factory ScheduleException([void updates(ScheduleExceptionBuilder b)]) =
      _$ScheduleException;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScheduleExceptionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScheduleException> get serializer =>
      _$ScheduleExceptionSerializer();
}

class _$ScheduleExceptionSerializer
    implements PrimitiveSerializer<ScheduleException> {
  @override
  final Iterable<Type> types = const [ScheduleException, _$ScheduleException];

  @override
  final String wireName = r'ScheduleException';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScheduleException object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.startAt != null) {
      yield r'start_at';
      yield serializers.serialize(
        object.startAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.endAt != null) {
      yield r'end_at';
      yield serializers.serialize(
        object.endAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.kind != null) {
      yield r'kind';
      yield serializers.serialize(
        object.kind,
        specifiedType: const FullType(ScheduleExceptionKindEnum),
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
    ScheduleException object, {
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
    required ScheduleExceptionBuilder result,
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
        case r'start_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.startAt = valueDes;
          break;
        case r'end_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.endAt = valueDes;
          break;
        case r'kind':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(ScheduleExceptionKindEnum),
                  )
                  as ScheduleExceptionKindEnum;
          result.kind = valueDes;
          break;
        case r'note':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
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
  ScheduleException deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScheduleExceptionBuilder();
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

class ScheduleExceptionKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'vacation')
  static const ScheduleExceptionKindEnum vacation =
      _$scheduleExceptionKindEnum_vacation;
  @BuiltValueEnumConst(wireName: r'sick')
  static const ScheduleExceptionKindEnum sick =
      _$scheduleExceptionKindEnum_sick;
  @BuiltValueEnumConst(wireName: r'blocked')
  static const ScheduleExceptionKindEnum blocked =
      _$scheduleExceptionKindEnum_blocked;
  @BuiltValueEnumConst(wireName: r'extra')
  static const ScheduleExceptionKindEnum extra =
      _$scheduleExceptionKindEnum_extra;

  static Serializer<ScheduleExceptionKindEnum> get serializer =>
      _$scheduleExceptionKindEnumSerializer;

  const ScheduleExceptionKindEnum._(String name) : super(name);

  static BuiltSet<ScheduleExceptionKindEnum> get values =>
      _$scheduleExceptionKindEnumValues;
  static ScheduleExceptionKindEnum valueOf(String name) =>
      _$scheduleExceptionKindEnumValueOf(name);
}
