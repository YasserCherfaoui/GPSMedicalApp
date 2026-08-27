/// Body GLB requested from R2 / served from the versioned cache.
enum Pain3dBody { male, female }

extension Pain3dBodyGlb on Pain3dBody {
  String get glbFileName => switch (this) {
    Pain3dBody.male => 'full_male_body.glb',
    Pain3dBody.female => 'full_female_body.glb',
  };
}
