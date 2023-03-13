import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../payment/application/payment_service.dart';
import '../model/order.dart';

final checkoutServiceProvider = Provider<CheckoutService>((ref) {
  final paymentService = ref.watch(paymentServiceProvider);
  return CheckoutService(paymentService);
});

class CheckoutService {
  CheckoutService(
    this.service,
  );

  final PaymentService service;

  Future<void> initPayment(
    LOrder order,
  ) async {
    try {
      service.initPayment(order);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> showPaymentSheet() async {
    try {
      service.showPaymentSheet();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> confirmPayment() async {
    try {
      service.confirmPayment();
    } catch (e) {
      rethrow;
    }
  }
}
