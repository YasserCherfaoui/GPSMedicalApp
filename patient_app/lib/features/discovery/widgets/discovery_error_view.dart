import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/discovery_api_error.dart';

class DiscoveryErrorView extends StatelessWidget {
  const DiscoveryErrorView({
    required this.error,
    required this.onRetry,
    this.defaultTitle = 'Erreur de connexion',
    this.defaultMessage = 'Impossible de charger les données.',
    super.key,
  });

  final Object error;
  final VoidCallback onRetry;
  final String defaultTitle;
  final String defaultMessage;

  @override
  Widget build(BuildContext context) {
    final retryAfter = parseRetryAfterSeconds(error);
    if (retryAfter != null) {
      return ErrorState(
        title: 'Trop de requêtes',
        message:
            'Veuillez patienter $retryAfter seconde${retryAfter > 1 ? 's' : ''} avant de réessayer.',
        onRetry: onRetry,
      );
    }
    return ErrorState(
      title: defaultTitle,
      message: defaultMessage,
      onRetry: onRetry,
    );
  }
}
