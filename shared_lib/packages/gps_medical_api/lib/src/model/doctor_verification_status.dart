//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'doctor_verification_status.g.dart';

class DoctorVerificationStatus extends EnumClass {

  /// Statut du dossier médecin. `approved` implique `Doctor.verified=true` (shell vérifié / offre patient). `approved_pending_activation` : credentials acceptés, activation marché TN différée (`verified=false`) jusqu'au flag `TN_SPECIALIST_ACTIVATION`. Voir addendum-1.1.1.md. 
  @BuiltValueEnumConst(wireName: r'pending')
  static const DoctorVerificationStatus pending = _$pending;
  /// Statut du dossier médecin. `approved` implique `Doctor.verified=true` (shell vérifié / offre patient). `approved_pending_activation` : credentials acceptés, activation marché TN différée (`verified=false`) jusqu'au flag `TN_SPECIALIST_ACTIVATION`. Voir addendum-1.1.1.md. 
  @BuiltValueEnumConst(wireName: r'in_review')
  static const DoctorVerificationStatus inReview = _$inReview;
  /// Statut du dossier médecin. `approved` implique `Doctor.verified=true` (shell vérifié / offre patient). `approved_pending_activation` : credentials acceptés, activation marché TN différée (`verified=false`) jusqu'au flag `TN_SPECIALIST_ACTIVATION`. Voir addendum-1.1.1.md. 
  @BuiltValueEnumConst(wireName: r'approved')
  static const DoctorVerificationStatus approved = _$approved;
  /// Statut du dossier médecin. `approved` implique `Doctor.verified=true` (shell vérifié / offre patient). `approved_pending_activation` : credentials acceptés, activation marché TN différée (`verified=false`) jusqu'au flag `TN_SPECIALIST_ACTIVATION`. Voir addendum-1.1.1.md. 
  @BuiltValueEnumConst(wireName: r'approved_pending_activation')
  static const DoctorVerificationStatus approvedPendingActivation = _$approvedPendingActivation;
  /// Statut du dossier médecin. `approved` implique `Doctor.verified=true` (shell vérifié / offre patient). `approved_pending_activation` : credentials acceptés, activation marché TN différée (`verified=false`) jusqu'au flag `TN_SPECIALIST_ACTIVATION`. Voir addendum-1.1.1.md. 
  @BuiltValueEnumConst(wireName: r'rejected')
  static const DoctorVerificationStatus rejected = _$rejected;

  static Serializer<DoctorVerificationStatus> get serializer => _$doctorVerificationStatusSerializer;

  const DoctorVerificationStatus._(String name): super(name);

  static BuiltSet<DoctorVerificationStatus> get values => _$values;
  static DoctorVerificationStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class DoctorVerificationStatusMixin = Object with _$DoctorVerificationStatusMixin;

