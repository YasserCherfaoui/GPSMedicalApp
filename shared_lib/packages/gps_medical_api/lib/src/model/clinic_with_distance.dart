//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/clinic_service_teaser.dart';
import 'package:gps_medical_api/src/model/address.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/clinic.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_with_distance.g.dart';

/// ClinicWithDistance
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
/// * [distanceKm] 
@BuiltValue()
abstract class ClinicWithDistance implements Clinic, Built<ClinicWithDistance, ClinicWithDistanceBuilder> {
  @BuiltValueField(wireName: r'distance_km')
  double? get distanceKm;

  ClinicWithDistance._();

  factory ClinicWithDistance([void updates(ClinicWithDistanceBuilder b)]) = _$ClinicWithDistance;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicWithDistanceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicWithDistance> get serializer => _$ClinicWithDistanceSerializer();
}

class _$ClinicWithDistanceSerializer implements PrimitiveSerializer<ClinicWithDistance> {
  @override
  final Iterable<Type> types = const [ClinicWithDistance, _$ClinicWithDistance];

  @override
  final String wireName = r'ClinicWithDistance';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicWithDistance object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
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
    if (object.offersTelehealth != null) {
      yield r'offers_telehealth';
      yield serializers.serialize(
        object.offersTelehealth,
        specifiedType: const FullType(bool),
      );
    }
    if (object.distanceKm != null) {
      yield r'distance_km';
      yield serializers.serialize(
        object.distanceKm,
        specifiedType: const FullType(double),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.serviceTeasers != null) {
      yield r'service_teasers';
      yield serializers.serialize(
        object.serviceTeasers,
        specifiedType: const FullType(BuiltList, [FullType(ClinicServiceTeaser)]),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.ratingCount != null) {
      yield r'rating_count';
      yield serializers.serialize(
        object.ratingCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.ratingAverage != null) {
      yield r'rating_average';
      yield serializers.serialize(
        object.ratingAverage,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicWithDistance object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicWithDistanceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'verified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.verified = valueDes;
          break;
        case r'offers_telehealth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.offersTelehealth = valueDes;
          break;
        case r'distance_km':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.distanceKm = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'service_teasers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicServiceTeaser)]),
          ) as BuiltList<ClinicServiceTeaser>;
          result.serviceTeasers.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'rating_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ratingCount = valueDes;
          break;
        case r'rating_average':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.ratingAverage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicWithDistance deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicWithDistanceBuilder();
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

