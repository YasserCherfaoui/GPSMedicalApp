//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'teleconsultations_appointment_id_end_post_request.g.dart';

/// TeleconsultationsAppointmentIdEndPostRequest
///
/// Properties:
/// * [durationSeconds] 
/// * [qualityScore] 
@BuiltValue()
abstract class TeleconsultationsAppointmentIdEndPostRequest implements Built<TeleconsultationsAppointmentIdEndPostRequest, TeleconsultationsAppointmentIdEndPostRequestBuilder> {
  @BuiltValueField(wireName: r'duration_seconds')
  int? get durationSeconds;

  @BuiltValueField(wireName: r'quality_score')
  int? get qualityScore;

  TeleconsultationsAppointmentIdEndPostRequest._();

  factory TeleconsultationsAppointmentIdEndPostRequest([void updates(TeleconsultationsAppointmentIdEndPostRequestBuilder b)]) = _$TeleconsultationsAppointmentIdEndPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TeleconsultationsAppointmentIdEndPostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TeleconsultationsAppointmentIdEndPostRequest> get serializer => _$TeleconsultationsAppointmentIdEndPostRequestSerializer();
}

class _$TeleconsultationsAppointmentIdEndPostRequestSerializer implements PrimitiveSerializer<TeleconsultationsAppointmentIdEndPostRequest> {
  @override
  final Iterable<Type> types = const [TeleconsultationsAppointmentIdEndPostRequest, _$TeleconsultationsAppointmentIdEndPostRequest];

  @override
  final String wireName = r'TeleconsultationsAppointmentIdEndPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TeleconsultationsAppointmentIdEndPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.durationSeconds != null) {
      yield r'duration_seconds';
      yield serializers.serialize(
        object.durationSeconds,
        specifiedType: const FullType(int),
      );
    }
    if (object.qualityScore != null) {
      yield r'quality_score';
      yield serializers.serialize(
        object.qualityScore,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultationsAppointmentIdEndPostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TeleconsultationsAppointmentIdEndPostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'duration_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.durationSeconds = valueDes;
          break;
        case r'quality_score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.qualityScore = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TeleconsultationsAppointmentIdEndPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TeleconsultationsAppointmentIdEndPostRequestBuilder();
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

