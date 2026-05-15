// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_attachments_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MessageAttachmentsInner extends MessageAttachmentsInner {
  @override
  final String? documentId;
  @override
  final String? fileName;
  @override
  final String? mimeType;

  factory _$MessageAttachmentsInner([
    void Function(MessageAttachmentsInnerBuilder)? updates,
  ]) => (MessageAttachmentsInnerBuilder()..update(updates))._build();

  _$MessageAttachmentsInner._({this.documentId, this.fileName, this.mimeType})
    : super._();
  @override
  MessageAttachmentsInner rebuild(
    void Function(MessageAttachmentsInnerBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  MessageAttachmentsInnerBuilder toBuilder() =>
      MessageAttachmentsInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageAttachmentsInner &&
        documentId == other.documentId &&
        fileName == other.fileName &&
        mimeType == other.mimeType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, documentId.hashCode);
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jc(_$hash, mimeType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessageAttachmentsInner')
          ..add('documentId', documentId)
          ..add('fileName', fileName)
          ..add('mimeType', mimeType))
        .toString();
  }
}

class MessageAttachmentsInnerBuilder
    implements
        Builder<MessageAttachmentsInner, MessageAttachmentsInnerBuilder> {
  _$MessageAttachmentsInner? _$v;

  String? _documentId;
  String? get documentId => _$this._documentId;
  set documentId(String? documentId) => _$this._documentId = documentId;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  String? _mimeType;
  String? get mimeType => _$this._mimeType;
  set mimeType(String? mimeType) => _$this._mimeType = mimeType;

  MessageAttachmentsInnerBuilder() {
    MessageAttachmentsInner._defaults(this);
  }

  MessageAttachmentsInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _documentId = $v.documentId;
      _fileName = $v.fileName;
      _mimeType = $v.mimeType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageAttachmentsInner other) {
    _$v = other as _$MessageAttachmentsInner;
  }

  @override
  void update(void Function(MessageAttachmentsInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessageAttachmentsInner build() => _build();

  _$MessageAttachmentsInner _build() {
    final _$result =
        _$v ??
        _$MessageAttachmentsInner._(
          documentId: documentId,
          fileName: fileName,
          mimeType: mimeType,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
