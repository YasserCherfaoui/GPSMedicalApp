import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';

/// tests for AnalyticsApi
void main() {
  final instance = GpsMedicalApi().getAnalyticsApi();

  group(AnalyticsApi, () {
    // Entonnoir d'acquisition (recherche → RDV → consultation)
    //
    //Future<Funnel> analyticsAdminFunnelGet({ Date from, Date to }) async
    test('test analyticsAdminFunnelGet', () async {
      // TODO
    });

    // Vue d'ensemble plateforme (admin)
    //
    //Future<AdminOverview> analyticsAdminOverviewGet() async
    test('test analyticsAdminOverviewGet', () async {
      // TODO
    });

    // Vue d'ensemble pour le médecin connecté
    //
    //Future<DoctorOverview> analyticsDoctorOverviewGet({ Date from, Date to }) async
    test('test analyticsDoctorOverviewGet', () async {
      // TODO
    });

    // Séries temporelles (RDV, revenus, no-show)
    //
    //Future<TimeSeries> analyticsDoctorTimeseriesGet(String metric, Date from, Date to, { String granularity }) async
    test('test analyticsDoctorTimeseriesGet', () async {
      // TODO
    });
  });
}
