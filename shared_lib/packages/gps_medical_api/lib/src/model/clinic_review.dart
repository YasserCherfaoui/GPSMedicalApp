//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_review.g.dart';

/// ClinicReview
///
/// Properties:
/// * [id] 
/// * [clinicId] 
/// * [patientId] 
/// * [rating] 
/// * [comment] 
/// * [status] 
/// * [createdAt] 
@BuiltValue()
abstract class ClinicReview implements Built<ClinicReview, ClinicReviewBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'clinic_id')
  String? get clinicId;

  @BuiltValueField(wireName: r'patient_id')
  String? get patientId;

  @BuiltValueField(wireName: r'rating')
  int? get rating;

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  @BuiltValueField(wireName: r'status')
  ClinicReviewStatusEnum? get status;
  // enum statusEnum {  pending,  published,  hidden,  deleted,  };

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  ClinicReview._();

  factory ClinicReview([void updates(ClinicReviewBuilder b)]) = _$ClinicReview;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicReviewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicReview> get serializer => _$ClinicReviewSerializer();
}

class _$ClinicReviewSerializer implements PrimitiveSerializer<ClinicReview> {
  @override
  final Iterable<Type> types = const [ClinicReview, _$ClinicReview];

  @override
  final String wireName = r'ClinicReview';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicReview object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ClinicReviewStatusEnum),
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
    ClinicReview object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicReviewBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicReviewStatusEnum),
          ) as ClinicReviewStatusEnum;
          result.status = valueDes;
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
  ClinicReview deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicReviewBuilder();
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

class ClinicReviewStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const ClinicReviewStatusEnum pending = _$clinicReviewStatusEnum_pending;
  @BuiltValueEnumConst(wireName: r'published')
  static const ClinicReviewStatusEnum published = _$clinicReviewStatusEnum_published;
  @BuiltValueEnumConst(wireName: r'hidden')
  static const ClinicReviewStatusEnum hidden = _$clinicReviewStatusEnum_hidden;
  @BuiltValueEnumConst(wireName: r'deleted')
  static const ClinicReviewStatusEnum deleted = _$clinicReviewStatusEnum_deleted;

  static Serializer<ClinicReviewStatusEnum> get serializer => _$clinicReviewStatusEnumSerializer;

  const ClinicReviewStatusEnum._(String name): super(name);

  static BuiltSet<ClinicReviewStatusEnum> get values => _$clinicReviewStatusEnumValues;
  static ClinicReviewStatusEnum valueOf(String name) => _$clinicReviewStatusEnumValueOf(name);
}

