import 'package:flutter/material.dart';

void showAppSnackBar(
    BuildContext context,
    String message, {
      String? actionLabel,
      VoidCallback? onAction,
    }) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        action: actionLabel == null || onAction == null
            ? null
            : SnackBarAction(label: actionLabel, onPressed: onAction),
      ),
    );
}