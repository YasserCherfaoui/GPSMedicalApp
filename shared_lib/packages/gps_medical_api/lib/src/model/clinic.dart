//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/clinic_service_teaser.dart';
import 'package:gps_medical_api/src/model/address.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic.g.dart';

/// Clinic
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [description] 
/// * [address] 
/// * [countryCode] - ISO 3166-1 alpha-2. DZ, TN, et codes Schengen-UE. Activation `verified=true` hors DZ bloquée jusqu'à G-3. 
/// * [verified] 
/// * [ratingAverage] 
/// * [ratingCount] 
/// * [offersTelehealth] 
/// * [serviceTeasers] 
@BuiltValue(instantiable: false)
abstract class Clinic  {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'address')
  Address? get address;

  /// ISO 3166-1 alpha-2. DZ, TN, et codes Schengen-UE. Activation `verified=true` hors DZ bloquée jusqu'à G-3. 
  @BuiltValueField(wireName: r'country_code')
  String? get countryCode;

  @BuiltValueField(wireName: r'verified')
  bool? get verified;

  @BuiltValueField(wireName: r'rating_average')
  double? get ratingAverage;

  @BuiltValueField(wireName: r'rating_count')
  int? get ratingCount;

  @BuiltValueField(wireName: r'offers_telehealth')
  bool? get offersTelehealth;

  @BuiltValueField(wireName: r'service_teasers')
  BuiltList<ClinicServiceTeaser>? get serviceTeasers;

  @BuiltValueSerializer(custom: true)
  static Serializer<Clinic> get serializer => _$ClinicSerializer();
}

class _$ClinicSerializer implements PrimitiveSerializer<Clinic> {
  @override
  final Iterable<Type> types = const [Clinic];

  @override
  final String wireName = r'Clinic';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Clinic object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType(Address),
      );
    }
    if (object.countryCode != null) {
      yield r'country_code';
      yield serializers.serialize(
        object.countryCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.verified != null) {
      yield r'verified';
      yield serializers.serialize(
        object.verified,
        specifiedType: const FullType(bool),
      );
    }
    if (object.ratingAverage != null) {
      yield r'rating_average';
      yield serializers.serialize(
        object.ratingAverage,
        specifiedType: const FullType(double),
      );
    }
    if (object.ratingCount != null) {
      yield r'rating_count';
      yield serializers.serialize(
        object.ratingCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.offersTelehealth != null) {
      yield r'offers_telehealth';
      yield serializers.serialize(
        object.offersTelehealth,
        specifiedType: const FullType(bool),
      );
    }
    if (object.serviceTeasers != null) {
      yield r'service_teasers';
      yield serializers.serialize(
        object.serviceTeasers,
        specifiedType: const FullType(BuiltList, [FullType(ClinicServiceTeaser)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Clinic object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  Clinic deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($Clinic)) as $Clinic;
  }
}

/// a concrete implementation of [Clinic], since [Clinic] is not instantiable
@BuiltValue(instantiable: true)
abstract class $Clinic implements Clinic, Built<$Clinic, $ClinicBuilder> {
  $Clinic._();

  factory $Clinic([void Function($ClinicBuilder)? updates]) = _$$Clinic;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ClinicBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$Clinic> get serializer => _$$ClinicSerializer();
}

class _$$ClinicSerializer implements PrimitiveSerializer<$Clinic> {
  @override
  final Iterable<Type> types = const [$Clinic, _$$Clinic];

  @override
  final String wireName = r'$Clinic';

  @override
  Object serialize(
    Serializers serializers,
    $Clinic object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(Clinic))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Address),
          ) as Address;
          result.address.replace(valueDes);
          break;
        case r'country_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.countryCode = valueDes;
          break;
        case r'verified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.verified = valueDes;
          break;
        case r'rating_average':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.ratingAverage = valueDes;
          break;
        case r'rating_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ratingCount = valueDes;
          break;
        case r'offers_telehealth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.offersTelehealth = valueDes;
          break;
        case r'service_teasers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicServiceTeaser)]),
          ) as BuiltList<ClinicServiceTeaser>;
          result.serviceTeasers.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $Clinic deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $ClinicBuilder();
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

