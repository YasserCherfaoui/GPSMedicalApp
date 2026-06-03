import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/nearby_doctors.provider.dart';
import '../widgets/specialties_picker.dart';

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

  // Custom retro-teal styling configuration for Google Maps (ADR 0009)
  static const String _mapStyleJson = '''
[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#a1feec"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#005e53"
      }
    ]
  }
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
            onPressed: () => _openSpecialtyFilter(),
          ),
        ],
      ),
      body: geoStateAsync.when(
        data: (geoState) {
          final Set<Marker> markers = geoState.doctors.map((doc) {
            final lat = doc.practiceAddress?.latitude?.toDouble();
            final lng = doc.practiceAddress?.longitude?.toDouble();

            // Default to slightly random coordinates near Alger if coordinates are not present
            final position = LatLng(lat ?? geoState.lat, lng ?? geoState.lng);

            return Marker(
              markerId: MarkerId(doc.id ?? ''),
              position: position,
              infoWindow: InfoWindow(
                title: '${doc.title ?? "Dr."} ${doc.fullName ?? ""}',
                snippet: doc.specialties?.firstOrNull?.nameFr,
              ),
              onTap: () {
                setState(() {
                  _selectedDoctor = doc;
                });
              },
            );
          }).toSet();

          return Stack(
            children: [
              // Google Map view
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(geoState.lat, geoState.lng),
                  zoom: 13,
                ),
                markers: markers,
                myLocationEnabled: geoState.permissionGranted,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onMapCreated: (controller) {
                  _mapController = controller;
                  _mapController?.setMapStyle(_mapStyleJson);
                },
                onTap: (_) {
                  setState(() {
                    _selectedDoctor = null;
                  });
                },
              ),

              // Permission Request Overlay if permission not granted
              if (!geoState.permissionGranted)
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
                          ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(nearbyDoctorsProvider.notifier)
                                  .requestLocationPermission();
                            },
                            child: Text(isAr ? 'Autoriser' : 'Autoriser'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              // Floating Controls Overlay (Radius slider and locate button)
              Positioned(
                bottom: _selectedDoctor != null ? 220 : 100,
                left: GpsSpacing.md,
                right: GpsSpacing.md,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Locate Me FAB
                    if (geoState.permissionGranted)
                      FloatingActionButton.small(
                        backgroundColor: colorScheme.surface,
                        foregroundColor: colorScheme.primary,
                        onPressed: () async {
                          final provider = ref.read(
                            nearbyDoctorsProvider.notifier,
                          );
                          await provider.requestLocationPermission();
                          final updatedState = ref
                              .read(nearbyDoctorsProvider)
                              .value;
                          if (updatedState != null) {
                            _mapController?.animateCamera(
                              CameraUpdate.newLatLng(
                                LatLng(updatedState.lat, updatedState.lng),
                              ),
                            );
                          }
                        },
                        child: const Icon(Icons.my_location),
                      ),
                    const SizedBox(height: GpsSpacing.sm),

                    // Radius slider widget
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
                              '${geoState.radiusKm.toStringAsFixed(0)} km',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                            Expanded(
                              child: Slider(
                                value: geoState.radiusKm,
                                min: 1,
                                max: 50,
                                divisions: 10,
                                activeColor: colorScheme.primary,
                                onChanged: (val) {
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

              // Selected Doctor Sheet Card overlay
              if (_selectedDoctor != null)
                Positioned(
                  bottom: GpsSpacing.md,
                  left: GpsSpacing.md,
                  right: GpsSpacing.md,
                  child: GestureDetector(
                    onTap: () {
                      context.push(
                        GpsRoutes.doctorDetail(_selectedDoctor!.id ?? ''),
                      );
                    },
                    child: Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(GpsSpacing.sm),
                        child: Row(
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  GpsRadii.md,
                                ),
                                image: _selectedDoctor!.photoUrl != null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          _selectedDoctor!.photoUrl!,
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                                color: colorScheme.surfaceContainerHighest,
                              ),
                              child: _selectedDoctor!.photoUrl == null
                                  ? Icon(
                                      Icons.person,
                                      color: colorScheme.outline,
                                    )
                                  : null,
                            ),
                            const SizedBox(width: GpsSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_selectedDoctor!.title ?? "Dr."} ${_selectedDoctor!.fullName ?? ""}',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    _selectedDoctor!
                                            .specialties
                                            ?.firstOrNull
                                            ?.nameFr ??
                                        '',
                                    style: theme.textTheme.labelSmall,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${_selectedDoctor!.distanceKm?.toStringAsFixed(1)} km',
                                        style: TextStyle(
                                          color: colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${_selectedDoctor!.consultationFeeDzd} DZD',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(GpsSpacing.md),
            child: ErrorState(
              title: 'Erreur de chargement',
              message: 'Une erreur s\'est produite sur la carte.',
              onRetry: () => ref.refresh(nearbyDoctorsProvider),
            ),
          ),
        ),
      ),
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
