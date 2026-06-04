import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'booking_repositories.provider.dart';

part 'dependents_list.provider.g.dart';

@riverpod
Future<List<Dependent>> dependentsList(Ref ref) async {
  final repo = ref.watch(dependentsRepositoryProvider);
  return repo.listDependents();
}
