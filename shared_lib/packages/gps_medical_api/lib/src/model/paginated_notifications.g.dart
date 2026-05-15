// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_notifications.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedNotifications extends PaginatedNotifications {
  @override
  final BuiltList<Notification>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedNotifications([
    void Function(PaginatedNotificationsBuilder)? updates,
  ]) => (PaginatedNotificationsBuilder()..update(updates))._build();

  _$PaginatedNotifications._({this.data, this.meta}) : super._();
  @override
  PaginatedNotifications rebuild(
    void Function(PaginatedNotificationsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedNotificationsBuilder toBuilder() =>
      PaginatedNotificationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedNotifications &&
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
    return (newBuiltValueToStringHelper(r'PaginatedNotifications')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedNotificationsBuilder
    implements Builder<PaginatedNotifications, PaginatedNotificationsBuilder> {
  _$PaginatedNotifications? _$v;

  ListBuilder<Notification>? _data;
  ListBuilder<Notification> get data =>
      _$this._data ??= ListBuilder<Notification>();
  set data(ListBuilder<Notification>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedNotificationsBuilder() {
    PaginatedNotifications._defaults(this);
  }

  PaginatedNotificationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedNotifications other) {
    _$v = other as _$PaginatedNotifications;
  }

  @override
  void update(void Function(PaginatedNotificationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedNotifications build() => _build();

  _$PaginatedNotifications _build() {
    _$PaginatedNotifications _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedNotifications._(
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
          r'PaginatedNotifications',
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
