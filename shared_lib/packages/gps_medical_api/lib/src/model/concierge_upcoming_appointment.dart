//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'concierge_upcoming_appointment.g.dart';

/// ConciergeUpcomingAppointment
///
/// Properties:
/// * [id] 
/// * [startAt] 
/// * [status] 
/// * [doctorName] 
@BuiltValue()
abstract class ConciergeUpcomingAppointment implements Built<ConciergeUpcomingAppointment, ConciergeUpcomingAppointmentBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'start_at')
  DateTime get startAt;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'doctor_name')
  String? get doctorName;

  ConciergeUpcomingAppointment._();

  factory ConciergeUpcomingAppointment([void updates(ConciergeUpcomingAppointmentBuilder b)]) = _$ConciergeUpcomingAppointment;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConciergeUpcomingAppointmentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConciergeUpcomingAppointment> get serializer => _$ConciergeUpcomingAppointmentSerializer();
}

class _$ConciergeUpcomingAppointmentSerializer implements PrimitiveSerializer<ConciergeUpcomingAppointment> {
  @override
  final Iterable<Type> types = const [ConciergeUpcomingAppointment, _$ConciergeUpcomingAppointment];

  @override
  final String wireName = r'ConciergeUpcomingAppointment';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConciergeUpcomingAppointment object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'start_at';
    yield serializers.serialize(
      object.startAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    if (object.doctorName != null) {
      yield r'doctor_name';
      yield serializers.serialize(
        object.doctorName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConciergeUpcomingAppointment object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConciergeUpcomingAppointmentBuilder result,
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
        case r'start_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startAt = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'doctor_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.doctorName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConciergeUpcomingAppointment deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConciergeUpcomingAppointmentBuilder();
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

