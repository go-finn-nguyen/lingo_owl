import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/type_defs/type_defs.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class LItem with _$LItem {
  const factory LItem({
    required CourseId courseId,
    required double amount,
  }) = _LItem;

  factory LItem.fromJson(Map<String, Object?> json) => _$LItemFromJson(json);
}
