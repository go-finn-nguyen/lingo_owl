import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/checkout_service.dart';
import '../model/order.dart';

final checkoutControllerProvider =
    StateNotifierProvider<CheckoutController, AsyncValue<void>>((ref) {
  final checkoutService = ref.watch(checkoutServiceProvider);
  return CheckoutController(checkoutService);
});

class CheckoutController extends StateNotifier<AsyncValue<void>> {
  CheckoutController(this._checkoutService) : super(const AsyncData(null));

  final CheckoutService _checkoutService;

  Future<void> onBuyButtonPressed(LOrder order) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _checkoutService.initPayment(order);
      await _checkoutService.showPaymentSheet();
      await _checkoutService.confirmPayment();
    });
  }
}
