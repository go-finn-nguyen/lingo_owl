import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../domain_manager.dart';
import '../../../router/coordinator.dart';
import '../../../utils/logger.dart';
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

      final gPay = PaymentSheetGooglePay(
        merchantCountryCode: 'US',
        currencyCode: intent.currencyCode,
        testEnv: true,
      );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // customFlow: false,
          // allowsDelayedPaymentMethods: false,
          merchantDisplayName: 'Owl Learning',
          paymentIntentClientSecret: intent.paymentIntentClientSecret!,
          customerEphemeralKeySecret: intent.ephemeralKeySecret,
          customerId: intent.customerId!,
          googlePay: gPay,
          style: ThemeMode.system,
        ),
      );

      log.wtf('Init completed');
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> showPaymentSheet({void Function()? onPaymentSuccessful}) async {
  //   try {
  //     return Stripe.instance
  //         .presentPaymentSheet()
  //         .then((value) => log.wtf('show payment end'));
  //   } catch (e) {
  //     log.wtf(e);
  //     rethrow;
  //   }
  // }

  Future<void> showPaymentSheet() {
    try {
      return Stripe.instance.presentPaymentSheet().then(
            (_) => ScaffoldMessenger.of(LCoordinator.context).showSnackBar(
              const SnackBar(
                content: Text('Payment successfully completed'),
              ),
            ),
          );
    } catch (e) {
      rethrow;
    }
  }
}
