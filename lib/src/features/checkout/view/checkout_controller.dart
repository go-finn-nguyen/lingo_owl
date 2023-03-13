import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../application/checkout_service.dart';
import '../model/item.dart';
import '../model/order.dart';

final checkoutControllerProvider =
    StateNotifierProvider.autoDispose<CheckoutController, AsyncValue<void>>(
        (ref) {
  final checkoutService = ref.watch(checkoutServiceProvider);
  return CheckoutController(checkoutService);
});

class CheckoutController extends StateNotifier<AsyncValue<void>> {
  CheckoutController(this._checkoutService) : super(const AsyncData(null));

  final CheckoutService _checkoutService;

  void onBuyButtonPressed({
    required String? uid,
    required CourseId courseId,
    required double price,
    required void Function() onPaymentSuccessful,
    required void Function() signInRequired,
  }) async {
    if (uid == null) {
      signInRequired();
      return;
    }
    final order = LOrder(
      id: const Uuid().v4(),
      uid: uid,
      timeStamp: DateTime.now().millisecondsSinceEpoch,
      items: <LItem>[LItem(courseId: courseId, amount: price)],
    );

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _checkoutService.initPayment(order);
      await _checkoutService.showPaymentSheet(order);
    });
    if (!state.hasError) {
      onPaymentSuccessful();
    }
  }
}
