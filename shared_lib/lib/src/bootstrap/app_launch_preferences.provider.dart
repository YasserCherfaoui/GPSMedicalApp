import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_launch_preferences.dart';

part 'app_launch_preferences.provider.g.dart';

@Riverpod(keepAlive: true)
AppLaunchPreferences appLaunchPreferences(Ref ref) {
  return InMemoryAppLaunchPreferences();
}
