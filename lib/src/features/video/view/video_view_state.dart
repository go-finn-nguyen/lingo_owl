import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

import '../model/video.dart';

part 'video_view_state.freezed.dart';

@freezed
class VideoViewState with _$VideoViewState {
  const VideoViewState._();
  const factory VideoViewState({
    @Default(AsyncLoading()) AsyncValue<void> status,
    @Default(false) bool isInitialized,
    VideoPlayerController? controller,
    @Default(false) bool showController,
    @Default(false) bool isFullscreen,
    LVideo? video,
    String? currentQuality,
    @Default(Duration.zero) Duration position,
    Duration? seekTo,
  }) = _VideoViewState;

  Duration get duration => controller?.value.duration ?? Duration.zero;
  bool? get isPlaying => controller?.value.isPlaying;
  bool get hasBuffer => controller?.value.buffered.isNotEmpty ?? false;
}
