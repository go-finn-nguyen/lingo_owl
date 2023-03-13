// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LPaymentIntent _$LPaymentIntentFromJson(Map<String, dynamic> json) {
  return _LPaymentIntent.fromJson(json);
}

/// @nodoc
mixin _$LPaymentIntent {
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  String? get customerId => throw _privateConstructorUsedError;
  String? get paymentIntentClientSecret => throw _privateConstructorUsedError;
  String? get ephemeralKeySecret => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  String get currencyCode => throw _privateConstructorUsedError;
  String get mode => throw _privateConstructorUsedError;
  String get client => throw _privateConstructorUsedError;
  Map<String, String>? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LPaymentIntentCopyWith<LPaymentIntent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LPaymentIntentCopyWith<$Res> {
  factory $LPaymentIntentCopyWith(
          LPaymentIntent value, $Res Function(LPaymentIntent) then) =
      _$LPaymentIntentCopyWithImpl<$Res, LPaymentIntent>;
  @useResult
  $Res call(
      {int amount,
      @JsonKey(name: 'customer') String? customerId,
      String? paymentIntentClientSecret,
      String? ephemeralKeySecret,
      @JsonKey(name: 'currency') String currencyCode,
      String mode,
      String client,
      Map<String, String>? error});
}

/// @nodoc
class _$LPaymentIntentCopyWithImpl<$Res, $Val extends LPaymentIntent>
    implements $LPaymentIntentCopyWith<$Res> {
  _$LPaymentIntentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? customerId = freezed,
    Object? paymentIntentClientSecret = freezed,
    Object? ephemeralKeySecret = freezed,
    Object? currencyCode = null,
    Object? mode = null,
    Object? client = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentIntentClientSecret: freezed == paymentIntentClientSecret
          ? _value.paymentIntentClientSecret
          : paymentIntentClientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      ephemeralKeySecret: freezed == ephemeralKeySecret
          ? _value.ephemeralKeySecret
          : ephemeralKeySecret // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LPaymentIntentCopyWith<$Res>
    implements $LPaymentIntentCopyWith<$Res> {
  factory _$$_LPaymentIntentCopyWith(
          _$_LPaymentIntent value, $Res Function(_$_LPaymentIntent) then) =
      __$$_LPaymentIntentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int amount,
      @JsonKey(name: 'customer') String? customerId,
      String? paymentIntentClientSecret,
      String? ephemeralKeySecret,
      @JsonKey(name: 'currency') String currencyCode,
      String mode,
      String client,
      Map<String, String>? error});
}

/// @nodoc
class __$$_LPaymentIntentCopyWithImpl<$Res>
    extends _$LPaymentIntentCopyWithImpl<$Res, _$_LPaymentIntent>
    implements _$$_LPaymentIntentCopyWith<$Res> {
  __$$_LPaymentIntentCopyWithImpl(
      _$_LPaymentIntent _value, $Res Function(_$_LPaymentIntent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? customerId = freezed,
    Object? paymentIntentClientSecret = freezed,
    Object? ephemeralKeySecret = freezed,
    Object? currencyCode = null,
    Object? mode = null,
    Object? client = null,
    Object? error = freezed,
  }) {
    return _then(_$_LPaymentIntent(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentIntentClientSecret: freezed == paymentIntentClientSecret
          ? _value.paymentIntentClientSecret
          : paymentIntentClientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      ephemeralKeySecret: freezed == ephemeralKeySecret
          ? _value.ephemeralKeySecret
          : ephemeralKeySecret // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value._error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LPaymentIntent extends _LPaymentIntent {
  const _$_LPaymentIntent(
      {required this.amount,
      @JsonKey(name: 'customer') this.customerId,
      this.paymentIntentClientSecret,
      this.ephemeralKeySecret,
      @JsonKey(name: 'currency') this.currencyCode = 'USD',
      this.mode = 'payment',
      this.client = 'mobile',
      final Map<String, String>? error})
      : _error = error,
        super._();

  factory _$_LPaymentIntent.fromJson(Map<String, dynamic> json) =>
      _$$_LPaymentIntentFromJson(json);

  @override
  final int amount;
  @override
  @JsonKey(name: 'customer')
  final String? customerId;
  @override
  final String? paymentIntentClientSecret;
  @override
  final String? ephemeralKeySecret;
  @override
  @JsonKey(name: 'currency')
  final String currencyCode;
  @override
  @JsonKey()
  final String mode;
  @override
  @JsonKey()
  final String client;
  final Map<String, String>? _error;
  @override
  Map<String, String>? get error {
    final value = _error;
    if (value == null) return null;
    if (_error is EqualUnmodifiableMapView) return _error;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'LPaymentIntent(amount: $amount, customerId: $customerId, paymentIntentClientSecret: $paymentIntentClientSecret, ephemeralKeySecret: $ephemeralKeySecret, currencyCode: $currencyCode, mode: $mode, client: $client, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LPaymentIntent &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.paymentIntentClientSecret,
                    paymentIntentClientSecret) ||
                other.paymentIntentClientSecret == paymentIntentClientSecret) &&
            (identical(other.ephemeralKeySecret, ephemeralKeySecret) ||
                other.ephemeralKeySecret == ephemeralKeySecret) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.client, client) || other.client == client) &&
            const DeepCollectionEquality().equals(other._error, _error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      amount,
      customerId,
      paymentIntentClientSecret,
      ephemeralKeySecret,
      currencyCode,
      mode,
      client,
      const DeepCollectionEquality().hash(_error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LPaymentIntentCopyWith<_$_LPaymentIntent> get copyWith =>
      __$$_LPaymentIntentCopyWithImpl<_$_LPaymentIntent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LPaymentIntentToJson(
      this,
    );
  }
}

abstract class _LPaymentIntent extends LPaymentIntent {
  const factory _LPaymentIntent(
      {required final int amount,
      @JsonKey(name: 'customer') final String? customerId,
      final String? paymentIntentClientSecret,
      final String? ephemeralKeySecret,
      @JsonKey(name: 'currency') final String currencyCode,
      final String mode,
      final String client,
      final Map<String, String>? error}) = _$_LPaymentIntent;
  const _LPaymentIntent._() : super._();

  factory _LPaymentIntent.fromJson(Map<String, dynamic> json) =
      _$_LPaymentIntent.fromJson;

  @override
  int get amount;
  @override
  @JsonKey(name: 'customer')
  String? get customerId;
  @override
  String? get paymentIntentClientSecret;
  @override
  String? get ephemeralKeySecret;
  @override
  @JsonKey(name: 'currency')
  String get currencyCode;
  @override
  String get mode;
  @override
  String get client;
  @override
  Map<String, String>? get error;
  @override
  @JsonKey(ignore: true)
  _$$_LPaymentIntentCopyWith<_$_LPaymentIntent> get copyWith =>
      throw _privateConstructorUsedError;
}
