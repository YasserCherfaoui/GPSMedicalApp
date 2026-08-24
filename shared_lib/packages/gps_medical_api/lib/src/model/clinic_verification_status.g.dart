// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_verification_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicVerificationStatus _$pending = const ClinicVerificationStatus._(
  'pending',
);
const ClinicVerificationStatus _$inReview = const ClinicVerificationStatus._(
  'inReview',
);
const ClinicVerificationStatus _$approved = const ClinicVerificationStatus._(
  'approved',
);
const ClinicVerificationStatus _$approvedPendingActivation =
    const ClinicVerificationStatus._('approvedPendingActivation');
const ClinicVerificationStatus _$rejected = const ClinicVerificationStatus._(
  'rejected',
);

ClinicVerificationStatus _$valueOf(String name) {
  switch (name) {
    case 'pending':
      return _$pending;
    case 'inReview':
      return _$inReview;
    case 'approved':
      return _$approved;
    case 'approvedPendingActivation':
      return _$approvedPendingActivation;
    case 'rejected':
      return _$rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicVerificationStatus> _$values =
    BuiltSet<ClinicVerificationStatus>(const <ClinicVerificationStatus>[
      _$pending,
      _$inReview,
      _$approved,
      _$approvedPendingActivation,
      _$rejected,
    ]);

class _$ClinicVerificationStatusMeta {
  const _$ClinicVerificationStatusMeta();
  ClinicVerificationStatus get pending => _$pending;
  ClinicVerificationStatus get inReview => _$inReview;
  ClinicVerificationStatus get approved => _$approved;
  ClinicVerificationStatus get approvedPendingActivation =>
      _$approvedPendingActivation;
  ClinicVerificationStatus get rejected => _$rejected;
  ClinicVerificationStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ClinicVerificationStatus> get values => _$values;
}

mixin _$ClinicVerificationStatusMixin {
  // ignore: non_constant_identifier_names
  _$ClinicVerificationStatusMeta get ClinicVerificationStatus =>
      const _$ClinicVerificationStatusMeta();
}

Serializer<ClinicVerificationStatus> _$clinicVerificationStatusSerializer =
    _$ClinicVerificationStatusSerializer();

class _$ClinicVerificationStatusSerializer
    implements PrimitiveSerializer<ClinicVerificationStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'inReview': 'in_review',
    'approved': 'approved',
    'approvedPendingActivation': 'approved_pending_activation',
    'rejected': 'rejected',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'in_review': 'inReview',
    'approved': 'approved',
    'approved_pending_activation': 'approvedPendingActivation',
    'rejected': 'rejected',
  };

  @override
  final Iterable<Type> types = const <Type>[ClinicVerificationStatus];
  @override
  final String wireName = 'ClinicVerificationStatus';

  @override
  Object serialize(
    Serializers serializers,
    ClinicVerificationStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicVerificationStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicVerificationStatus.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
