//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'appointment_review_for_clinic.g.dart';

/// AppointmentReviewForClinic
///
/// Properties:
/// * [id] 
/// * [appointmentId] 
/// * [clinicId] 
/// * [patientId] 
/// * [rating] 
/// * [comment] 
/// * [createdAt] 
@BuiltValue()
abstract class AppointmentReviewForClinic implements Built<AppointmentReviewForClinic, AppointmentReviewForClinicBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'appointment_id')
  String? get appointmentId;

  @BuiltValueField(wireName: r'clinic_id')
  String? get clinicId;

  @BuiltValueField(wireName: r'patient_id')
  String? get patientId;

  @BuiltValueField(wireName: r'rating')
  int? get rating;

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  AppointmentReviewForClinic._();

  factory AppointmentReviewForClinic([void updates(AppointmentReviewForClinicBuilder b)]) = _$AppointmentReviewForClinic;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AppointmentReviewForClinicBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AppointmentReviewForClinic> get serializer => _$AppointmentReviewForClinicSerializer();
}

class _$AppointmentReviewForClinicSerializer implements PrimitiveSerializer<AppointmentReviewForClinic> {
  @override
  final Iterable<Type> types = const [AppointmentReviewForClinic, _$AppointmentReviewForClinic];

  @override
  final String wireName = r'AppointmentReviewForClinic';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AppointmentReviewForClinic object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.appointmentId != null) {
      yield r'appointment_id';
      yield serializers.serialize(
        object.appointmentId,
        specifiedType: const FullType(String),
      );
    }
    if (object.clinicId != null) {
      yield r'clinic_id';
      yield serializers.serialize(
        object.clinicId,
        specifiedType: const FullType(String),
      );
    }
    if (object.patientId != null) {
      yield r'patient_id';
      yield serializers.serialize(
        object.patientId,
        specifiedType: const FullType(String),
      );
    }
    if (object.rating != null) {
      yield r'rating';
      yield serializers.serialize(
        object.rating,
        specifiedType: const FullType(int),
      );
    }
    if (object.comment != null) {
      yield r'comment';
      yield serializers.serialize(
        object.comment,
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
    AppointmentReviewForClinic object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AppointmentReviewForClinicBuilder result,
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
        case r'appointment_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.appointmentId = valueDes;
          break;
        case r'clinic_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clinicId = valueDes;
          break;
        case r'patient_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.patientId = valueDes;
          break;
        case r'rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.rating = valueDes;
          break;
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.comment = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
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
  AppointmentReviewForClinic deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppointmentReviewForClinicBuilder();
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

