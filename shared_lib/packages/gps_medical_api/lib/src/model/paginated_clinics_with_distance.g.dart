// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_clinics_with_distance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedClinicsWithDistance extends PaginatedClinicsWithDistance {
  @override
  final BuiltList<ClinicWithDistance>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedClinicsWithDistance([
    void Function(PaginatedClinicsWithDistanceBuilder)? updates,
  ]) => (PaginatedClinicsWithDistanceBuilder()..update(updates))._build();

  _$PaginatedClinicsWithDistance._({this.data, this.meta}) : super._();
  @override
  PaginatedClinicsWithDistance rebuild(
    void Function(PaginatedClinicsWithDistanceBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedClinicsWithDistanceBuilder toBuilder() =>
      PaginatedClinicsWithDistanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedClinicsWithDistance &&
        data == other.data &&
        meta == other.meta;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginatedClinicsWithDistance')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedClinicsWithDistanceBuilder
    implements
        Builder<
          PaginatedClinicsWithDistance,
          PaginatedClinicsWithDistanceBuilder
        > {
  _$PaginatedClinicsWithDistance? _$v;

  ListBuilder<ClinicWithDistance>? _data;
  ListBuilder<ClinicWithDistance> get data =>
      _$this._data ??= ListBuilder<ClinicWithDistance>();
  set data(ListBuilder<ClinicWithDistance>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedClinicsWithDistanceBuilder() {
    PaginatedClinicsWithDistance._defaults(this);
  }

  PaginatedClinicsWithDistanceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedClinicsWithDistance other) {
    _$v = other as _$PaginatedClinicsWithDistance;
  }

  @override
  void update(void Function(PaginatedClinicsWithDistanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedClinicsWithDistance build() => _build();

  _$PaginatedClinicsWithDistance _build() {
    _$PaginatedClinicsWithDistance _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedClinicsWithDistance._(
            data: _data?.build(),
            meta: _meta?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'meta';
        _meta?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedClinicsWithDistance',
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
