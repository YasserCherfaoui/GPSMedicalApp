// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_membership_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicMembershipStatus _$invited = const ClinicMembershipStatus._(
  'invited',
);
const ClinicMembershipStatus _$active = const ClinicMembershipStatus._(
  'active',
);
const ClinicMembershipStatus _$detachRequested = const ClinicMembershipStatus._(
  'detachRequested',
);
const ClinicMembershipStatus _$detached = const ClinicMembershipStatus._(
  'detached',
);
const ClinicMembershipStatus _$refused = const ClinicMembershipStatus._(
  'refused',
);

ClinicMembershipStatus _$valueOf(String name) {
  switch (name) {
    case 'invited':
      return _$invited;
    case 'active':
      return _$active;
    case 'detachRequested':
      return _$detachRequested;
    case 'detached':
      return _$detached;
    case 'refused':
      return _$refused;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicMembershipStatus> _$values =
    BuiltSet<ClinicMembershipStatus>(const <ClinicMembershipStatus>[
      _$invited,
      _$active,
      _$detachRequested,
      _$detached,
      _$refused,
    ]);

class _$ClinicMembershipStatusMeta {
  const _$ClinicMembershipStatusMeta();
  ClinicMembershipStatus get invited => _$invited;
  ClinicMembershipStatus get active => _$active;
  ClinicMembershipStatus get detachRequested => _$detachRequested;
  ClinicMembershipStatus get detached => _$detached;
  ClinicMembershipStatus get refused => _$refused;
  ClinicMembershipStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ClinicMembershipStatus> get values => _$values;
}

mixin _$ClinicMembershipStatusMixin {
  // ignore: non_constant_identifier_names
  _$ClinicMembershipStatusMeta get ClinicMembershipStatus =>
      const _$ClinicMembershipStatusMeta();
}

Serializer<ClinicMembershipStatus> _$clinicMembershipStatusSerializer =
    _$ClinicMembershipStatusSerializer();

class _$ClinicMembershipStatusSerializer
    implements PrimitiveSerializer<ClinicMembershipStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'invited': 'invited',
    'active': 'active',
    'detachRequested': 'detach_requested',
    'detached': 'detached',
    'refused': 'refused',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'invited': 'invited',
    'active': 'active',
    'detach_requested': 'detachRequested',
    'detached': 'detached',
    'refused': 'refused',
  };

  @override
  final Iterable<Type> types = const <Type>[ClinicMembershipStatus];
  @override
  final String wireName = 'ClinicMembershipStatus';

  @override
  Object serialize(
    Serializers serializers,
    ClinicMembershipStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicMembershipStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicMembershipStatus.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
