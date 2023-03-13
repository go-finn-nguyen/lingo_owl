// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LItem _$LItemFromJson(Map<String, dynamic> json) {
  return _LItem.fromJson(json);
}

/// @nodoc
mixin _$LItem {
  String get courseId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LItemCopyWith<LItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LItemCopyWith<$Res> {
  factory $LItemCopyWith(LItem value, $Res Function(LItem) then) =
      _$LItemCopyWithImpl<$Res, LItem>;
  @useResult
  $Res call({String courseId, double amount});
}

/// @nodoc
class _$LItemCopyWithImpl<$Res, $Val extends LItem>
    implements $LItemCopyWith<$Res> {
  _$LItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LItemCopyWith<$Res> implements $LItemCopyWith<$Res> {
  factory _$$_LItemCopyWith(_$_LItem value, $Res Function(_$_LItem) then) =
      __$$_LItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String courseId, double amount});
}

/// @nodoc
class __$$_LItemCopyWithImpl<$Res> extends _$LItemCopyWithImpl<$Res, _$_LItem>
    implements _$$_LItemCopyWith<$Res> {
  __$$_LItemCopyWithImpl(_$_LItem _value, $Res Function(_$_LItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? amount = null,
  }) {
    return _then(_$_LItem(
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LItem implements _LItem {
  const _$_LItem({required this.courseId, required this.amount});

  factory _$_LItem.fromJson(Map<String, dynamic> json) =>
      _$$_LItemFromJson(json);

  @override
  final String courseId;
  @override
  final double amount;

  @override
  String toString() {
    return 'LItem(courseId: $courseId, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LItem &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, courseId, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LItemCopyWith<_$_LItem> get copyWith =>
      __$$_LItemCopyWithImpl<_$_LItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LItemToJson(
      this,
    );
  }
}

abstract class _LItem implements LItem {
  const factory _LItem(
      {required final String courseId,
      required final double amount}) = _$_LItem;

  factory _LItem.fromJson(Map<String, dynamic> json) = _$_LItem.fromJson;

  @override
  String get courseId;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_LItemCopyWith<_$_LItem> get copyWith =>
      throw _privateConstructorUsedError;
}
