/// Maps search radius (km) to a Google Maps zoom level so the visible area
/// roughly matches the selected rayon.
double zoomLevelForRadiusKm(double radiusKm) {
  const minKm = 1.0;
  const maxKm = 50.0;
  const zoomAtMinKm = 15.0;
  const zoomAtMaxKm = 9.0;

  final clamped = radiusKm.clamp(minKm, maxKm);
  final t = (clamped - minKm) / (maxKm - minKm);
  return zoomAtMaxKm + (zoomAtMinKm - zoomAtMaxKm) * (1 - t);
}
