// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_consent_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RevokeConsentRequestConsentTypeEnum
_$revokeConsentRequestConsentTypeEnum_dataProcessing =
    const RevokeConsentRequestConsentTypeEnum._('dataProcessing');
const RevokeConsentRequestConsentTypeEnum
_$revokeConsentRequestConsentTypeEnum_healthData =
    const RevokeConsentRequestConsentTypeEnum._('healthData');
const RevokeConsentRequestConsentTypeEnum
_$revokeConsentRequestConsentTypeEnum_anpdpTerms =
    const RevokeConsentRequestConsentTypeEnum._('anpdpTerms');
const RevokeConsentRequestConsentTypeEnum
_$revokeConsentRequestConsentTypeEnum_marketing =
    const RevokeConsentRequestConsentTypeEnum._('marketing');

RevokeConsentRequestConsentTypeEnum
_$revokeConsentRequestConsentTypeEnumValueOf(String name) {
  switch (name) {
    case 'dataProcessing':
      return _$revokeConsentRequestConsentTypeEnum_dataProcessing;
    case 'healthData':
      return _$revokeConsentRequestConsentTypeEnum_healthData;
    case 'anpdpTerms':
      return _$revokeConsentRequestConsentTypeEnum_anpdpTerms;
    case 'marketing':
      return _$revokeConsentRequestConsentTypeEnum_marketing;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<RevokeConsentRequestConsentTypeEnum>
_$revokeConsentRequestConsentTypeEnumValues =
    BuiltSet<RevokeConsentRequestConsentTypeEnum>(
      const <RevokeConsentRequestConsentTypeEnum>[
        _$revokeConsentRequestConsentTypeEnum_dataProcessing,
        _$revokeConsentRequestConsentTypeEnum_healthData,
        _$revokeConsentRequestConsentTypeEnum_anpdpTerms,
        _$revokeConsentRequestConsentTypeEnum_marketing,
      ],
    );

Serializer<RevokeConsentRequestConsentTypeEnum>
_$revokeConsentRequestConsentTypeEnumSerializer =
    _$RevokeConsentRequestConsentTypeEnumSerializer();

class _$RevokeConsentRequestConsentTypeEnumSerializer
    implements PrimitiveSerializer<RevokeConsentRequestConsentTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'dataProcessing': 'data_processing',
    'healthData': 'health_data',
    'anpdpTerms': 'anpdp_terms',
    'marketing': 'marketing',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'data_processing': 'dataProcessing',
    'health_data': 'healthData',
    'anpdp_terms': 'anpdpTerms',
    'marketing': 'marketing',
  };

  @override
  final Iterable<Type> types = const <Type>[
    RevokeConsentRequestConsentTypeEnum,
  ];
  @override
  final String wireName = 'RevokeConsentRequestConsentTypeEnum';

  @override
  Object serialize(
    Serializers serializers,
    RevokeConsentRequestConsentTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  RevokeConsentRequestConsentTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => RevokeConsentRequestConsentTypeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$RevokeConsentRequest extends RevokeConsentRequest {
  @override
  final RevokeConsentRequestConsentTypeEnum consentType;

  factory _$RevokeConsentRequest([
    void Function(RevokeConsentRequestBuilder)? updates,
  ]) => (RevokeConsentRequestBuilder()..update(updates))._build();

  _$RevokeConsentRequest._({required this.consentType}) : super._();
  @override
  RevokeConsentRequest rebuild(
    void Function(RevokeConsentRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  RevokeConsentRequestBuilder toBuilder() =>
      RevokeConsentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RevokeConsentRequest && consentType == other.consentType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, consentType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'RevokeConsentRequest',
    )..add('consentType', consentType)).toString();
  }
}

class RevokeConsentRequestBuilder
    implements Builder<RevokeConsentRequest, RevokeConsentRequestBuilder> {
  _$RevokeConsentRequest? _$v;

  RevokeConsentRequestConsentTypeEnum? _consentType;
  RevokeConsentRequestConsentTypeEnum? get consentType => _$this._consentType;
  set consentType(RevokeConsentRequestConsentTypeEnum? consentType) =>
      _$this._consentType = consentType;

  RevokeConsentRequestBuilder() {
    RevokeConsentRequest._defaults(this);
  }

  RevokeConsentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _consentType = $v.consentType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RevokeConsentRequest other) {
    _$v = other as _$RevokeConsentRequest;
  }

  @override
  void update(void Function(RevokeConsentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RevokeConsentRequest build() => _build();

  _$RevokeConsentRequest _build() {
    final _$result =
        _$v ??
        _$RevokeConsentRequest._(
          consentType: BuiltValueNullFieldError.checkNotNull(
            consentType,
            r'RevokeConsentRequest',
            'consentType',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
