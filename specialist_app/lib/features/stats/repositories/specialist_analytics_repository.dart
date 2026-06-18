import 'package:gps_medical_shared/gps_medical_shared.dart';

class SpecialistAnalyticsRepository {
  SpecialistAnalyticsRepository(this._client);

  final GpsMedicalClient _client;

  Future<DoctorOverview> fetchOverview({Date? from, Date? to}) async {
    final response = await _client.analytics.analyticsDoctorOverviewGet(
      from: from,
      to: to,
    );
    final overview = response.data;
    if (overview == null) {
      throw StateError('Empty analytics overview response');
    }
    return overview;
  }

  Future<TimeSeries> fetchTimeseries({
    required String metric,
    required String granularity,
    required Date from,
    required Date to,
  }) async {
    final response = await _client.analytics.analyticsDoctorTimeseriesGet(
      metric: metric,
      granularity: granularity,
      from: from,
      to: to,
    );
    final series = response.data;
    if (series == null) {
      throw StateError('Empty analytics timeseries response');
    }
    return series;
  }

  Future<({List<Review> reviews, bool hasMore})> fetchReviews({
    required String doctorId,
    required int page,
    int pageSize = 20,
  }) async {
    final response = await _client.reviews.listDoctorReviews(
      doctorId: doctorId,
      page: page,
      pageSize: pageSize,
    );
    final paginated = response.data;
    final items = paginated?.data?.toList() ?? [];
    final meta = paginated?.meta;
    final total = meta?.total ?? items.length;
    final currentPage = meta?.page ?? page;
    final size = meta?.pageSize ?? pageSize;
    final totalPages = meta?.totalPages;
    final hasMore = totalPages != null
        ? currentPage < totalPages
        : currentPage * size < total;
    return (reviews: items, hasMore: hasMore);
  }
}
