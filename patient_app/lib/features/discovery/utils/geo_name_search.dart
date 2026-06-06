/// Accent-insensitive prefix match for French and Arabic geo names.
bool matchesGeoNameQuery({
  required String query,
  String? nameFr,
  String? nameAr,
}) {
  final trimmed = query.trim().toLowerCase();
  if (trimmed.isEmpty) {
    return true;
  }

  final normalizedFr = _stripFrenchAccents((nameFr ?? '').toLowerCase());
  final nameArLower = (nameAr ?? '').toLowerCase();

  return normalizedFr.startsWith(trimmed) || nameArLower.startsWith(trimmed);
}

String _stripFrenchAccents(String input) {
  const withAccents =
      'àáâãäåçèéêëìíîïñòóôõöùúûüýÿÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝ';
  const withoutAccents =
      'aaaaaaceeeeiiiinooooouuuuyyAAAAAACEEEEIIIINOOOOOUUUUY';
  var output = input;
  for (var i = 0; i < withAccents.length; i++) {
    output = output.replaceAll(withAccents[i], withoutAccents[i]);
  }

  return output;
}
