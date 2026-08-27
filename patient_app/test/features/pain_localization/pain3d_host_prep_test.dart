import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/pain_localization/models/pain3d_body.dart';
import 'package:patient_app/features/pain_localization/models/pain3d_download_progress.dart';
import 'package:patient_app/features/pain_localization/pain3d_host_prep.dart';
import 'package:patient_app/features/pain_localization/services/asset_download_service.dart';

class _FakeStore implements Pain3dGlbStore {
  _FakeStore({this.cached, this.onEnsure});

  File? cached;
  Stream<Pain3dDownloadProgress> Function(Pain3dBody body)? onEnsure;

  @override
  Future<File?> verifiedFile(Pain3dBody body, {String? expectedSha256}) {
    return Future<File?>.value(cached);
  }

  @override
  Stream<Pain3dDownloadProgress> ensureBody(Pain3dBody body) {
    return onEnsure?.call(body) ?? const Stream.empty();
  }
}

void main() {
  late Directory temp;

  setUp(() async {
    temp = await Directory.systemTemp.createTemp('pain3d_prep_');
  });

  tearDown(() async {
    if (await temp.exists()) await temp.delete(recursive: true);
  });

  test('offline without a cached GLB', () async {
    final result = await Pain3dHostPrep.resolve(
      store: _FakeStore(),
      isOnline: () async => false,
      body: Pain3dBody.male,
    );
    expect(result.status, Pain3dHostPrepStatus.offline);
  });

  test('cached GLB is ready without calling isOnline', () async {
    final glb = File('${temp.path}/full_male_body.glb');
    await glb.writeAsBytes([1, 2, 3], flush: true);
    var onlineCalls = 0;
    final result = await Pain3dHostPrep.resolve(
      store: _FakeStore(cached: glb),
      isOnline: () async {
        onlineCalls++;
        return true;
      },
      body: Pain3dBody.male,
    );
    expect(result.status, Pain3dHostPrepStatus.ready);
    expect(result.file!.path, glb.path);
    expect(onlineCalls, 0);
  });

  test('download progress then ready', () async {
    final glb = File('${temp.path}/full_male_body.glb');
    await glb.writeAsBytes([1, 2, 3], flush: true);
    final seen = <Pain3dDownloadPhase>[];
    final result = await Pain3dHostPrep.resolve(
      store: _FakeStore(
        onEnsure: (_) async* {
          yield const Pain3dDownloadProgress(
            phase: Pain3dDownloadPhase.downloading,
            receivedBytes: 50,
            totalBytes: 100,
          );
          yield Pain3dDownloadProgress.ready(glb, 3);
        },
      ),
      isOnline: () async => true,
      body: Pain3dBody.male,
      onProgress: (progress) => seen.add(progress.phase),
    );
    expect(result.status, Pain3dHostPrepStatus.ready);
    expect(seen, [Pain3dDownloadPhase.downloading, Pain3dDownloadPhase.ready]);
  });

  test('empty download stream is missing', () async {
    final result = await Pain3dHostPrep.resolve(
      store: _FakeStore(),
      isOnline: () async => true,
      body: Pain3dBody.male,
    );
    expect(result.status, Pain3dHostPrepStatus.missing);
  });
}
