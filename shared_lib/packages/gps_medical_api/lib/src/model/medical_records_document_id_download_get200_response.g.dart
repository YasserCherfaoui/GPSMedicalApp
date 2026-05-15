// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_records_document_id_download_get200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MedicalRecordsDocumentIdDownloadGet200Response
    extends MedicalRecordsDocumentIdDownloadGet200Response {
  @override
  final String? url;
  @override
  final DateTime? expiresAt;

  factory _$MedicalRecordsDocumentIdDownloadGet200Response([
    void Function(MedicalRecordsDocumentIdDownloadGet200ResponseBuilder)?
    updates,
  ]) =>
      (MedicalRecordsDocumentIdDownloadGet200ResponseBuilder()..update(updates))
          ._build();

  _$MedicalRecordsDocumentIdDownloadGet200Response._({this.url, this.expiresAt})
    : super._();
  @override
  MedicalRecordsDocumentIdDownloadGet200Response rebuild(
    void Function(MedicalRecordsDocumentIdDownloadGet200ResponseBuilder)
    updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  MedicalRecordsDocumentIdDownloadGet200ResponseBuilder toBuilder() =>
      MedicalRecordsDocumentIdDownloadGet200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicalRecordsDocumentIdDownloadGet200Response &&
        url == other.url &&
        expiresAt == other.expiresAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'MedicalRecordsDocumentIdDownloadGet200Response',
          )
          ..add('url', url)
          ..add('expiresAt', expiresAt))
        .toString();
  }
}

class MedicalRecordsDocumentIdDownloadGet200ResponseBuilder
    implements
        Builder<
          MedicalRecordsDocumentIdDownloadGet200Response,
          MedicalRecordsDocumentIdDownloadGet200ResponseBuilder
        > {
  _$MedicalRecordsDocumentIdDownloadGet200Response? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DateTime? _expiresAt;
  DateTime? get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime? expiresAt) => _$this._expiresAt = expiresAt;

  MedicalRecordsDocumentIdDownloadGet200ResponseBuilder() {
    MedicalRecordsDocumentIdDownloadGet200Response._defaults(this);
  }

  MedicalRecordsDocumentIdDownloadGet200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _expiresAt = $v.expiresAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicalRecordsDocumentIdDownloadGet200Response other) {
    _$v = other as _$MedicalRecordsDocumentIdDownloadGet200Response;
  }

  @override
  void update(
    void Function(MedicalRecordsDocumentIdDownloadGet200ResponseBuilder)?
    updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  MedicalRecordsDocumentIdDownloadGet200Response build() => _build();

  _$MedicalRecordsDocumentIdDownloadGet200Response _build() {
    final _$result =
        _$v ??
        _$MedicalRecordsDocumentIdDownloadGet200Response._(
          url: url,
          expiresAt: expiresAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
