// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LPaymentIntent _$$_LPaymentIntentFromJson(Map<String, dynamic> json) =>
    _$_LPaymentIntent(
      amount: json['amount'] as int,
      customerId: json['customer'] as String?,
      paymentIntentClientSecret: json['paymentIntentClientSecret'] as String?,
      ephemeralKeySecret: json['ephemeralKeySecret'] as String?,
      currencyCode: json['currency'] as String? ?? 'USD',
      mode: json['mode'] as String? ?? 'payment',
      client: json['client'] as String? ?? 'mobile',
      error: (json['error'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$_LPaymentIntentToJson(_$_LPaymentIntent instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'customer': instance.customerId,
      'paymentIntentClientSecret': instance.paymentIntentClientSecret,
      'ephemeralKeySecret': instance.ephemeralKeySecret,
      'currency': instance.currencyCode,
      'mode': instance.mode,
      'client': instance.client,
      'error': instance.error,
    };
