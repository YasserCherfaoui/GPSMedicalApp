//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/appointment_review_for_clinic.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_appointment_reviews_for_clinic.g.dart';

/// PaginatedAppointmentReviewsForClinic
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedAppointmentReviewsForClinic implements Built<PaginatedAppointmentReviewsForClinic, PaginatedAppointmentReviewsForClinicBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<AppointmentReviewForClinic>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedAppointmentReviewsForClinic._();

  factory PaginatedAppointmentReviewsForClinic([void updates(PaginatedAppointmentReviewsForClinicBuilder b)]) = _$PaginatedAppointmentReviewsForClinic;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedAppointmentReviewsForClinicBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedAppointmentReviewsForClinic> get serializer => _$PaginatedAppointmentReviewsForClinicSerializer();
}

class _$PaginatedAppointmentReviewsForClinicSerializer implements PrimitiveSerializer<PaginatedAppointmentReviewsForClinic> {
  @override
  final Iterable<Type> types = const [PaginatedAppointmentReviewsForClinic, _$PaginatedAppointmentReviewsForClinic];

  @override
  final String wireName = r'PaginatedAppointmentReviewsForClinic';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedAppointmentReviewsForClinic object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(AppointmentReviewForClinic)]),
      );
    }
    if (object.meta != null) {
      yield r'meta';
      yield serializers.serialize(
        object.meta,
        specifiedType: const FullType(PaginationMeta),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedAppointmentReviewsForClinic object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedAppointmentReviewsForClinicBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AppointmentReviewForClinic)]),
          ) as BuiltList<AppointmentReviewForClinic>;
          result.data.replace(valueDes);
          break;
        case r'meta':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaginationMeta),
          ) as PaginationMeta;
          result.meta.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginatedAppointmentReviewsForClinic deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedAppointmentReviewsForClinicBuilder();
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

