import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
class LVideo with _$LVideo {
  const LVideo._();
  const factory LVideo({
    /// seconds
    required int duration,

    /// "1080" : "url1"
    required Map<String, String> urls,
  }) = _LVideo;

  factory LVideo.fromJson(Map<String, Object?> json) => _$LVideoFromJson(json);

  MapEntry<String, String> get _defaultUrlMap => urls.entries.first;
  String get defaultQuality => _defaultUrlMap.key;
  String get defaultUrl => _defaultUrlMap.value;
}
