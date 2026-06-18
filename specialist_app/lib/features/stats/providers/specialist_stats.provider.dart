import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../profile/providers/specialist_profile.provider.dart';
import '../repositories/specialist_analytics_repository.dart';

final specialistAnalyticsRepositoryProvider =
    Provider<SpecialistAnalyticsRepository>((ref) {
      return SpecialistAnalyticsRepository(ref.watch(gpsMedicalClientProvider));
    });

final specialistStatsOverviewProvider = FutureProvider.family<
    DoctorOverview,
    ({Date? from, Date? to})
>((ref, range) {
  return ref
      .read(specialistAnalyticsRepositoryProvider)
      .fetchOverview(from: range.from, to: range.to);
});

final specialistStatsTimeseriesProvider = FutureProvider.family<
    TimeSeries,
    ({String metric, String granularity, Date from, Date to})
>((ref, params) {
  return ref.read(specialistAnalyticsRepositoryProvider).fetchTimeseries(
    metric: params.metric,
    granularity: params.granularity,
    from: params.from,
    to: params.to,
  );
});

final specialistDoctorReviewsProvider = FutureProvider<List<Review>>((ref) async {
  final profile = await ref.watch(specialistProfileProvider.future);
  final doctorId = profile.id;
  if (doctorId == null || doctorId.isEmpty) return [];
  final result = await ref
      .read(specialistAnalyticsRepositoryProvider)
      .fetchReviews(doctorId: doctorId, page: 1);
  return result.reviews;
});
