import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/type_defs/type_defs.dart';
import 'item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class LOrder with _$LOrder {
  const LOrder._();
  const factory LOrder({
    required OrderId id,
    required UserId uid,
    required TimeStamp timeStamp,
    required List<LItem> items,
  }) = _LOrder;

  factory LOrder.fromJson(Map<String, Object?> json) => _$LOrderFromJson(json);

  double get total =>
      items.fold(0, (previousValue, element) => previousValue + element.amount);
}
