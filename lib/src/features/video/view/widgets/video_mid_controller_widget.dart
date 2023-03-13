import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../video_view_controller.dart';

class VideoMidControllerWidget extends ConsumerWidget {
  const VideoMidControllerWidget({
    super.key,
  });

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
            onPressed: () =>
                ref.read(videoControllerProvider.notifier).onVideoBackward(),
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
                centerButton = const LoadingState.small();
              } else {
                final isPlaying = ref.watch(
                    videoControllerProvider.select((state) => state.isPlaying));
                if (isPlaying == null) {
                  centerButton = const CircularProgressIndicator();
                } else if (isPlaying) {
                  centerButton = IconButton(
                    onPressed: () => ref
                        .read(videoControllerProvider.notifier)
                        .onPausePressed(),
                    icon: const Icon(Icons.pause),
                  );
                } else {
                  centerButton = IconButton(
                    onPressed: () => ref
                        .read(videoControllerProvider.notifier)
                        .onPlayPressed(),
                    icon: const Icon(Icons.play_arrow),
                  );
                }
              }
              return centerButton;
            },
          ),
          Gaps.w12,
          IconButton(
            onPressed: () =>
                ref.read(videoControllerProvider.notifier).onVideoForward(),
            icon: const Icon(Icons.rotate_right),
          ),
        ],
      ),
    );
  }
}
