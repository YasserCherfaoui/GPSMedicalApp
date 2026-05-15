// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_medical_documents.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedMedicalDocuments extends PaginatedMedicalDocuments {
  @override
  final BuiltList<MedicalDocument>? data;
  @override
  final PaginationMeta? meta;

  factory _$PaginatedMedicalDocuments([
    void Function(PaginatedMedicalDocumentsBuilder)? updates,
  ]) => (PaginatedMedicalDocumentsBuilder()..update(updates))._build();

  _$PaginatedMedicalDocuments._({this.data, this.meta}) : super._();
  @override
  PaginatedMedicalDocuments rebuild(
    void Function(PaginatedMedicalDocumentsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  PaginatedMedicalDocumentsBuilder toBuilder() =>
      PaginatedMedicalDocumentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedMedicalDocuments &&
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
    return (newBuiltValueToStringHelper(r'PaginatedMedicalDocuments')
          ..add('data', data)
          ..add('meta', meta))
        .toString();
  }
}

class PaginatedMedicalDocumentsBuilder
    implements
        Builder<PaginatedMedicalDocuments, PaginatedMedicalDocumentsBuilder> {
  _$PaginatedMedicalDocuments? _$v;

  ListBuilder<MedicalDocument>? _data;
  ListBuilder<MedicalDocument> get data =>
      _$this._data ??= ListBuilder<MedicalDocument>();
  set data(ListBuilder<MedicalDocument>? data) => _$this._data = data;

  PaginationMetaBuilder? _meta;
  PaginationMetaBuilder get meta => _$this._meta ??= PaginationMetaBuilder();
  set meta(PaginationMetaBuilder? meta) => _$this._meta = meta;

  PaginatedMedicalDocumentsBuilder() {
    PaginatedMedicalDocuments._defaults(this);
  }

  PaginatedMedicalDocumentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedMedicalDocuments other) {
    _$v = other as _$PaginatedMedicalDocuments;
  }

  @override
  void update(void Function(PaginatedMedicalDocumentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedMedicalDocuments build() => _build();

  _$PaginatedMedicalDocuments _build() {
    _$PaginatedMedicalDocuments _$result;
    try {
      _$result =
          _$v ??
          _$PaginatedMedicalDocuments._(
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
          r'PaginatedMedicalDocuments',
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
