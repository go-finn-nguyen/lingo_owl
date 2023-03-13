import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../utils/text_helpers.dart';
import '../../../note/view/add_note/add_note_button.dart';
import '../video_view_controller.dart';
import 'fullscreen_switch_button.dart';
import 'video_progress_bar.dart';

class VideoBottomControllerWidget extends ConsumerWidget {
  const VideoBottomControllerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, child) {
      final textHelpers = ref.watch(textHelpersProvider);
      final duration =
          ref.watch(videoControllerProvider.select((state) => state.duration));

      return Row(
        children: [
          Consumer(builder: (context, ref, child) {
            final position = ref.watch(
                videoControllerProvider.select((state) => state.position));
            return AddNoteButton(
              onAddButtonPressed: () => ref
                  .read(videoControllerProvider.notifier)
                  .onAddNoteButtonPressed(),
              position: position,
            );
          }),
          Consumer(builder: (context, ref, child) {
            final position = ref.watch(
                videoControllerProvider.select((state) => state.position));
            return Text(textHelpers.toTimeLabel(position.inSeconds));
          }),
          Gaps.w12,
          Expanded(
            child: VideoProgressBar(
              duration: duration,
              onPositionChange:
                  ref.read(videoControllerProvider.notifier).updatePosition,
            ),
          ),
          Gaps.w12,
          Text(textHelpers.toTimeLabel(duration.inSeconds)),
          const FullscreenSwitchButton(),
        ],
      );
    });
  }
}
