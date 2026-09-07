// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_seeded_specialists.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedSeededSpecialists extends PaginatedSeededSpecialists {
  @override
  final BuiltList<SeededSpecialistAdmin> data;
  @override
  final PaginationMeta meta;

  factory _$PaginatedSeededSpecialists([
    void Function(PaginatedSeededSpecialistsBuilder)? updates,
  ]) => (PaginatedSeededSpecialistsBuilder()..update(updates))._build();

  _$PaginatedSeededSpecialists._({required this.data, required this.meta})
    : super._();
  @override
  PaginatedSeededSpecialists rebuild(
    void Function(PaginatedSeededSpecialistsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedSeededSpecialistsBuilder toBuilder() =>
      PaginatedSeededSpecialistsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedSeededSpecialists &&
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
    return (newBuiltValueToStringHelper(r'PaginatedSeededSpecialists')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedSeededSpecialistsBuilder
    implements
        Builder<PaginatedSeededSpecialists, PaginatedSeededSpecialistsBuilder> {
  _$PaginatedSeededSpecialists? _$v;

  ListBuilder<SeededSpecialistAdmin>? _data;
  ListBuilder<SeededSpecialistAdmin> get data =>
      _$this._data ??= ListBuilder<SeededSpecialistAdmin>();
  set data(ListBuilder<SeededSpecialistAdmin>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedSeededSpecialistsBuilder() {
    PaginatedSeededSpecialists._defaults(this);
  }

  PaginatedSeededSpecialistsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _meta = $v.meta.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedSeededSpecialists other) {
    _$v = other as _$PaginatedSeededSpecialists;
  }

  @override
  void update(void Function(PaginatedSeededSpecialistsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedSeededSpecialists build() => _build();

  _$PaginatedSeededSpecialists _build() {
    _$PaginatedSeededSpecialists _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedSeededSpecialists._(
            data: data.build(),
            meta: meta.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'PaginatedSeededSpecialists',
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
