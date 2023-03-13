import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../router/coordinator.dart';
import '../../../utils/async_value_ui.dart';
import '../../../widgets/dialog/alert_dialog.dart';
import '../../authentication/data/authentication_repository.dart';
import 'checkout_controller.dart';

class BuyButton extends ConsumerWidget {
  const BuyButton({super.key, required this.courseId, required this.price});

  final CourseId courseId;
  final double price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(checkoutControllerProvider, (previous, next) {
      next.showErrorLoadingSuccessState(context,
          previousState: previous, successMessage: 'Payment successful');
    });

    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () =>
            ref.read(checkoutControllerProvider.notifier).onBuyButtonPressed(
                  uid: ref.watch(uidProvider),
                  courseId: courseId,
                  price: price,
                  onPaymentSuccessful: () => LCoordinator.showHomeScreen(),
                  signInRequired: () => showSignInRequiredDialog(
                    context: context,
                    content: 'Sign in to enroll in this course.',
                  ),
                ),
        child: const Text('Buy now'),
      ),
    );
  }
}
