import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity.provider.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> isOnline(Ref ref) async* {
  final connectivity = Connectivity();
  final initial = await connectivity.checkConnectivity();
  yield _isConnected(initial);
  await for (final result in connectivity.onConnectivityChanged) {
    yield _isConnected(result);
  }
}

bool _isConnected(List<ConnectivityResult> results) {
  return results.any(
    (r) =>
        r == ConnectivityResult.mobile ||
        r == ConnectivityResult.wifi ||
        r == ConnectivityResult.ethernet,
  );
}
