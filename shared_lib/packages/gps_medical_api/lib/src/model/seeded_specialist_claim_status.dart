//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'seeded_specialist_claim_status.g.dart';

class SeededSpecialistClaimStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'unclaimed')
  static const SeededSpecialistClaimStatus unclaimed = _$unclaimed;
  @BuiltValueEnumConst(wireName: r'claim_in_review')
  static const SeededSpecialistClaimStatus claimInReview = _$claimInReview;
  @BuiltValueEnumConst(wireName: r'claimed')
  static const SeededSpecialistClaimStatus claimed = _$claimed;

  static Serializer<SeededSpecialistClaimStatus> get serializer => _$seededSpecialistClaimStatusSerializer;

  const SeededSpecialistClaimStatus._(String name): super(name);

  static BuiltSet<SeededSpecialistClaimStatus> get values => _$values;
  static SeededSpecialistClaimStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SeededSpecialistClaimStatusMixin = Object with _$SeededSpecialistClaimStatusMixin;

