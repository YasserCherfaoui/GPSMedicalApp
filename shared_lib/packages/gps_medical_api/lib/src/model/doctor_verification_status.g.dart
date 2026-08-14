// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_verification_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DoctorVerificationStatus _$pending = const DoctorVerificationStatus._(
  'pending',
);
const DoctorVerificationStatus _$inReview = const DoctorVerificationStatus._(
  'inReview',
);
const DoctorVerificationStatus _$approved = const DoctorVerificationStatus._(
  'approved',
);
const DoctorVerificationStatus _$approvedPendingActivation =
    const DoctorVerificationStatus._('approvedPendingActivation');
const DoctorVerificationStatus _$rejected = const DoctorVerificationStatus._(
  'rejected',
);

DoctorVerificationStatus _$valueOf(String name) {
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

final BuiltSet<DoctorVerificationStatus> _$values =
    BuiltSet<DoctorVerificationStatus>(const <DoctorVerificationStatus>[
      _$pending,
      _$inReview,
      _$approved,
      _$approvedPendingActivation,
      _$rejected,
    ]);

class _$DoctorVerificationStatusMeta {
  const _$DoctorVerificationStatusMeta();
  DoctorVerificationStatus get pending => _$pending;
  DoctorVerificationStatus get inReview => _$inReview;
  DoctorVerificationStatus get approved => _$approved;
  DoctorVerificationStatus get approvedPendingActivation =>
      _$approvedPendingActivation;
  DoctorVerificationStatus get rejected => _$rejected;
  DoctorVerificationStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<DoctorVerificationStatus> get values => _$values;
}

mixin _$DoctorVerificationStatusMixin {
  // ignore: non_constant_identifier_names
  _$DoctorVerificationStatusMeta get DoctorVerificationStatus =>
      const _$DoctorVerificationStatusMeta();
}

Serializer<DoctorVerificationStatus> _$doctorVerificationStatusSerializer =
    _$DoctorVerificationStatusSerializer();

class _$DoctorVerificationStatusSerializer
    implements PrimitiveSerializer<DoctorVerificationStatus> {
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
  final Iterable<Type> types = const <Type>[DoctorVerificationStatus];
  @override
  final String wireName = 'DoctorVerificationStatus';

  @override
  Object serialize(
    Serializers serializers,
    DoctorVerificationStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  DoctorVerificationStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => DoctorVerificationStatus.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
