import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../domain_manager.dart';
import '../../checkout/model/order.dart';
import '../data/payment_repository.dart';

final paymentServiceProvider = Provider<PaymentService>((ref) {
  final paymentRepository =
      ref.watch(DomainManager.instance.paymentRepositoryProvider);
  return PaymentService(paymentRepository);
});

class PaymentService {
  const PaymentService(this._paymentRepository);

  final PaymentRepository _paymentRepository;

  Future<void> initPayment(LOrder order) async {
    try {
      final intent = await _paymentRepository.createPaymentIntent(
        order.uid,
        (order.total * 100).toInt(), // * Convert dollar to cent
      );

      if (intent == null) {
        throw const StripeException(
          error: LocalizedErrorMessage(code: FailureCode.Failed),
        );
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Owl Learning',
          paymentIntentClientSecret: intent.paymentIntentClientSecret!,
          customerEphemeralKeySecret: intent.ephemeralKeySecret,
          customerId: intent.customerId!,
          googlePay: PaymentSheetGooglePay(
            merchantCountryCode: 'VN',
            currencyCode: intent.currencyCode,
            testEnv: true,
          ),
          style: ThemeMode.system,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> showPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> confirmPayment() async {
    try {
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      rethrow;
    }
  }
}
