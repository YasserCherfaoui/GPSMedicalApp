import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showAuthErrorToast(BuildContext context, String message) {
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
