import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/discovery/utils/geo_name_search.dart';

void main() {
  test('matches empty query', () {
    expect(
      matchesGeoNameQuery(query: '', nameFr: 'Alger', nameAr: 'الجزائر'),
      isTrue,
    );
  });

  test('matches French prefix accent-insensitively', () {
    expect(
      matchesGeoNameQuery(query: 'al', nameFr: 'Alger', nameAr: null),
      isTrue,
    );
    expect(
      matchesGeoNameQuery(query: 'el', nameFr: 'El Oued', nameAr: null),
      isTrue,
    );
    expect(
      matchesGeoNameQuery(query: 'oran', nameFr: 'Oran', nameAr: null),
      isTrue,
    );
    expect(
      matchesGeoNameQuery(query: 'xyz', nameFr: 'Oran', nameAr: null),
      isFalse,
    );
  });

  test('matches Arabic prefix', () {
    expect(
      matchesGeoNameQuery(query: 'الج', nameFr: 'Alger', nameAr: 'الجزائر'),
      isTrue,
    );
  });
}
