import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/nearby_doctors.provider.dart';
import '../utils/map_marker_cluster.dart';
import '../utils/map_zoom_for_radius.dart';
import '../widgets/discovery_error_view.dart';
import '../widgets/doctor_card_tile.dart';
import '../widgets/specialties_picker.dart';
import '../widgets/wilaya_commune_picker.dart';

class NearbyDoctorsMapScreen extends ConsumerStatefulWidget {
  const NearbyDoctorsMapScreen({super.key});

  @override
  ConsumerState<NearbyDoctorsMapScreen> createState() =>
      _NearbyDoctorsMapScreenState();
}

class _NearbyDoctorsMapScreenState
    extends ConsumerState<NearbyDoctorsMapScreen> {
  GoogleMapController? _mapController;
  DoctorWithDistance? _selectedDoctor;
  double _mapZoom = zoomLevelForRadiusKm(5);
  double? _sliderRadiusKm;

  static const String _mapStyleJson = '''
[
  {"elementType": "geometry", "stylers": [{"color": "#f5f5f5"}]},
  {"elementType": "labels.text.fill", "stylers": [{"color": "#616161"}]},
  {"elementType": "labels.text.stroke", "stylers": [{"color": "#f5f5f5"}]},
  {"featureType": "administrative.land_parcel", "elementType": "labels.text.fill", "stylers": [{"color": "#bdbdbd"}]},
  {"featureType": "poi", "elementType": "geometry", "stylers": [{"color": "#eeeeee"}]},
  {"featureType": "poi", "elementType": "labels.text.fill", "stylers": [{"color": "#757575"}]},
  {"featureType": "road", "elementType": "geometry", "stylers": [{"color": "#ffffff"}]},
  {"featureType": "road.arterial", "elementType": "labels.text.fill", "stylers": [{"color": "#757575"}]},
  {"featureType": "road.highway", "elementType": "geometry", "stylers": [{"color": "#dadada"}]},
  {"featureType": "water", "elementType": "geometry", "stylers": [{"color": "#a1feec"}]},
  {"featureType": "water", "elementType": "labels.text.fill", "stylers": [{"color": "#005e53"}]}
]
  ''';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final geoStateAsync = ref.watch(nearbyDoctorsProvider);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(isAr ? 'Médecins à proximité' : 'Médecins à proximité'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: _openSpecialtyFilter,
          ),
        ],
      ),
      body: geoStateAsync.when(
        data: (geoState) => _buildMapStack(
          context,
          geoState,
          theme,
          colorScheme,
          isAr,
          isRefetching: geoStateAsync.isRefreshing,
        ),
        loading: () {
          final cached = geoStateAsync.value;
          if (cached != null) {
            return _buildMapStack(
              context,
              cached,
              theme,
              colorScheme,
              isAr,
              isRefetching: true,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(GpsSpacing.md),
            child: DiscoveryErrorView(
              error: err,
              defaultTitle: 'Erreur de chargement',
              defaultMessage: 'Une erreur s\'est produite sur la carte.',
              onRetry: () => ref.refresh(nearbyDoctorsProvider),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMapStack(
    BuildContext context,
    NearbyDoctorsState geoState,
    ThemeData theme,
    ColorScheme colorScheme,
    bool isAr, {
    bool isRefetching = false,
  }) {
    final displayRadius = _sliderRadiusKm ?? geoState.radiusKm;
    final mapZoomForRadius = zoomLevelForRadiusKm(displayRadius);

    final clusters = clusterNearbyDoctors(
      doctors: geoState.doctors,
      zoom: _mapZoom,
    );

    final markers = clusters.map((cluster) {
      if (cluster.isCluster) {
        return Marker(
          markerId: MarkerId('cluster-${cluster.id}'),
          position: cluster.position,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ),
          infoWindow: InfoWindow(
            title: '${cluster.doctors.length} médecins',
          ),
          onTap: () {
            _mapController?.animateCamera(
              CameraUpdate.newLatLngZoom(cluster.position, 13),
            );
          },
        );
      }

      final doc = cluster.doctors.first;
      return Marker(
        markerId: MarkerId(doc.id ?? cluster.id),
        position: cluster.position,
        onTap: () => setState(() => _selectedDoctor = doc),
      );
    }).toSet();

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(geoState.lat, geoState.lng),
            zoom: mapZoomForRadius,
          ),
          markers: markers,
          myLocationEnabled: geoState.permissionGranted,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: (controller) async {
            _mapController = controller;
            try {
              await _mapController?.setMapStyle(_mapStyleJson);
            } catch (_) {
              // If styling fails, keep the default map tiles visible.
            }
            _syncMapZoomToRadius(
              displayRadius,
              geoState.lat,
              geoState.lng,
              animate: false,
            );
          },
          onCameraMove: (position) {
            final zoom = position.zoom;
            if ((zoom - _mapZoom).abs() > 0.3) {
              setState(() => _mapZoom = zoom);
            }
          },
          onTap: (_) => setState(() => _selectedDoctor = null),
        ),

        if (geoState.usesManualLocation)
          Positioned(
            top: GpsSpacing.md,
            left: GpsSpacing.md,
            right: GpsSpacing.md,
            child: Card(
              color: colorScheme.surface.withValues(alpha: 0.92),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: GpsSpacing.md,
                  vertical: GpsSpacing.sm,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_city_outlined,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: GpsSpacing.sm),
                    Expanded(
                      child: Text(
                        _manualLocationBannerLabel(geoState, isAr),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _openWilayaFallback,
                      child: Text(isAr ? 'Modifier' : 'Modifier'),
                    ),
                    if (geoState.permissionGranted) ...[
                      const SizedBox(width: GpsSpacing.xs),
                      TextButton(
                        onPressed: () async {
                          await ref
                              .read(nearbyDoctorsProvider.notifier)
                              .useDeviceLocation();
                          final updated =
                              ref.read(nearbyDoctorsProvider).value;
                          if (updated != null) {
                            _syncMapZoomToRadius(
                              updated.radiusKm,
                              updated.lat,
                              updated.lng,
                            );
                          }
                        },
                        child: Text(
                          isAr ? 'Ma position' : 'Ma position',
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

        if (!geoState.permissionGranted && !geoState.usesManualLocation)
          Positioned(
            top: GpsSpacing.md,
            left: GpsSpacing.md,
            right: GpsSpacing.md,
            child: Card(
              color: colorScheme.surface.withValues(alpha: 0.9),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(GpsSpacing.md),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isAr
                          ? 'Autoriser la localisation pour voir les médecins autour de vous.'
                          : 'Autoriser la localisation pour voir les médecins autour de vous.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: GpsSpacing.sm),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => ref
                                .read(nearbyDoctorsProvider.notifier)
                                .requestLocationPermission(),
                            child: Text(isAr ? 'Autoriser' : 'Autoriser'),
                          ),
                        ),
                        const SizedBox(width: GpsSpacing.sm),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _openWilayaFallback,
                            child: Text(
                              isAr
                                  ? 'Choisir une wilaya'
                                  : 'Choisir une wilaya',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

        Positioned(
          bottom: _selectedDoctor != null ? 220 : 100,
          left: GpsSpacing.md,
          right: GpsSpacing.md,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.small(
                    heroTag: 'map_wilaya',
                    backgroundColor: colorScheme.surface,
                    foregroundColor: colorScheme.primary,
                    tooltip: isAr ? 'Choisir wilaya' : 'Choisir wilaya',
                    onPressed: _openWilayaFallback,
                    child: const Icon(Icons.location_city_outlined),
                  ),
                  if (geoState.permissionGranted) ...[
                    const SizedBox(width: GpsSpacing.sm),
                    FloatingActionButton.small(
                      heroTag: 'map_gps',
                      backgroundColor: colorScheme.surface,
                      foregroundColor: colorScheme.primary,
                      tooltip: isAr ? 'Ma position' : 'Ma position',
                      onPressed: () async {
                        if (geoState.usesManualLocation) {
                          await ref
                              .read(nearbyDoctorsProvider.notifier)
                              .useDeviceLocation();
                        } else {
                          await ref
                              .read(nearbyDoctorsProvider.notifier)
                              .requestLocationPermission();
                        }
                        final updated = ref.read(nearbyDoctorsProvider).value;
                        if (updated != null) {
                          _syncMapZoomToRadius(
                            updated.radiusKm,
                            updated.lat,
                            updated.lng,
                          );
                        }
                      },
                      child: Icon(
                        geoState.usesManualLocation
                            ? Icons.my_location
                            : Icons.my_location_outlined,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: GpsSpacing.sm),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: GpsSpacing.md,
                    vertical: GpsSpacing.xs,
                  ),
                  child: Row(
                    children: [
                      Text(
                        isAr ? 'Rayon : ' : 'Rayon : ',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${displayRadius.toStringAsFixed(0)} km',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      Expanded(
                        child: Slider(
                          value: displayRadius,
                          min: 1,
                          max: 50,
                          divisions: 10,
                          activeColor: colorScheme.primary,
                          onChanged: isRefetching
                              ? null
                              : (val) {
                                  setState(() => _sliderRadiusKm = val);
                                  _syncMapZoomToRadius(
                                    val,
                                    geoState.lat,
                                    geoState.lng,
                                  );
                                },
                          onChangeEnd: (val) {
                            setState(() => _sliderRadiusKm = null);
                            _syncMapZoomToRadius(val, geoState.lat, geoState.lng);
                            ref
                                .read(nearbyDoctorsProvider.notifier)
                                .updateRadius(val);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        if (_selectedDoctor != null)
          Positioned(
            bottom: GpsSpacing.md,
            left: GpsSpacing.md,
            right: GpsSpacing.md,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(GpsRadii.lg),
              child: buildDoctorCardTile(
                context: context,
                doc: _selectedDoctor!,
                isAr: isAr,
                userLat: geoState.lat,
                userLng: geoState.lng,
              ),
            ),
          ),

        if (isRefetching)
          const Positioned(
            top: GpsSpacing.md,
            right: GpsSpacing.md,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(GpsSpacing.sm),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _syncMapZoomToRadius(
    double radiusKm,
    double lat,
    double lng, {
    bool animate = true,
  }) {
    final zoom = zoomLevelForRadiusKm(radiusKm);
    if ((zoom - _mapZoom).abs() < 0.05 && !animate) return;
    setState(() => _mapZoom = zoom);

    final target = LatLng(lat, lng);
    final update = CameraUpdate.newLatLngZoom(target, zoom);
    final controller = _mapController;
    if (controller == null) return;

    if (animate) {
      controller.animateCamera(update);
    } else {
      controller.moveCamera(update);
    }
  }

  String _manualLocationBannerLabel(NearbyDoctorsState geoState, bool isAr) {
    final wilaya = geoState.manualWilaya;
    if (wilaya == null) {
      return isAr ? 'Recherche par wilaya' : 'Recherche par wilaya';
    }
    final wilayaName = isAr
        ? (wilaya.nameAr ?? wilaya.nameFr ?? wilaya.code)
        : (wilaya.nameFr ?? wilaya.code);
    final commune = geoState.manualCommune;
    if (commune != null) {
      final communeName = isAr
          ? (commune.nameAr ?? commune.nameFr ?? '')
          : (commune.nameFr ?? '');
      if (communeName.isNotEmpty) {
        return isAr ? '$communeName، $wilayaName' : '$communeName, $wilayaName';
      }
    }
    return isAr
        ? 'Recherche par wilaya ($wilayaName)'
        : 'Recherche par wilaya ($wilayaName)';
  }

  void _openWilayaFallback() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return WilayaCommunePicker(
          onLocationChanged: (wilaya, commune) {
            if (wilaya == null) return;
            ref.read(nearbyDoctorsProvider.notifier).setManualLocation(
                  wilaya: wilaya,
                  commune: commune,
                );
            final updated = ref.read(nearbyDoctorsProvider).value;
            final lat = updated?.lat ?? 36.7538;
            final lng = updated?.lng ?? 3.0588;
            final radius = updated?.radiusKm ?? 5;
            _syncMapZoomToRadius(radius, lat, lng);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _openSpecialtyFilter() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        final currentGeo = ref.read(nearbyDoctorsProvider).value;
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  AppBar(
                    title: const Text('Sélectionner une spécialité'),
                    automaticallyImplyLeading: false,
                    actions: [
                      TextButton(
                        onPressed: () {
                          ref
                              .read(nearbyDoctorsProvider.notifier)
                              .filterBySpecialty(null);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Effacer'),
                      ),
                    ],
                  ),
                  SpecialtiesPicker(
                    selectedSpecialtyId: currentGeo?.specialtyId,
                    onSpecialtySelected: (spec) {
                      ref
                          .read(nearbyDoctorsProvider.notifier)
                          .filterBySpecialty(spec.id);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
