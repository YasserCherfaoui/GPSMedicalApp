import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../services/asset_download_service.dart';

final pain3dSupportDirProvider = FutureProvider<Directory>((ref) async {
  return getApplicationSupportDirectory();
});

final pain3dGlbStoreProvider = FutureProvider<Pain3dGlbStore>((ref) async {
  final support = await ref.watch(pain3dSupportDirProvider.future);
  return AssetDownloadService(
    dio: Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(minutes: 5),
      ),
    ),
    cacheRoot: Directory('${support.path}/pain3d'),
  );
});
