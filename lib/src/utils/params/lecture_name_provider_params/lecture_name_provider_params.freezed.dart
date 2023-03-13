// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture_name_provider_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LectureNameProviderParams {
  String get courseId => throw _privateConstructorUsedError;
  int get sectionIndex => throw _privateConstructorUsedError;
  int get lectureIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LectureNameProviderParamsCopyWith<LectureNameProviderParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureNameProviderParamsCopyWith<$Res> {
  factory $LectureNameProviderParamsCopyWith(LectureNameProviderParams value,
          $Res Function(LectureNameProviderParams) then) =
      _$LectureNameProviderParamsCopyWithImpl<$Res, LectureNameProviderParams>;
  @useResult
  $Res call({String courseId, int sectionIndex, int lectureIndex});
}

/// @nodoc
class _$LectureNameProviderParamsCopyWithImpl<$Res,
        $Val extends LectureNameProviderParams>
    implements $LectureNameProviderParamsCopyWith<$Res> {
  _$LectureNameProviderParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? sectionIndex = null,
    Object? lectureIndex = null,
  }) {
    return _then(_value.copyWith(
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      sectionIndex: null == sectionIndex
          ? _value.sectionIndex
          : sectionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lectureIndex: null == lectureIndex
          ? _value.lectureIndex
          : lectureIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LectureNameProviderParamsCopyWith<$Res>
    implements $LectureNameProviderParamsCopyWith<$Res> {
  factory _$$_LectureNameProviderParamsCopyWith(
          _$_LectureNameProviderParams value,
          $Res Function(_$_LectureNameProviderParams) then) =
      __$$_LectureNameProviderParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String courseId, int sectionIndex, int lectureIndex});
}

/// @nodoc
class __$$_LectureNameProviderParamsCopyWithImpl<$Res>
    extends _$LectureNameProviderParamsCopyWithImpl<$Res,
        _$_LectureNameProviderParams>
    implements _$$_LectureNameProviderParamsCopyWith<$Res> {
  __$$_LectureNameProviderParamsCopyWithImpl(
      _$_LectureNameProviderParams _value,
      $Res Function(_$_LectureNameProviderParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? sectionIndex = null,
    Object? lectureIndex = null,
  }) {
    return _then(_$_LectureNameProviderParams(
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      sectionIndex: null == sectionIndex
          ? _value.sectionIndex
          : sectionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lectureIndex: null == lectureIndex
          ? _value.lectureIndex
          : lectureIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LectureNameProviderParams implements _LectureNameProviderParams {
  const _$_LectureNameProviderParams(
      {required this.courseId,
      required this.sectionIndex,
      required this.lectureIndex});

  @override
  final String courseId;
  @override
  final int sectionIndex;
  @override
  final int lectureIndex;

  @override
  String toString() {
    return 'LectureNameProviderParams(courseId: $courseId, sectionIndex: $sectionIndex, lectureIndex: $lectureIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LectureNameProviderParams &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.sectionIndex, sectionIndex) ||
                other.sectionIndex == sectionIndex) &&
            (identical(other.lectureIndex, lectureIndex) ||
                other.lectureIndex == lectureIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, courseId, sectionIndex, lectureIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LectureNameProviderParamsCopyWith<_$_LectureNameProviderParams>
      get copyWith => __$$_LectureNameProviderParamsCopyWithImpl<
          _$_LectureNameProviderParams>(this, _$identity);
}

abstract class _LectureNameProviderParams implements LectureNameProviderParams {
  const factory _LectureNameProviderParams(
      {required final String courseId,
      required final int sectionIndex,
      required final int lectureIndex}) = _$_LectureNameProviderParams;

  @override
  String get courseId;
  @override
  int get sectionIndex;
  @override
  int get lectureIndex;
  @override
  @JsonKey(ignore: true)
  _$$_LectureNameProviderParamsCopyWith<_$_LectureNameProviderParams>
      get copyWith => throw _privateConstructorUsedError;
}
