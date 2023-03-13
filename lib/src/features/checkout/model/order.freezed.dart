// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LOrder _$LOrderFromJson(Map<String, dynamic> json) {
  return _LOrder.fromJson(json);
}

/// @nodoc
mixin _$LOrder {
  String get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  int get timeStamp => throw _privateConstructorUsedError;
  List<LItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LOrderCopyWith<LOrder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LOrderCopyWith<$Res> {
  factory $LOrderCopyWith(LOrder value, $Res Function(LOrder) then) =
      _$LOrderCopyWithImpl<$Res, LOrder>;
  @useResult
  $Res call({String id, String uid, int timeStamp, List<LItem> items});
}

/// @nodoc
class _$LOrderCopyWithImpl<$Res, $Val extends LOrder>
    implements $LOrderCopyWith<$Res> {
  _$LOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? timeStamp = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<LItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LOrderCopyWith<$Res> implements $LOrderCopyWith<$Res> {
  factory _$$_LOrderCopyWith(_$_LOrder value, $Res Function(_$_LOrder) then) =
      __$$_LOrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String uid, int timeStamp, List<LItem> items});
}

/// @nodoc
class __$$_LOrderCopyWithImpl<$Res>
    extends _$LOrderCopyWithImpl<$Res, _$_LOrder>
    implements _$$_LOrderCopyWith<$Res> {
  __$$_LOrderCopyWithImpl(_$_LOrder _value, $Res Function(_$_LOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? timeStamp = null,
    Object? items = null,
  }) {
    return _then(_$_LOrder(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<LItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LOrder extends _LOrder {
  const _$_LOrder(
      {required this.id,
      required this.uid,
      required this.timeStamp,
      required final List<LItem> items})
      : _items = items,
        super._();

  factory _$_LOrder.fromJson(Map<String, dynamic> json) =>
      _$$_LOrderFromJson(json);

  @override
  final String id;
  @override
  final String uid;
  @override
  final int timeStamp;
  final List<LItem> _items;
  @override
  List<LItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'LOrder(id: $id, uid: $uid, timeStamp: $timeStamp, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LOrder &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uid, timeStamp,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LOrderCopyWith<_$_LOrder> get copyWith =>
      __$$_LOrderCopyWithImpl<_$_LOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LOrderToJson(
      this,
    );
  }
}

abstract class _LOrder extends LOrder {
  const factory _LOrder(
      {required final String id,
      required final String uid,
      required final int timeStamp,
      required final List<LItem> items}) = _$_LOrder;
  const _LOrder._() : super._();

  factory _LOrder.fromJson(Map<String, dynamic> json) = _$_LOrder.fromJson;

  @override
  String get id;
  @override
  String get uid;
  @override
  int get timeStamp;
  @override
  List<LItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_LOrderCopyWith<_$_LOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
