// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClinicStatus _$pending = const ClinicStatus._('pending');
const ClinicStatus _$active = const ClinicStatus._('active');
const ClinicStatus _$suspended = const ClinicStatus._('suspended');
const ClinicStatus _$rejected = const ClinicStatus._('rejected');

ClinicStatus _$valueOf(String name) {
  switch (name) {
    case 'pending':
      return _$pending;
    case 'active':
      return _$active;
    case 'suspended':
      return _$suspended;
    case 'rejected':
      return _$rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClinicStatus> _$values = BuiltSet<ClinicStatus>(
  const <ClinicStatus>[_$pending, _$active, _$suspended, _$rejected],
);

class _$ClinicStatusMeta {
  const _$ClinicStatusMeta();
  ClinicStatus get pending => _$pending;
  ClinicStatus get active => _$active;
  ClinicStatus get suspended => _$suspended;
  ClinicStatus get rejected => _$rejected;
  ClinicStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ClinicStatus> get values => _$values;
}

mixin _$ClinicStatusMixin {
  // ignore: non_constant_identifier_names
  _$ClinicStatusMeta get ClinicStatus => const _$ClinicStatusMeta();
}

Serializer<ClinicStatus> _$clinicStatusSerializer = _$ClinicStatusSerializer();

class _$ClinicStatusSerializer implements PrimitiveSerializer<ClinicStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'active': 'active',
    'suspended': 'suspended',
    'rejected': 'rejected',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'active': 'active',
    'suspended': 'suspended',
    'rejected': 'rejected',
  };

  @override
  final Iterable<Type> types = const <Type>[ClinicStatus];
  @override
  final String wireName = 'ClinicStatus';

  @override
  Object serialize(
    Serializers serializers,
    ClinicStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ClinicStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ClinicStatus.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
