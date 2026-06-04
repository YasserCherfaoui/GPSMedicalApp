import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../discovery/utils/discovery_api_error.dart';

class BookingErrorView extends StatelessWidget {
  const BookingErrorView({
    required this.error,
    required this.onRetry,
    required this.message,
    super.key,
  });

  final Object error;
  final VoidCallback onRetry;
  final String message;

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
    return ErrorState(title: 'Erreur', message: message, onRetry: onRetry);
  }
}
