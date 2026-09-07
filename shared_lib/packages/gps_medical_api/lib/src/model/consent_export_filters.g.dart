// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_export_filters.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConsentExportFiltersPurposeEnum
_$consentExportFiltersPurposeEnum_dataProcessing =
    const ConsentExportFiltersPurposeEnum._('dataProcessing');
const ConsentExportFiltersPurposeEnum
_$consentExportFiltersPurposeEnum_healthData =
    const ConsentExportFiltersPurposeEnum._('healthData');
const ConsentExportFiltersPurposeEnum
_$consentExportFiltersPurposeEnum_anpdpTerms =
    const ConsentExportFiltersPurposeEnum._('anpdpTerms');
const ConsentExportFiltersPurposeEnum
_$consentExportFiltersPurposeEnum_marketing =
    const ConsentExportFiltersPurposeEnum._('marketing');

ConsentExportFiltersPurposeEnum _$consentExportFiltersPurposeEnumValueOf(
  String name,
) {
  switch (name) {
    case 'dataProcessing':
      return _$consentExportFiltersPurposeEnum_dataProcessing;
    case 'healthData':
      return _$consentExportFiltersPurposeEnum_healthData;
    case 'anpdpTerms':
      return _$consentExportFiltersPurposeEnum_anpdpTerms;
    case 'marketing':
      return _$consentExportFiltersPurposeEnum_marketing;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConsentExportFiltersPurposeEnum>
_$consentExportFiltersPurposeEnumValues =
    BuiltSet<ConsentExportFiltersPurposeEnum>(
      const <ConsentExportFiltersPurposeEnum>[
        _$consentExportFiltersPurposeEnum_dataProcessing,
        _$consentExportFiltersPurposeEnum_healthData,
        _$consentExportFiltersPurposeEnum_anpdpTerms,
        _$consentExportFiltersPurposeEnum_marketing,
      ],
    );

const ConsentExportFiltersCountryEnum _$consentExportFiltersCountryEnum_DZ =
    const ConsentExportFiltersCountryEnum._('DZ');
const ConsentExportFiltersCountryEnum _$consentExportFiltersCountryEnum_TN =
    const ConsentExportFiltersCountryEnum._('TN');

ConsentExportFiltersCountryEnum _$consentExportFiltersCountryEnumValueOf(
  String name,
) {
  switch (name) {
    case 'DZ':
      return _$consentExportFiltersCountryEnum_DZ;
    case 'TN':
      return _$consentExportFiltersCountryEnum_TN;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConsentExportFiltersCountryEnum>
_$consentExportFiltersCountryEnumValues =
    BuiltSet<ConsentExportFiltersCountryEnum>(
      const <ConsentExportFiltersCountryEnum>[
        _$consentExportFiltersCountryEnum_DZ,
        _$consentExportFiltersCountryEnum_TN,
      ],
    );

Serializer<ConsentExportFiltersPurposeEnum>
_$consentExportFiltersPurposeEnumSerializer =
    _$ConsentExportFiltersPurposeEnumSerializer();
Serializer<ConsentExportFiltersCountryEnum>
_$consentExportFiltersCountryEnumSerializer =
    _$ConsentExportFiltersCountryEnumSerializer();

class _$ConsentExportFiltersPurposeEnumSerializer
    implements PrimitiveSerializer<ConsentExportFiltersPurposeEnum> {
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
  final Iterable<Type> types = const <Type>[ConsentExportFiltersPurposeEnum];
  @override
  final String wireName = 'ConsentExportFiltersPurposeEnum';

  @override
  Object serialize(
    Serializers serializers,
    ConsentExportFiltersPurposeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConsentExportFiltersPurposeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConsentExportFiltersPurposeEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ConsentExportFiltersCountryEnumSerializer
    implements PrimitiveSerializer<ConsentExportFiltersCountryEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'DZ': 'DZ',
    'TN': 'TN',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'DZ': 'DZ',
    'TN': 'TN',
  };

  @override
  final Iterable<Type> types = const <Type>[ConsentExportFiltersCountryEnum];
  @override
  final String wireName = 'ConsentExportFiltersCountryEnum';

  @override
  Object serialize(
    Serializers serializers,
    ConsentExportFiltersCountryEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConsentExportFiltersCountryEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConsentExportFiltersCountryEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ConsentExportFilters extends ConsentExportFilters {
  @override
  final DateTime? from;
  @override
  final DateTime? to;
  @override
  final ConsentExportFiltersPurposeEnum? purpose;
  @override
  final ConsentExportFiltersCountryEnum? country;
  @override
  final BuiltList<String>? userIds;

  factory _$ConsentExportFilters([
    void Function(ConsentExportFiltersBuilder)? updates,
  ]) => (ConsentExportFiltersBuilder()..update(updates))._build();

  _$ConsentExportFilters._({
    this.from,
    this.to,
    this.purpose,
    this.country,
    this.userIds,
  }) : super._();
  @override
  ConsentExportFilters rebuild(
    void Function(ConsentExportFiltersBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ConsentExportFiltersBuilder toBuilder() =>
      ConsentExportFiltersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsentExportFilters &&
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
    return (newBuiltValueToStringHelper(r'ConsentExportFilters')
          ..add('from', from)
          ..add('to', to)
          ..add('purpose', purpose)
          ..add('country', country)
          ..add('userIds', userIds))
        .toString();
  }
}

class ConsentExportFiltersBuilder
    implements Builder<ConsentExportFilters, ConsentExportFiltersBuilder> {
  _$ConsentExportFilters? _$v;

  DateTime? _from;
  DateTime? get from => _$this._from;
  set from(DateTime? from) => _$this._from = from;

  DateTime? _to;
  DateTime? get to => _$this._to;
  set to(DateTime? to) => _$this._to = to;

  ConsentExportFiltersPurposeEnum? _purpose;
  ConsentExportFiltersPurposeEnum? get purpose => _$this._purpose;
  set purpose(ConsentExportFiltersPurposeEnum? purpose) =>
      _$this._purpose = purpose;

  ConsentExportFiltersCountryEnum? _country;
  ConsentExportFiltersCountryEnum? get country => _$this._country;
  set country(ConsentExportFiltersCountryEnum? country) =>
      _$this._country = country;

  ListBuilder<String>? _userIds;
  ListBuilder<String> get userIds => _$this._userIds ??= ListBuilder<String>();
  set userIds(ListBuilder<String>? userIds) => _$this._userIds = userIds;

  ConsentExportFiltersBuilder() {
    ConsentExportFilters._defaults(this);
  }

  ConsentExportFiltersBuilder get _$this {
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
  void replace(ConsentExportFilters other) {
    _$v = other as _$ConsentExportFilters;
  }

  @override
  void update(void Function(ConsentExportFiltersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsentExportFilters build() => _build();

  _$ConsentExportFilters _build() {
    _$ConsentExportFilters _$result;
    try {
      _$result =
          _$v ??
          _$ConsentExportFilters._(
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
          r'ConsentExportFilters',
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
