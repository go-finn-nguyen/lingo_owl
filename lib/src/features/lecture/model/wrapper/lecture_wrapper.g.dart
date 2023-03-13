// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LLectureWrapper _$$_LLectureWrapperFromJson(Map<String, dynamic> json) =>
    _$_LLectureWrapper(
      courseId: json['courseId'] as String,
      lectures: (json['lectures'] as List<dynamic>)
          .map((e) => LLecture.fromJson(e as Map<String, dynamic>))
          .toList(),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => LSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LLectureWrapperToJson(_$_LLectureWrapper instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'lectures': instance.lectures.map((e) => e.toJson()).toList(),
      'sections': instance.sections.map((e) => e.toJson()).toList(),
    };
