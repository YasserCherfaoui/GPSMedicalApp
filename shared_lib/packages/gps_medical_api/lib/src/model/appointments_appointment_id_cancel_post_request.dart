//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'appointments_appointment_id_cancel_post_request.g.dart';

/// AppointmentsAppointmentIdCancelPostRequest
///
/// Properties:
/// * [reason]
@BuiltValue()
abstract class AppointmentsAppointmentIdCancelPostRequest
    implements
        Built<
          AppointmentsAppointmentIdCancelPostRequest,
          AppointmentsAppointmentIdCancelPostRequestBuilder
        > {
  @BuiltValueField(wireName: r'reason')
  String? get reason;

  AppointmentsAppointmentIdCancelPostRequest._();

  factory AppointmentsAppointmentIdCancelPostRequest([
    void updates(AppointmentsAppointmentIdCancelPostRequestBuilder b),
  ]) = _$AppointmentsAppointmentIdCancelPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AppointmentsAppointmentIdCancelPostRequestBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AppointmentsAppointmentIdCancelPostRequest>
  get serializer => _$AppointmentsAppointmentIdCancelPostRequestSerializer();
}

class _$AppointmentsAppointmentIdCancelPostRequestSerializer
    implements PrimitiveSerializer<AppointmentsAppointmentIdCancelPostRequest> {
  @override
  final Iterable<Type> types = const [
    AppointmentsAppointmentIdCancelPostRequest,
    _$AppointmentsAppointmentIdCancelPostRequest,
  ];

  @override
  final String wireName = r'AppointmentsAppointmentIdCancelPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AppointmentsAppointmentIdCancelPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AppointmentsAppointmentIdCancelPostRequest object, {
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
    required AppointmentsAppointmentIdCancelPostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'reason':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.reason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AppointmentsAppointmentIdCancelPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppointmentsAppointmentIdCancelPostRequestBuilder();
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
