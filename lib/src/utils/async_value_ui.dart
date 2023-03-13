import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../router/coordinator.dart';
import '../widgets/common/snack_bars.dart';
import 'logger.dart';

extension AsyncValueUi on AsyncValue {
  void showError(BuildContext context, {String? errorMessage}) {
    if (isRefreshing || !hasError) return;

    late String? errorMessage;

    if (error is FirebaseException) {
      errorMessage = (error as FirebaseException).message;
    } else if (error is StripeException) {
      errorMessage = (error as StripeException).error.localizedMessage;
    } else {
      log.e(
        '-------ERROR-------',
        error,
        stackTrace,
      );
      return;
    }

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        LSnackBar.failure(
          errorMessage: errorMessage ?? 'An error has occurred!',
        ),
      );
  }

  void showLoadingDialog(BuildContext context, AsyncValue<dynamic>? previous) {
    if (isLoading) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => WillPopScope(
          onWillPop: () => Future.value(false),
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if ((previous?.isLoading ?? false) && !isLoading) {
      LCoordinator.onBack();
    }
  }

  void showSuccess(BuildContext context, {required String content}) {
    if (!isRefreshing && hasValue) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(LSnackBar.success(content: content));
    }
  }

  void showErrorLoadingSuccessState(
    BuildContext context, {
    required AsyncValue<dynamic>? previousState,
    String? errorMessage,
    required String successMessage,
  }) {
    showError(context);
    showLoadingDialog(context, previousState);
    showSuccess(context, content: successMessage);
  }
}
