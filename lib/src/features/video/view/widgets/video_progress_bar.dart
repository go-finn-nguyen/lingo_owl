import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/text_helpers.dart';
import 'package:video_player/video_player.dart';

import '../../../../themes/colors.dart';
import '../video_view_controller.dart';

class VideoProgressBar extends ConsumerWidget {
  const VideoProgressBar({
    super.key,
    required this.duration,
    required this.onPositionChange,
  });

  final Duration duration;
  final void Function(Duration position) onPositionChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(videoControllerProvider.select((value) => value.controller));
    final textHelpers = ref.watch(textHelpersProvider);
    final durationInMilliseconds = duration.inMilliseconds;

    int maxBufferingInMilliseconds = 0;
    for (final DurationRange range
        in controller?.value.buffered ?? List.empty()) {
      final int end = range.end.inMilliseconds;
      if (end > maxBufferingInMilliseconds) {
        maxBufferingInMilliseconds = end;
      }
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Builder(
        builder: (context) {
          final position = ref
              .watch(videoControllerProvider.select((value) => value.position));
          final hasBuffer = ref.watch(
              videoControllerProvider.select((value) => value.hasBuffer));
          return _ProgressIndicator(
            hasBuffer: hasBuffer,
            bufferValue: maxBufferingInMilliseconds / durationInMilliseconds,
            relativePosition: position.inMilliseconds / durationInMilliseconds,
          );
        },
      ),
      onHorizontalDragStart: (_) {
        ref.read(videoControllerProvider.notifier).onHorizontalDragStart();
      },
      onHorizontalDragUpdate: (details) {
        final relativePosition =
            _calculateRelativePosition(context, details.globalPosition);
        ref
            .read(videoControllerProvider.notifier)
            .onHorizontalDragUpdate(relativePosition);
      },
      onHorizontalDragEnd: (_) {
        ref.read(videoControllerProvider.notifier).onHorizontalDragEnd();
      },
      onTapDown: (details) {
        final relativePosition =
            _calculateRelativePosition(context, details.globalPosition);
        ref.read(videoControllerProvider.notifier).onTapDown(relativePosition);
      },
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({
    required this.hasBuffer,
    required this.bufferValue,
    required this.relativePosition,
  });

  final bool hasBuffer;
  final double? bufferValue;
  final double relativePosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if (hasBuffer)
          LinearProgressIndicator(
            value: bufferValue ?? 0.0,
            valueColor: const AlwaysStoppedAnimation<Color>(
                LColors.videoProgressBarBuffer),
            backgroundColor: LColors.videoProgressBarBackground,
          ),
        LinearProgressIndicator(
          value: relativePosition,
          // valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
          backgroundColor: LColors.videoProgressBarBackground,
        ),
      ],
    );
  }
}

double _calculateRelativePosition(
  BuildContext context,
  Offset globalPosition,
) {
  final RenderBox box = context.findRenderObject()! as RenderBox;
  final Offset tapPos = box.globalToLocal(globalPosition);
  return tapPos.dx / box.size.width;
}
