//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'appointment_update.g.dart';

/// AppointmentUpdate
///
/// Properties:
/// * [startAt]
/// * [reason]
/// * [notes] - Visible médecin uniquement
@BuiltValue()
abstract class AppointmentUpdate
    implements Built<AppointmentUpdate, AppointmentUpdateBuilder> {
  @BuiltValueField(wireName: r'start_at')
  DateTime? get startAt;

  @BuiltValueField(wireName: r'reason')
  String? get reason;

  /// Visible médecin uniquement
  @BuiltValueField(wireName: r'notes')
  String? get notes;

  AppointmentUpdate._();

  factory AppointmentUpdate([void updates(AppointmentUpdateBuilder b)]) =
      _$AppointmentUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AppointmentUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AppointmentUpdate> get serializer =>
      _$AppointmentUpdateSerializer();
}

class _$AppointmentUpdateSerializer
    implements PrimitiveSerializer<AppointmentUpdate> {
  @override
  final Iterable<Type> types = const [AppointmentUpdate, _$AppointmentUpdate];

  @override
  final String wireName = r'AppointmentUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AppointmentUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.startAt != null) {
      yield r'start_at';
      yield serializers.serialize(
        object.startAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    AppointmentUpdate object, {
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
    required AppointmentUpdateBuilder result,
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
        case r'reason':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.reason = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AppointmentUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppointmentUpdateBuilder();
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
