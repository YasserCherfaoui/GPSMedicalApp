// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggest_get200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchSuggestGet200Response extends SearchSuggestGet200Response {
  @override
  final BuiltList<SuggestItem>? doctors;
  @override
  final BuiltList<SuggestItem>? specialties;
  @override
  final BuiltList<SuggestItem>? locations;

  factory _$SearchSuggestGet200Response([
    void Function(SearchSuggestGet200ResponseBuilder)? updates,
  ]) => (SearchSuggestGet200ResponseBuilder()..update(updates))._build();

  _$SearchSuggestGet200Response._({
    this.doctors,
    this.specialties,
    this.locations,
  }) : super._();
  @override
  SearchSuggestGet200Response rebuild(
    void Function(SearchSuggestGet200ResponseBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  SearchSuggestGet200ResponseBuilder toBuilder() =>
      SearchSuggestGet200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchSuggestGet200Response &&
        doctors == other.doctors &&
        specialties == other.specialties &&
        locations == other.locations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, doctors.hashCode);
    _$hash = $jc(_$hash, specialties.hashCode);
    _$hash = $jc(_$hash, locations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchSuggestGet200Response')
          ..add('doctors', doctors)
          ..add('specialties', specialties)
          ..add('locations', locations))
        .toString();
  }
}

class SearchSuggestGet200ResponseBuilder
    implements
        Builder<
          SearchSuggestGet200Response,
          SearchSuggestGet200ResponseBuilder
        > {
  _$SearchSuggestGet200Response? _$v;

  ListBuilder<SuggestItem>? _doctors;
  ListBuilder<SuggestItem> get doctors =>
      _$this._doctors ??= ListBuilder<SuggestItem>();
  set doctors(ListBuilder<SuggestItem>? doctors) => _$this._doctors = doctors;

  ListBuilder<SuggestItem>? _specialties;
  ListBuilder<SuggestItem> get specialties =>
      _$this._specialties ??= ListBuilder<SuggestItem>();
  set specialties(ListBuilder<SuggestItem>? specialties) =>
      _$this._specialties = specialties;

  ListBuilder<SuggestItem>? _locations;
  ListBuilder<SuggestItem> get locations =>
      _$this._locations ??= ListBuilder<SuggestItem>();
  set locations(ListBuilder<SuggestItem>? locations) =>
      _$this._locations = locations;

  SearchSuggestGet200ResponseBuilder() {
    SearchSuggestGet200Response._defaults(this);
  }

  SearchSuggestGet200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doctors = $v.doctors?.toBuilder();
      _specialties = $v.specialties?.toBuilder();
      _locations = $v.locations?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchSuggestGet200Response other) {
    _$v = other as _$SearchSuggestGet200Response;
  }

  @override
  void update(void Function(SearchSuggestGet200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchSuggestGet200Response build() => _build();

  _$SearchSuggestGet200Response _build() {
    _$SearchSuggestGet200Response _$result;
    try {
      _$result =
          _$v ??
          _$SearchSuggestGet200Response._(
            doctors: _doctors?.build(),
            specialties: _specialties?.build(),
            locations: _locations?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctors';
        _doctors?.build();
        _$failedField = 'specialties';
        _specialties?.build();
        _$failedField = 'locations';
        _locations?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'SearchSuggestGet200Response',
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
