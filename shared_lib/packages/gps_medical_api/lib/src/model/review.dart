//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review.g.dart';

/// Review
///
/// Properties:
/// * [id] 
/// * [subjectType] 
/// * [subjectId] 
/// * [reviewScope] 
/// * [doctorId] 
/// * [clinicId] 
/// * [patientId] 
/// * [appointmentId] 
/// * [rating] 
/// * [comment] 
/// * [status] 
/// * [createdAt] 
@BuiltValue()
abstract class Review implements Built<Review, ReviewBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'subject_type')
  ReviewSubjectTypeEnum? get subjectType;
  // enum subjectTypeEnum {  doctor,  clinic,  };

  @BuiltValueField(wireName: r'subject_id')
  String? get subjectId;

  @BuiltValueField(wireName: r'review_scope')
  ReviewReviewScopeEnum? get reviewScope;
  // enum reviewScopeEnum {  appointment,  profile,  };

  @BuiltValueField(wireName: r'doctor_id')
  String? get doctorId;

  @BuiltValueField(wireName: r'clinic_id')
  String? get clinicId;

  @BuiltValueField(wireName: r'patient_id')
  String? get patientId;

  @BuiltValueField(wireName: r'appointment_id')
  String? get appointmentId;

  @BuiltValueField(wireName: r'rating')
  int? get rating;

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  @BuiltValueField(wireName: r'status')
  ReviewStatusEnum? get status;
  // enum statusEnum {  pending,  published,  hidden,  deleted,  };

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  Review._();

  factory Review([void updates(ReviewBuilder b)]) = _$Review;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Review> get serializer => _$ReviewSerializer();
}

class _$ReviewSerializer implements PrimitiveSerializer<Review> {
  @override
  final Iterable<Type> types = const [Review, _$Review];

  @override
  final String wireName = r'Review';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Review object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.subjectType != null) {
      yield r'subject_type';
      yield serializers.serialize(
        object.subjectType,
        specifiedType: const FullType(ReviewSubjectTypeEnum),
      );
    }
    if (object.subjectId != null) {
      yield r'subject_id';
      yield serializers.serialize(
        object.subjectId,
        specifiedType: const FullType(String),
      );
    }
    if (object.reviewScope != null) {
      yield r'review_scope';
      yield serializers.serialize(
        object.reviewScope,
        specifiedType: const FullType(ReviewReviewScopeEnum),
      );
    }
    if (object.doctorId != null) {
      yield r'doctor_id';
      yield serializers.serialize(
        object.doctorId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.clinicId != null) {
      yield r'clinic_id';
      yield serializers.serialize(
        object.clinicId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.patientId != null) {
      yield r'patient_id';
      yield serializers.serialize(
        object.patientId,
        specifiedType: const FullType(String),
      );
    }
    if (object.appointmentId != null) {
      yield r'appointment_id';
      yield serializers.serialize(
        object.appointmentId,
        specifiedType: const FullType.nullable(String),
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
        specifiedType: const FullType(ReviewStatusEnum),
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
    Review object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReviewBuilder result,
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
        case r'subject_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReviewSubjectTypeEnum),
          ) as ReviewSubjectTypeEnum;
          result.subjectType = valueDes;
          break;
        case r'subject_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.subjectId = valueDes;
          break;
        case r'review_scope':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReviewReviewScopeEnum),
          ) as ReviewReviewScopeEnum;
          result.reviewScope = valueDes;
          break;
        case r'doctor_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.doctorId = valueDes;
          break;
        case r'clinic_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.clinicId = valueDes;
          break;
        case r'patient_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.patientId = valueDes;
          break;
        case r'appointment_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.appointmentId = valueDes;
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
            specifiedType: const FullType(ReviewStatusEnum),
          ) as ReviewStatusEnum;
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
  Review deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewBuilder();
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

class ReviewSubjectTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'doctor')
  static const ReviewSubjectTypeEnum doctor = _$reviewSubjectTypeEnum_doctor;
  @BuiltValueEnumConst(wireName: r'clinic')
  static const ReviewSubjectTypeEnum clinic = _$reviewSubjectTypeEnum_clinic;

  static Serializer<ReviewSubjectTypeEnum> get serializer => _$reviewSubjectTypeEnumSerializer;

  const ReviewSubjectTypeEnum._(String name): super(name);

  static BuiltSet<ReviewSubjectTypeEnum> get values => _$reviewSubjectTypeEnumValues;
  static ReviewSubjectTypeEnum valueOf(String name) => _$reviewSubjectTypeEnumValueOf(name);
}

class ReviewReviewScopeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'appointment')
  static const ReviewReviewScopeEnum appointment = _$reviewReviewScopeEnum_appointment;
  @BuiltValueEnumConst(wireName: r'profile')
  static const ReviewReviewScopeEnum profile = _$reviewReviewScopeEnum_profile;

  static Serializer<ReviewReviewScopeEnum> get serializer => _$reviewReviewScopeEnumSerializer;

  const ReviewReviewScopeEnum._(String name): super(name);

  static BuiltSet<ReviewReviewScopeEnum> get values => _$reviewReviewScopeEnumValues;
  static ReviewReviewScopeEnum valueOf(String name) => _$reviewReviewScopeEnumValueOf(name);
}

class ReviewStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const ReviewStatusEnum pending = _$reviewStatusEnum_pending;
  @BuiltValueEnumConst(wireName: r'published')
  static const ReviewStatusEnum published = _$reviewStatusEnum_published;
  @BuiltValueEnumConst(wireName: r'hidden')
  static const ReviewStatusEnum hidden = _$reviewStatusEnum_hidden;
  @BuiltValueEnumConst(wireName: r'deleted')
  static const ReviewStatusEnum deleted = _$reviewStatusEnum_deleted;

  static Serializer<ReviewStatusEnum> get serializer => _$reviewStatusEnumSerializer;

  const ReviewStatusEnum._(String name): super(name);

  static BuiltSet<ReviewStatusEnum> get values => _$reviewStatusEnumValues;
  static ReviewStatusEnum valueOf(String name) => _$reviewStatusEnumValueOf(name);
}

