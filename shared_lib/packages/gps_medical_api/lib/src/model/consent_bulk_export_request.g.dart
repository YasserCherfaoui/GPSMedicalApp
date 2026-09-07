// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_bulk_export_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConsentBulkExportRequestPurposeEnum
_$consentBulkExportRequestPurposeEnum_dataProcessing =
    const ConsentBulkExportRequestPurposeEnum._('dataProcessing');
const ConsentBulkExportRequestPurposeEnum
_$consentBulkExportRequestPurposeEnum_healthData =
    const ConsentBulkExportRequestPurposeEnum._('healthData');
const ConsentBulkExportRequestPurposeEnum
_$consentBulkExportRequestPurposeEnum_anpdpTerms =
    const ConsentBulkExportRequestPurposeEnum._('anpdpTerms');
const ConsentBulkExportRequestPurposeEnum
_$consentBulkExportRequestPurposeEnum_marketing =
    const ConsentBulkExportRequestPurposeEnum._('marketing');

ConsentBulkExportRequestPurposeEnum
_$consentBulkExportRequestPurposeEnumValueOf(String name) {
  switch (name) {
    case 'dataProcessing':
      return _$consentBulkExportRequestPurposeEnum_dataProcessing;
    case 'healthData':
      return _$consentBulkExportRequestPurposeEnum_healthData;
    case 'anpdpTerms':
      return _$consentBulkExportRequestPurposeEnum_anpdpTerms;
    case 'marketing':
      return _$consentBulkExportRequestPurposeEnum_marketing;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConsentBulkExportRequestPurposeEnum>
_$consentBulkExportRequestPurposeEnumValues =
    BuiltSet<ConsentBulkExportRequestPurposeEnum>(
      const <ConsentBulkExportRequestPurposeEnum>[
        _$consentBulkExportRequestPurposeEnum_dataProcessing,
        _$consentBulkExportRequestPurposeEnum_healthData,
        _$consentBulkExportRequestPurposeEnum_anpdpTerms,
        _$consentBulkExportRequestPurposeEnum_marketing,
      ],
    );

const ConsentBulkExportRequestCountryEnum
_$consentBulkExportRequestCountryEnum_DZ =
    const ConsentBulkExportRequestCountryEnum._('DZ');
const ConsentBulkExportRequestCountryEnum
_$consentBulkExportRequestCountryEnum_TN =
    const ConsentBulkExportRequestCountryEnum._('TN');

ConsentBulkExportRequestCountryEnum
_$consentBulkExportRequestCountryEnumValueOf(String name) {
  switch (name) {
    case 'DZ':
      return _$consentBulkExportRequestCountryEnum_DZ;
    case 'TN':
      return _$consentBulkExportRequestCountryEnum_TN;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConsentBulkExportRequestCountryEnum>
_$consentBulkExportRequestCountryEnumValues =
    BuiltSet<ConsentBulkExportRequestCountryEnum>(
      const <ConsentBulkExportRequestCountryEnum>[
        _$consentBulkExportRequestCountryEnum_DZ,
        _$consentBulkExportRequestCountryEnum_TN,
      ],
    );

Serializer<ConsentBulkExportRequestPurposeEnum>
_$consentBulkExportRequestPurposeEnumSerializer =
    _$ConsentBulkExportRequestPurposeEnumSerializer();
Serializer<ConsentBulkExportRequestCountryEnum>
_$consentBulkExportRequestCountryEnumSerializer =
    _$ConsentBulkExportRequestCountryEnumSerializer();

class _$ConsentBulkExportRequestPurposeEnumSerializer
    implements PrimitiveSerializer<ConsentBulkExportRequestPurposeEnum> {
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
    ConsentBulkExportRequestPurposeEnum,
  ];
  @override
  final String wireName = 'ConsentBulkExportRequestPurposeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ConsentBulkExportRequestPurposeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConsentBulkExportRequestPurposeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConsentBulkExportRequestPurposeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ConsentBulkExportRequestCountryEnumSerializer
    implements PrimitiveSerializer<ConsentBulkExportRequestCountryEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'DZ': 'DZ',
    'TN': 'TN',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'DZ': 'DZ',
    'TN': 'TN',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ConsentBulkExportRequestCountryEnum,
  ];
  @override
  final String wireName = 'ConsentBulkExportRequestCountryEnum';

  @override
  Object serialize(
    Serializers serializers,
    ConsentBulkExportRequestCountryEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConsentBulkExportRequestCountryEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConsentBulkExportRequestCountryEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ConsentBulkExportRequest extends ConsentBulkExportRequest {
  @override
  final DateTime? from;
  @override
  final DateTime? to;
  @override
  final ConsentBulkExportRequestPurposeEnum? purpose;
  @override
  final ConsentBulkExportRequestCountryEnum? country;
  @override
  final BuiltList<String>? userIds;

  factory _$ConsentBulkExportRequest([
    void Function(ConsentBulkExportRequestBuilder)? updates,
  ]) => (ConsentBulkExportRequestBuilder()..update(updates))._build();

  _$ConsentBulkExportRequest._({
    this.from,
    this.to,
    this.purpose,
    this.country,
    this.userIds,
  }) : super._();
  @override
  ConsentBulkExportRequest rebuild(
    void Function(ConsentBulkExportRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ConsentBulkExportRequestBuilder toBuilder() =>
      ConsentBulkExportRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsentBulkExportRequest &&
        from == other.from &&
        to == other.to &&
        purpose == other.purpose &&
        country == other.country &&
        userIds == other.userIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jc(_$hash, purpose.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, userIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsentBulkExportRequest')
          ..add('from', from)
          ..add('to', to)
          ..add('purpose', purpose)
          ..add('country', country)
          ..add('userIds', userIds))
        .toString();
  }
}

class ConsentBulkExportRequestBuilder
    implements
        Builder<ConsentBulkExportRequest, ConsentBulkExportRequestBuilder> {
  _$ConsentBulkExportRequest? _$v;

  DateTime? _from;
  DateTime? get from => _$this._from;
  set from(DateTime? from) => _$this._from = from;

  DateTime? _to;
  DateTime? get to => _$this._to;
  set to(DateTime? to) => _$this._to = to;

  ConsentBulkExportRequestPurposeEnum? _purpose;
  ConsentBulkExportRequestPurposeEnum? get purpose => _$this._purpose;
  set purpose(ConsentBulkExportRequestPurposeEnum? purpose) =>
      _$this._purpose = purpose;

  ConsentBulkExportRequestCountryEnum? _country;
  ConsentBulkExportRequestCountryEnum? get country => _$this._country;
  set country(ConsentBulkExportRequestCountryEnum? country) =>
      _$this._country = country;

  ListBuilder<String>? _userIds;
  ListBuilder<String> get userIds => _$this._userIds ??= ListBuilder<String>();
  set userIds(ListBuilder<String>? userIds) => _$this._userIds = userIds;

  ConsentBulkExportRequestBuilder() {
    ConsentBulkExportRequest._defaults(this);
  }

  ConsentBulkExportRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _from = $v.from;
      _to = $v.to;
      _purpose = $v.purpose;
      _country = $v.country;
      _userIds = $v.userIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsentBulkExportRequest other) {
    _$v = other as _$ConsentBulkExportRequest;
  }

  @override
  void update(void Function(ConsentBulkExportRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsentBulkExportRequest build() => _build();

  _$ConsentBulkExportRequest _build() {
    _$ConsentBulkExportRequest _$result;
    try {
      _$result =
          _$v ??
          _$ConsentBulkExportRequest._(
            from: from,
            to: to,
            purpose: purpose,
            country: country,
            userIds: _userIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userIds';
        _userIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ConsentBulkExportRequest',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
