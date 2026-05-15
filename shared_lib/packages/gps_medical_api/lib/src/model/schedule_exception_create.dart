//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'schedule_exception_create.g.dart';

/// ScheduleExceptionCreate
///
/// Properties:
/// * [startAt]
/// * [endAt]
/// * [kind]
/// * [note]
@BuiltValue()
abstract class ScheduleExceptionCreate
    implements Built<ScheduleExceptionCreate, ScheduleExceptionCreateBuilder> {
  @BuiltValueField(wireName: r'start_at')
  DateTime get startAt;

  @BuiltValueField(wireName: r'end_at')
  DateTime get endAt;

  @BuiltValueField(wireName: r'kind')
  ScheduleExceptionCreateKindEnum get kind;
  // enum kindEnum {  vacation,  sick,  blocked,  extra,  };

  @BuiltValueField(wireName: r'note')
  String? get note;

  ScheduleExceptionCreate._();

  factory ScheduleExceptionCreate([
    void updates(ScheduleExceptionCreateBuilder b),
  ]) = _$ScheduleExceptionCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScheduleExceptionCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScheduleExceptionCreate> get serializer =>
      _$ScheduleExceptionCreateSerializer();
}

class _$ScheduleExceptionCreateSerializer
    implements PrimitiveSerializer<ScheduleExceptionCreate> {
  @override
  final Iterable<Type> types = const [
    ScheduleExceptionCreate,
    _$ScheduleExceptionCreate,
  ];

  @override
  final String wireName = r'ScheduleExceptionCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScheduleExceptionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'start_at';
    yield serializers.serialize(
      object.startAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'end_at';
    yield serializers.serialize(
      object.endAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'kind';
    yield serializers.serialize(
      object.kind,
      specifiedType: const FullType(ScheduleExceptionCreateKindEnum),
    );
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
    ScheduleExceptionCreate object, {
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
    required ScheduleExceptionCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
                    specifiedType: const FullType(
                      ScheduleExceptionCreateKindEnum,
                    ),
                  )
                  as ScheduleExceptionCreateKindEnum;
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
  ScheduleExceptionCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScheduleExceptionCreateBuilder();
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

class ScheduleExceptionCreateKindEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'vacation')
  static const ScheduleExceptionCreateKindEnum vacation =
      _$scheduleExceptionCreateKindEnum_vacation;
  @BuiltValueEnumConst(wireName: r'sick')
  static const ScheduleExceptionCreateKindEnum sick =
      _$scheduleExceptionCreateKindEnum_sick;
  @BuiltValueEnumConst(wireName: r'blocked')
  static const ScheduleExceptionCreateKindEnum blocked =
      _$scheduleExceptionCreateKindEnum_blocked;
  @BuiltValueEnumConst(wireName: r'extra')
  static const ScheduleExceptionCreateKindEnum extra =
      _$scheduleExceptionCreateKindEnum_extra;

  static Serializer<ScheduleExceptionCreateKindEnum> get serializer =>
      _$scheduleExceptionCreateKindEnumSerializer;

  const ScheduleExceptionCreateKindEnum._(String name) : super(name);

  static BuiltSet<ScheduleExceptionCreateKindEnum> get values =>
      _$scheduleExceptionCreateKindEnumValues;
  static ScheduleExceptionCreateKindEnum valueOf(String name) =>
      _$scheduleExceptionCreateKindEnumValueOf(name);
}
