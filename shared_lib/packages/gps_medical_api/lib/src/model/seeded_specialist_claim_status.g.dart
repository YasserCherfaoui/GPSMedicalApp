// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seeded_specialist_claim_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SeededSpecialistClaimStatus _$unclaimed =
    const SeededSpecialistClaimStatus._('unclaimed');
const SeededSpecialistClaimStatus _$claimInReview =
    const SeededSpecialistClaimStatus._('claimInReview');
const SeededSpecialistClaimStatus _$claimed =
    const SeededSpecialistClaimStatus._('claimed');

SeededSpecialistClaimStatus _$valueOf(String name) {
  switch (name) {
    case 'unclaimed':
      return _$unclaimed;
    case 'claimInReview':
      return _$claimInReview;
    case 'claimed':
      return _$claimed;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<SeededSpecialistClaimStatus> _$values =
    BuiltSet<SeededSpecialistClaimStatus>(const <SeededSpecialistClaimStatus>[
      _$unclaimed,
      _$claimInReview,
      _$claimed,
    ]);

class _$SeededSpecialistClaimStatusMeta {
  const _$SeededSpecialistClaimStatusMeta();
  SeededSpecialistClaimStatus get unclaimed => _$unclaimed;
  SeededSpecialistClaimStatus get claimInReview => _$claimInReview;
  SeededSpecialistClaimStatus get claimed => _$claimed;
  SeededSpecialistClaimStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<SeededSpecialistClaimStatus> get values => _$values;
}

mixin _$SeededSpecialistClaimStatusMixin {
  // ignore: non_constant_identifier_names
  _$SeededSpecialistClaimStatusMeta get SeededSpecialistClaimStatus =>
      const _$SeededSpecialistClaimStatusMeta();
}

Serializer<SeededSpecialistClaimStatus>
_$seededSpecialistClaimStatusSerializer =
    _$SeededSpecialistClaimStatusSerializer();

class _$SeededSpecialistClaimStatusSerializer
    implements PrimitiveSerializer<SeededSpecialistClaimStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'unclaimed': 'unclaimed',
    'claimInReview': 'claim_in_review',
    'claimed': 'claimed',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'unclaimed': 'unclaimed',
    'claim_in_review': 'claimInReview',
    'claimed': 'claimed',
  };

  @override
  final Iterable<Type> types = const <Type>[SeededSpecialistClaimStatus];
  @override
  final String wireName = 'SeededSpecialistClaimStatus';

  @override
  Object serialize(
    Serializers serializers,
    SeededSpecialistClaimStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  SeededSpecialistClaimStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => SeededSpecialistClaimStatus.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
