import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_intent.freezed.dart';
part 'payment_intent.g.dart';

@freezed
class LPaymentIntent with _$LPaymentIntent {
  const LPaymentIntent._();
  const factory LPaymentIntent({
    required int amount,
    @JsonKey(name: 'customer') String? customerId,
    String? paymentIntentClientSecret,
    String? ephemeralKeySecret,
    @JsonKey(name: 'currency') @Default('USD') String currencyCode,
    @Default('payment') String mode,
    @Default('mobile') String client,
    Map<String, String>? error,
  }) = _LPaymentIntent;

  factory LPaymentIntent.fromJson(Map<String, Object?> json) =>
      _$LPaymentIntentFromJson(json);

  bool get hasError => error != null;
}
