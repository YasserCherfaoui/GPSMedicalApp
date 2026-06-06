/// Wilaya codes are one- or two-digit strings (`01`–`58`); communes use UUIDs.
bool isWilayaCode(String id) => RegExp(r'^\d{1,2}$').hasMatch(id);

/// Backend location labels look like `Hydra (Alger)`.
String? parseWilayaNameFromSuggestLabel(String? label) {
  if (label == null || label.isEmpty) return null;
  final match = RegExp(r'\(([^)]+)\)\s*$').firstMatch(label.trim());
  return match?.group(1)?.trim();
}
