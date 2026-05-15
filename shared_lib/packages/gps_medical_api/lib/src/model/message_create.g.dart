// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MessageCreate extends MessageCreate {
  @override
  final String? body;
  @override
  final BuiltList<String>? attachmentDocumentIds;

  factory _$MessageCreate([void Function(MessageCreateBuilder)? updates]) =>
      (MessageCreateBuilder()..update(updates))._build();

  _$MessageCreate._({this.body, this.attachmentDocumentIds}) : super._();
  @override
  MessageCreate rebuild(void Function(MessageCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageCreateBuilder toBuilder() => MessageCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageCreate &&
        body == other.body &&
        attachmentDocumentIds == other.attachmentDocumentIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, attachmentDocumentIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessageCreate')
          ..add('body', body)
          ..add('attachmentDocumentIds', attachmentDocumentIds))
        .toString();
  }
}

class MessageCreateBuilder
    implements Builder<MessageCreate, MessageCreateBuilder> {
  _$MessageCreate? _$v;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  ListBuilder<String>? _attachmentDocumentIds;
  ListBuilder<String> get attachmentDocumentIds =>
      _$this._attachmentDocumentIds ??= ListBuilder<String>();
  set attachmentDocumentIds(ListBuilder<String>? attachmentDocumentIds) =>
      _$this._attachmentDocumentIds = attachmentDocumentIds;

  MessageCreateBuilder() {
    MessageCreate._defaults(this);
  }

  MessageCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _body = $v.body;
      _attachmentDocumentIds = $v.attachmentDocumentIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageCreate other) {
    _$v = other as _$MessageCreate;
  }

  @override
  void update(void Function(MessageCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessageCreate build() => _build();

  _$MessageCreate _build() {
    _$MessageCreate _$result;
    try {
      _$result =
          _$v ??
          _$MessageCreate._(
            body: body,
            attachmentDocumentIds: _attachmentDocumentIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'attachmentDocumentIds';
        _attachmentDocumentIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'MessageCreate',
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
