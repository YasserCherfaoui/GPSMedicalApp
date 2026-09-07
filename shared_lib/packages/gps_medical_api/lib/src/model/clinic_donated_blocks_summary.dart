//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_donated_blocks_summary.g.dart';

/// ClinicDonatedBlocksSummary
///
/// Properties:
/// * [windowFrom] 
/// * [windowTo] 
/// * [activeMembers] 
/// * [blockCount] 
/// * [donatedHours] 
@BuiltValue()
abstract class ClinicDonatedBlocksSummary implements Built<ClinicDonatedBlocksSummary, ClinicDonatedBlocksSummaryBuilder> {
  @BuiltValueField(wireName: r'window_from')
  DateTime get windowFrom;

  @BuiltValueField(wireName: r'window_to')
  DateTime get windowTo;

  @BuiltValueField(wireName: r'active_members')
  int get activeMembers;

  @BuiltValueField(wireName: r'block_count')
  int get blockCount;

  @BuiltValueField(wireName: r'donated_hours')
  double get donatedHours;

  ClinicDonatedBlocksSummary._();

  factory ClinicDonatedBlocksSummary([void updates(ClinicDonatedBlocksSummaryBuilder b)]) = _$ClinicDonatedBlocksSummary;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicDonatedBlocksSummaryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicDonatedBlocksSummary> get serializer => _$ClinicDonatedBlocksSummarySerializer();
}

class _$ClinicDonatedBlocksSummarySerializer implements PrimitiveSerializer<ClinicDonatedBlocksSummary> {
  @override
  final Iterable<Type> types = const [ClinicDonatedBlocksSummary, _$ClinicDonatedBlocksSummary];

  @override
  final String wireName = r'ClinicDonatedBlocksSummary';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicDonatedBlocksSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'window_from';
    yield serializers.serialize(
      object.windowFrom,
      specifiedType: const FullType(DateTime),
    );
    yield r'window_to';
    yield serializers.serialize(
      object.windowTo,
      specifiedType: const FullType(DateTime),
    );
    yield r'active_members';
    yield serializers.serialize(
      object.activeMembers,
      specifiedType: const FullType(int),
    );
    yield r'block_count';
    yield serializers.serialize(
      object.blockCount,
      specifiedType: const FullType(int),
    );
    yield r'donated_hours';
    yield serializers.serialize(
      object.donatedHours,
      specifiedType: const FullType(double),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicDonatedBlocksSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicDonatedBlocksSummaryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'window_from':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.windowFrom = valueDes;
          break;
        case r'window_to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.windowTo = valueDes;
          break;
        case r'active_members':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.activeMembers = valueDes;
          break;
        case r'block_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.blockCount = valueDes;
          break;
        case r'donated_hours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.donatedHours = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicDonatedBlocksSummary deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicDonatedBlocksSummaryBuilder();
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

