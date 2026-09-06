import 'package:url_launcher/url_launcher.dart';

Future<bool> openConnectOnboardingUrl(String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null) return false;
  if (await canLaunchUrl(uri)) {
    return launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  }
  return false;
}
