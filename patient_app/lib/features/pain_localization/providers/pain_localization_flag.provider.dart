import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pain3d_constants.dart';
import '../services/pain3d_analytics.dart';
import '../services/pain3d_body_store.dart';
import '../services/pain_label_catalog.dart';
import '../services/pain_selection_store.dart';

final painLocalizationEnabledProvider = Provider<bool>((ref) {
  return painLocalizationEnabledFromEnv();
});

final pain3dBodyStoreProvider = Provider<Pain3dBodyStore>((ref) {
  return Pain3dBodyStore();
});

final pain3dAnalyticsProvider = Provider<Pain3dAnalytics>((ref) {
  return Pain3dAnalytics();
});

final painSelectionStoreProvider = Provider<PainSelectionStore>((ref) {
  return SecurePainSelectionStore();
});

final painLabelCatalogProvider = FutureProvider<PainLabelCatalog>((ref) {
  return PainLabelCatalog.loadFromBundle();
});
