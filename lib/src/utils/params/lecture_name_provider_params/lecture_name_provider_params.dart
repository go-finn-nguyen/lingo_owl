import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/type_defs/type_defs.dart';

part 'lecture_name_provider_params.freezed.dart';

@freezed
abstract class LectureNameProviderParams with _$LectureNameProviderParams {
  const factory LectureNameProviderParams({
    required CourseId courseId,
    required Index sectionIndex,
    required Index lectureIndex,
  }) = _LectureNameProviderParams;
}
