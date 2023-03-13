import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/video.dart';
import '../../../utils/async_value_ui.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../themes/colors.dart';
import '../../../widgets/state/loading/video/video_loading.dart';
import 'video_view_controller.dart';
import 'widgets/video_bottom_controller_widget.dart';
import 'widgets/video_mid_controller_widget.dart';
import 'widgets/video_top_controller_widget.dart';

class VideoView extends ConsumerStatefulWidget {
  const VideoView({
    super.key,
    required this.video,
  });

  final LVideo video;

  @override
  ConsumerState<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends ConsumerState<VideoView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(videoControllerProvider.notifier).init(widget.video);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(videoControllerProvider.select((value) => value.status),
        (previous, next) {
      next.showError(context);
    });

    final isInitialized = ref
        .watch(videoControllerProvider.select((value) => value.isInitialized));
    return isInitialized
        ? Center(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Consumer(
                builder: (context, ref, child) {
                  final isFullscreenModeOn = ref.watch(videoControllerProvider
                      .select((value) => value.isFullscreen));
                  final size = MediaQuery.of(context).size;
                  return SizedBox.fromSize(
                    size: isFullscreenModeOn
                        ? size
                        : Size(
                            size.width,
                            size.width / UiParameters.videoAspectRatio,
                          ),
                    child: child,
                  );
                },
                child: AspectRatio(
                  aspectRatio: UiParameters.videoAspectRatio,
                  child: ColoredBox(
                    color: LColors.videoPlayerBackground,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        GestureDetector(
                          onTap: ref
                              .read(videoControllerProvider.notifier)
                              .showController,
                          onDoubleTapDown: (details) {
                            final box =
                                context.findRenderObject()! as RenderBox;
                            if (details.localPosition.dx < box.size.width / 2) {
                              ref
                                  .read(videoControllerProvider.notifier)
                                  .onVideoBackward();
                            } else {
                              ref
                                  .read(videoControllerProvider.notifier)
                                  .onVideoForward();
                            }
                          },
                          child: AspectRatio(
                            aspectRatio: UiParameters.videoAspectRatio,
                            child: Consumer(builder: (context, ref, child) {
                              final controller = ref.watch(
                                  videoControllerProvider
                                      .select((value) => value.controller));
                              return controller == null
                                  ? const VideoLoading()
                                  : VideoPlayer(controller);
                            }),
                          ),
                        ),
                        Consumer(builder: (context, ref, child) {
                          final visible = ref.watch(videoControllerProvider
                              .select((state) => state.showController));
                          return Visibility(
                            visible: visible,
                            child: const VideoControllerWidget(),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : const VideoLoading();
  }
}

class VideoControllerWidget extends ConsumerWidget {
  const VideoControllerWidget({super.key});

  Color get _color => Colors.white;
  ColorScheme get _colorScheme => ColorScheme.fromSeed(
        seedColor: _color,
        brightness: Brightness.light,
        primary: _color,
      );
  TextButtonThemeData get _textButtonThemeData => TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      );
  IconThemeData get _iconThemeData => IconThemeData(
        color: _color,
      );
  TextStyle get _textStyle => TextStyle(color: _color);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: _colorScheme,
        textButtonTheme: _textButtonThemeData,
        iconTheme: _iconThemeData,
      ),
      child: DefaultTextStyle(
        style: _textStyle,
        child: ColoredBox(
          color: LColors.videoDimBackground,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: ref.read(videoControllerProvider.notifier).hideController,
            child: Column(
              children: const [
                VideoTopControllerWidget(),
                Spacer(),
                VideoMidControllerWidget(),
                Spacer(),
                VideoBottomControllerWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
