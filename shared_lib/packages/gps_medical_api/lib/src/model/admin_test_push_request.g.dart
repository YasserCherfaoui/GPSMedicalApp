// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_test_push_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminTestPushRequest extends AdminTestPushRequest {
  @override
  final String userId;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final BuiltMap<String, String>? data;

  factory _$AdminTestPushRequest([
    void Function(AdminTestPushRequestBuilder)? updates,
  ]) => (AdminTestPushRequestBuilder()..update(updates))._build();

  _$AdminTestPushRequest._({
    required this.userId,
    this.title,
    this.body,
    this.data,
  }) : super._();
  @override
  AdminTestPushRequest rebuild(
    void Function(AdminTestPushRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  AdminTestPushRequestBuilder toBuilder() =>
      AdminTestPushRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminTestPushRequest &&
        userId == other.userId &&
        title == other.title &&
        body == other.body &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminTestPushRequest')
          ..add('userId', userId)
          ..add('title', title)
          ..add('body', body)
          ..add('data', data))
        .toString();
  }
}

class AdminTestPushRequestBuilder
    implements Builder<AdminTestPushRequest, AdminTestPushRequestBuilder> {
  _$AdminTestPushRequest? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  MapBuilder<String, String>? _data;
  MapBuilder<String, String> get data =>
      _$this._data ??= MapBuilder<String, String>();
  set data(MapBuilder<String, String>? data) => _$this._data = data;

  AdminTestPushRequestBuilder() {
    AdminTestPushRequest._defaults(this);
  }

  AdminTestPushRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _title = $v.title;
      _body = $v.body;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminTestPushRequest other) {
    _$v = other as _$AdminTestPushRequest;
  }

  @override
  void update(void Function(AdminTestPushRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminTestPushRequest build() => _build();

  _$AdminTestPushRequest _build() {
    _$AdminTestPushRequest _$result;
    try {
      _$result =
          _$v ??
          _$AdminTestPushRequest._(
            userId: BuiltValueNullFieldError.checkNotNull(
              userId,
              r'AdminTestPushRequest',
              'userId',
            ),
            title: title,
            body: body,
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'AdminTestPushRequest',
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
