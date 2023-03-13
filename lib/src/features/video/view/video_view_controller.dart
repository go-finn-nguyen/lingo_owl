import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../../../constants/mocks/videos.dart';
import '../model/video.dart';
import 'video_view_state.dart';

final videoControllerProvider =
    StateNotifierProvider.autoDispose<VideoViewController, VideoViewState>(
        (ref) {
  return VideoViewController();
});

class VideoViewController extends StateNotifier<VideoViewState> {
  VideoViewController() : super(const VideoViewState());

  Timer? showVideoControllerTimer;

  @override
  void dispose() {
    _exitFullscreenMode();
    state.controller?.dispose();
    super.dispose();
  }

  void init(LVideo video) async {
    if (!mounted) return;
    final quality = state.currentQuality ?? video.defaultQuality;
    final controller = VideoPlayerController.network(video.urls[quality]!);
    final asyncValue = await AsyncValue.guard(() => controller.initialize());
    state = state.copyWith(
      status: asyncValue,
      controller: controller,
      video: video,
      currentQuality: quality,
      isInitialized: !asyncValue.hasError,
      seekTo: video != state.video ? null : state.seekTo,
    );
    if (asyncValue.hasError) return;

    controller.addListener(updatePosition);
    _play(seekTo: state.seekTo);
  }

  void onVideoForward() async {
    final current = state.position;
    final position = current + kJumpValue;
    _seekTo(position);
    autoHideController();
  }

  void onVideoBackward() async {
    state = state.copyWith(status: const AsyncLoading());
    final current = state.position;
    final position = current - kJumpValue;
    _seekTo(position);
    autoHideController();
  }

  void onPlayPressed() {
    _play();
    hideController();
  }

  void onPausePressed() {
    _pause();
    autoHideController();
  }

  void showController() {
    if (!mounted) return;
    state = state.copyWith(showController: true);
    autoHideController();
  }

  void hideController() {
    if (!mounted) return;
    state = state.copyWith(showController: false);
  }

  void autoHideController() {
    if (!mounted) return;
    showVideoControllerTimer?.cancel();
    showVideoControllerTimer = Timer(kAutoHideValue, hideController);
  }

  void onHorizontalDragStart() {
    state = state.copyWith(status: const AsyncLoading());
    showVideoControllerTimer?.cancel();
    _pause();
  }

  void onHorizontalDragUpdate(double relativePosition) {
    final position = state.duration * relativePosition;
    _seekTo(position);
  }

  void onHorizontalDragEnd() {
    _play();
    autoHideController();
  }

  void onTapDown(double relativePosition) {
    state = state.copyWith(status: const AsyncLoading());
    final position = state.duration * relativePosition;
    _seekTo(position);
    onHorizontalDragEnd();
  }

  void onFullscreenButtonPressed() async {
    final asyncValue = await AsyncValue.guard(() => _enterFullscreenMode());
    state = state.copyWith(
      status: asyncValue,
      isFullscreen: !asyncValue.hasError,
    );
  }

  void onExitFullscreenButtonPressed() async {
    final asyncValue = await AsyncValue.guard(() => _exitFullscreenMode());
    state = state.copyWith(
      status: asyncValue,
      isFullscreen: asyncValue.hasError,
    );
  }

  void onAddNoteButtonPressed() => _pause();

  void onVideoQualityChange(String quality) async {
    state = state.copyWith(
      seekTo: state.position,
      currentQuality: quality,
      status: const AsyncLoading(),
    );
    await state.controller?.dispose();
    init(state.video!);
  }

  void onVideoChanged() async {
    await state.controller?.dispose();
    state = state.copyWith(
      status: const AsyncLoading(),
      isInitialized: false,
      controller: null,
    );
  }

  void updatePosition([Duration? position]) {
    if (state.controller == null) return;
    state =
        state.copyWith(position: position ?? state.controller!.value.position);
  }

  void _seekTo(Duration position) async {
    if (!mounted) return;
    final asyncValue =
        await AsyncValue.guard(() => state.controller!.seekTo(position));
    state = state.copyWith(status: asyncValue);
  }

  void _play({Duration? seekTo}) async {
    if (!mounted) return;

    final futures = <Future<dynamic>>[
      state.controller!.play(),
      if (seekTo != null) state.controller!.seekTo(seekTo),
    ];
    final asyncValue = await AsyncValue.guard(
      () => Future.wait(futures),
    );
    state = state.copyWith(
      status: asyncValue,
    );
  }

  void _pause() async {
    if (!mounted) return;
    final asyncValue = await AsyncValue.guard(() => state.controller!.pause());
    state = state.copyWith(
      status: asyncValue,
    );
  }

  Future<void> _enterFullscreenMode() async {
    await Wakelock.enable();
    Future.wait([
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: List.empty(),
      ),
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]),
    ]);
  }

  Future<void> _exitFullscreenMode() async {
    await Wakelock.disable();
    Future.wait([
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]),
    ]);
  }
}
