import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../video_view_controller.dart';

class VideoMidControllerWidget extends ConsumerWidget {
  const VideoMidControllerWidget({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: Theme.of(context)
            .iconTheme
            .copyWith(size: UiParameters.videoMidControllerButtonSize),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => ref
                .read(videoControllerProvider.notifier)
                .onVideoBackward(controller),
            icon: const Icon(
              Icons.rotate_left,
            ),
          ),
          Gaps.w12,
          Consumer(
            builder: (context, ref, child) {
              final isLoading = ref.watch(videoControllerProvider
                  .select((state) => state.status.isLoading));
              Widget centerButton;
              if (isLoading) {
                centerButton = const LoadingState.button();
              } else {
                final isPlaying = ref.watch(
                    videoControllerProvider.select((state) => state.isPlaying));
                if (isPlaying) {
                  centerButton = IconButton(
                    onPressed: () => ref
                        .read(videoControllerProvider.notifier)
                        .onPausePressed(controller),
                    icon: const Icon(Icons.pause),
                  );
                } else {
                  centerButton = IconButton(
                    onPressed: () => ref
                        .read(videoControllerProvider.notifier)
                        .onPlayPressed(controller),
                    icon: const Icon(Icons.play_arrow),
                  );
                }
              }
              return centerButton;
            },
          ),
          Gaps.w12,
          IconButton(
            onPressed: () => ref
                .read(videoControllerProvider.notifier)
                .onVideoForward(controller),
            icon: const Icon(Icons.rotate_right),
          ),
        ],
      ),
    );
  }
}
