import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../router/coordinator.dart';
import '../video_view_controller.dart';

class VideoTopControllerWidget extends ConsumerWidget {
  const VideoTopControllerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const IconButton(
          onPressed: LCoordinator.onBack,
          icon: Icon(Icons.expand_more),
        ),
        const Spacer(),
        const VideoQualityButton(),
        TextButton(
          onPressed: () {},
          child: const Text('CC'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('1.0X'),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        )
      ],
    );
  }
}

class VideoQualityButton extends ConsumerWidget {
  const VideoQualityButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quality = ref
        .watch(videoControllerProvider.select((value) => value.currentQuality));
    final qualities = ref.watch(
        videoControllerProvider.select((value) => value.video!.urls.keys));
    return TextButton(
      onPressed: () {
        showDialog(
          context: LCoordinator.context,
          builder: (context) {
            return Dialog(
              child: Consumer(builder: (context, ref, child) {
                final quality = ref.watch(videoControllerProvider
                    .select((value) => value.currentQuality));

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gaps.h8,
                    Text(
                      'Video quality',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Gaps.h8,
                    Gaps.divider,
                    ...qualities.map(
                      (e) => RadioListTile(
                        value: e,
                        groupValue: quality,
                        onChanged: e == quality
                            ? (_) => LCoordinator.onBack()
                            : (value) {
                                ref
                                    .read(videoControllerProvider.notifier)
                                    .onVideoQualityChange(value as String);
                                // LCoordinator.onBack();
                              },
                        title: Text('${e}p'),
                      ),
                    ),
                    Gaps.divider,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.p16,
                        vertical: Sizes.p8,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FilledButton(
                          onPressed: LCoordinator.onBack,
                          child: Text('Ok'),
                        ),
                      ),
                    )
                  ],
                );
              }),
            );
          },
        );
      },
      child: Text('${quality}P'),
    );
  }
}
