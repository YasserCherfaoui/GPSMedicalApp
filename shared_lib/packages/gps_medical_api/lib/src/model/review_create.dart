//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_create.g.dart';

/// ReviewCreate
///
/// Properties:
/// * [subjectType] 
/// * [reviewScope] 
/// * [appointmentId] 
/// * [clinicId] 
/// * [rating] 
/// * [comment] 
@BuiltValue()
abstract class ReviewCreate implements Built<ReviewCreate, ReviewCreateBuilder> {
  @BuiltValueField(wireName: r'subject_type')
  ReviewCreateSubjectTypeEnum? get subjectType;
  // enum subjectTypeEnum {  doctor,  clinic,  };

  @BuiltValueField(wireName: r'review_scope')
  ReviewCreateReviewScopeEnum? get reviewScope;
  // enum reviewScopeEnum {  appointment,  profile,  };

  @BuiltValueField(wireName: r'appointment_id')
  String? get appointmentId;

  @BuiltValueField(wireName: r'clinic_id')
  String? get clinicId;

  @BuiltValueField(wireName: r'rating')
  int get rating;

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  ReviewCreate._();

  factory ReviewCreate([void updates(ReviewCreateBuilder b)]) = _$ReviewCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewCreateBuilder b) => b
      ..subjectType = ReviewCreateSubjectTypeEnum.valueOf('doctor')
      ..reviewScope = ReviewCreateReviewScopeEnum.valueOf('appointment');

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewCreate> get serializer => _$ReviewCreateSerializer();
}

class _$ReviewCreateSerializer implements PrimitiveSerializer<ReviewCreate> {
  @override
  final Iterable<Type> types = const [ReviewCreate, _$ReviewCreate];

  @override
  final String wireName = r'ReviewCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.subjectType != null) {
      yield r'subject_type';
      yield serializers.serialize(
        object.subjectType,
        specifiedType: const FullType(ReviewCreateSubjectTypeEnum),
      );
    }
    if (object.reviewScope != null) {
      yield r'review_scope';
      yield serializers.serialize(
        object.reviewScope,
        specifiedType: const FullType(ReviewCreateReviewScopeEnum),
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
    yield r'rating';
    yield serializers.serialize(
      object.rating,
      specifiedType: const FullType(int),
    );
    if (object.comment != null) {
      yield r'comment';
      yield serializers.serialize(
        object.comment,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReviewCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'subject_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReviewCreateSubjectTypeEnum),
          ) as ReviewCreateSubjectTypeEnum;
          result.subjectType = valueDes;
          break;
        case r'review_scope':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReviewCreateReviewScopeEnum),
          ) as ReviewCreateReviewScopeEnum;
          result.reviewScope = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReviewCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewCreateBuilder();
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

class ReviewCreateSubjectTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'doctor')
  static const ReviewCreateSubjectTypeEnum doctor = _$reviewCreateSubjectTypeEnum_doctor;
  @BuiltValueEnumConst(wireName: r'clinic')
  static const ReviewCreateSubjectTypeEnum clinic = _$reviewCreateSubjectTypeEnum_clinic;

  static Serializer<ReviewCreateSubjectTypeEnum> get serializer => _$reviewCreateSubjectTypeEnumSerializer;

  const ReviewCreateSubjectTypeEnum._(String name): super(name);

  static BuiltSet<ReviewCreateSubjectTypeEnum> get values => _$reviewCreateSubjectTypeEnumValues;
  static ReviewCreateSubjectTypeEnum valueOf(String name) => _$reviewCreateSubjectTypeEnumValueOf(name);
}

class ReviewCreateReviewScopeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'appointment')
  static const ReviewCreateReviewScopeEnum appointment = _$reviewCreateReviewScopeEnum_appointment;
  @BuiltValueEnumConst(wireName: r'profile')
  static const ReviewCreateReviewScopeEnum profile = _$reviewCreateReviewScopeEnum_profile;

  static Serializer<ReviewCreateReviewScopeEnum> get serializer => _$reviewCreateReviewScopeEnumSerializer;

  const ReviewCreateReviewScopeEnum._(String name): super(name);

  static BuiltSet<ReviewCreateReviewScopeEnum> get values => _$reviewCreateReviewScopeEnumValues;
  static ReviewCreateReviewScopeEnum valueOf(String name) => _$reviewCreateReviewScopeEnumValueOf(name);
}

