import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../auth/auth_exception.dart';
import '../l10n/auth_strings.dart';

void showAuthErrorToast(BuildContext context, Object error) {
  final strings = AuthStrings.of(context);
  final String message;
  if (error is AuthException) {
    message = error.getLocalizedMessage(strings);
  } else {
    message = error.toString();
  }

  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.flatColored,
    title: const Text('Authentification'),
    description: Text(message),
    autoCloseDuration: const Duration(seconds: 4),
    alignment: Alignment.topCenter,
    closeOnClick: true,
    pauseOnHover: true,
    dragToClose: true,
  );
}
