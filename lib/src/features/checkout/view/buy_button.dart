import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/type_defs/type_defs.dart';
import 'checkout_controller.dart';
import '../../authentication/data/authentication_repository.dart';
import '../model/item.dart';
import '../model/order.dart';

import '../../../widgets/dialog/alert_dialog.dart';

class BuyButton extends ConsumerWidget {
  const BuyButton({super.key, required this.courseId, required this.price});

  final CourseId courseId;
  final double price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedIn = ref.watch(isSignedInProvider);
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: isSignedIn
            ? () async {
                final order = LOrder(
                  uid: ref.read(uidProvider)!,
                  timeStamp: DateTime.now().millisecondsSinceEpoch,
                  items: [LItem(courseId: courseId, amount: price)],
                );
                ref
                    .read(checkoutControllerProvider.notifier)
                    .onBuyButtonPressed(order);
              }
            : () => showSignInRequiredDialog(
                  context: context,
                  content: 'Sign in to enroll in this course.',
                ),
        child: const Text('Buy now'),
      ),
    );
  }
}
