/// Brand naming and asset paths from `branding/`.
abstract final class GpsBrand {
  static const String name = 'GPS Médical';
  static const String nameWithCountry = 'GPS Médical Algérie';
  static const String splashTitle = 'GPS MÉDICAL';

  static const String iconGradientAsset =
      'packages/gps_medical_shared/assets/branding/medora_icon_gradient.png';
  static const String iconPrimaryAsset =
      'packages/gps_medical_shared/assets/branding/medora_icon_primary.png';
  static const String wordmarkGradientAsset =
      'packages/gps_medical_shared/assets/branding/medora_wordmark_gradient.png';

  /// Default in-app mark (gradient icon on light backgrounds).
  static const String logoAsset = iconGradientAsset;
}
