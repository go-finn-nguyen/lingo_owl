import 'package:flutter/material.dart';

import '../../router/coordinator.dart';

Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  String defaultActionText = 'OK',
  VoidCallback? onConfirmPressed,
  VoidCallback? onCancelPressed,
}) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: content != null ? Text(content) : null,
      actions: [
        if (cancelActionText != null)
          TextButton(
            child: Text(cancelActionText),
            onPressed: () {
              LCoordinator.onBack(false);
              onCancelPressed?.call();
            },
          ),
        TextButton(
          child: Text(defaultActionText),
          onPressed: () {
            LCoordinator.onBack(true);
            onConfirmPressed?.call();
          },
        ),
      ],
    ),
  );
}

Future<void> showNotImplementedAlertDialog({required BuildContext context}) =>
    showAlertDialog(
      context: context,
      title: 'Not implemented',
    );

Future<void> showSignInRequiredDialog({
  required BuildContext context,
  String? content,
}) =>
    showAlertDialog(
      context: context,
      title: 'Sign in required!',
      content: content,
      cancelActionText: 'Cancel',
      defaultActionText: 'Sign in',
      onConfirmPressed: LCoordinator.showSignInScreen,
    );
