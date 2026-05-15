// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_doctors_with_distance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedDoctorsWithDistance extends PaginatedDoctorsWithDistance {
  @override
  final BuiltList<DoctorWithDistance>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedDoctorsWithDistance([
    void Function(PaginatedDoctorsWithDistanceBuilder)? updates,
  ]) => (PaginatedDoctorsWithDistanceBuilder()..update(updates))._build();

  _$PaginatedDoctorsWithDistance._({this.data, this.meta}) : super._();
  @override
  PaginatedDoctorsWithDistance rebuild(
    void Function(PaginatedDoctorsWithDistanceBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedDoctorsWithDistanceBuilder toBuilder() =>
      PaginatedDoctorsWithDistanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedDoctorsWithDistance &&
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
    return (newBuiltValueToStringHelper(r'PaginatedDoctorsWithDistance')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedDoctorsWithDistanceBuilder
    implements
        Builder<
          PaginatedDoctorsWithDistance,
          PaginatedDoctorsWithDistanceBuilder
        > {
  _$PaginatedDoctorsWithDistance? _$v;

  ListBuilder<DoctorWithDistance>? _data;
  ListBuilder<DoctorWithDistance> get data =>
      _$this._data ??= ListBuilder<DoctorWithDistance>();
  set data(ListBuilder<DoctorWithDistance>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedDoctorsWithDistanceBuilder() {
    PaginatedDoctorsWithDistance._defaults(this);
  }

  PaginatedDoctorsWithDistanceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedDoctorsWithDistance other) {
    _$v = other as _$PaginatedDoctorsWithDistance;
  }

  @override
  void update(void Function(PaginatedDoctorsWithDistanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedDoctorsWithDistance build() => _build();

  _$PaginatedDoctorsWithDistance _build() {
    _$PaginatedDoctorsWithDistance _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedDoctorsWithDistance._(
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
          r'PaginatedDoctorsWithDistance',
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
