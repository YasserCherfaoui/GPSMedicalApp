//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_specialist_teaser.g.dart';

/// ClinicSpecialistTeaser
///
/// Properties:
/// * [id] 
/// * [fullName] 
/// * [title] 
/// * [specialtyCode] 
/// * [photoUrl] 
@BuiltValue()
abstract class ClinicSpecialistTeaser implements Built<ClinicSpecialistTeaser, ClinicSpecialistTeaserBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'full_name')
  String? get fullName;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'specialty_code')
  String? get specialtyCode;

  @BuiltValueField(wireName: r'photo_url')
  String? get photoUrl;

  ClinicSpecialistTeaser._();

  factory ClinicSpecialistTeaser([void updates(ClinicSpecialistTeaserBuilder b)]) = _$ClinicSpecialistTeaser;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicSpecialistTeaserBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicSpecialistTeaser> get serializer => _$ClinicSpecialistTeaserSerializer();
}

class _$ClinicSpecialistTeaserSerializer implements PrimitiveSerializer<ClinicSpecialistTeaser> {
  @override
  final Iterable<Type> types = const [ClinicSpecialistTeaser, _$ClinicSpecialistTeaser];

  @override
  final String wireName = r'ClinicSpecialistTeaser';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicSpecialistTeaser object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType(String),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.specialtyCode != null) {
      yield r'specialty_code';
      yield serializers.serialize(
        object.specialtyCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.photoUrl != null) {
      yield r'photo_url';
      yield serializers.serialize(
        object.photoUrl,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicSpecialistTeaser object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicSpecialistTeaserBuilder result,
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
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'specialty_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.specialtyCode = valueDes;
          break;
        case r'photo_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.photoUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicSpecialistTeaser deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicSpecialistTeaserBuilder();
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

