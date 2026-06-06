import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/discovery_api_error.dart';

class DiscoveryErrorView extends StatelessWidget {
  const DiscoveryErrorView({
    required this.error,
    required this.onRetry,
    this.defaultTitle,
    this.defaultMessage,
    super.key,
  });

  final Object error;
  final VoidCallback onRetry;
  final String? defaultTitle;
  final String? defaultMessage;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final retryAfter = parseRetryAfterSeconds(error);
    if (retryAfter != null) {
      return ErrorState(
        title: l10n.discoveryRateLimitTitle,
        message: l10n.discoveryRateLimitMessage(retryAfter),
        onRetry: onRetry,
      );
    }
    return ErrorState(
      title: defaultTitle ?? l10n.errorGenericTitle,
      message: defaultMessage ?? l10n.discoveryDoctorsLoadError,
      onRetry: onRetry,
    );
  }
}
