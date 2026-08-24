//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_verification_status.g.dart';

class ClinicVerificationStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const ClinicVerificationStatus pending = _$pending;
  @BuiltValueEnumConst(wireName: r'in_review')
  static const ClinicVerificationStatus inReview = _$inReview;
  @BuiltValueEnumConst(wireName: r'approved')
  static const ClinicVerificationStatus approved = _$approved;
  @BuiltValueEnumConst(wireName: r'approved_pending_activation')
  static const ClinicVerificationStatus approvedPendingActivation = _$approvedPendingActivation;
  @BuiltValueEnumConst(wireName: r'rejected')
  static const ClinicVerificationStatus rejected = _$rejected;

  static Serializer<ClinicVerificationStatus> get serializer => _$clinicVerificationStatusSerializer;

  const ClinicVerificationStatus._(String name): super(name);

  static BuiltSet<ClinicVerificationStatus> get values => _$values;
  static ClinicVerificationStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ClinicVerificationStatusMixin = Object with _$ClinicVerificationStatusMixin;

