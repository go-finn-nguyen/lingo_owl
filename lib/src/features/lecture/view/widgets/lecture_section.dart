import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_sizes.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../widgets/dialog/alert_dialog.dart';
import '../../../video/view/video_view_controller.dart';
import '../../model/lecture/lecture.dart';
import '../../model/section/section.dart';
import '../lecture_screen_controller.dart';
import 'lecture_list_tile.dart';

class LectureSection extends ConsumerStatefulWidget {
  const LectureSection({
    super.key,
    required this.section,
    required this.selectedIndex,
    required this.courseId,
  });

  final CourseId courseId;
  final LSection section;
  final Index selectedIndex;

  @override
  ConsumerState<LectureSection> createState() => _LectureSectionState();
}

class _LectureSectionState extends ConsumerState<LectureSection> {
  late List<LLecture> sortedLectures;

  @override
  void initState() {
    super.initState();
    sortedLectures = List.from(widget.section.lectures)
      ..sort(
        (a, b) => a.index.compareTo(b.index),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Gaps.w16,
            Expanded(
              child: Text(
                'Section ${widget.section.index} - ${widget.section.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            IconButton(
              onPressed: () => showNotImplementedAlertDialog(context: context),
              icon: const Icon(Icons.download_for_offline_outlined),
            )
          ],
        ),
        ...List.generate(
          sortedLectures.length,
          (index) {
            final lecture = sortedLectures[index];
            return LectureListTile(
              onTap: widget.selectedIndex == lecture.index
                  ? null
                  : () {
                      ref
                          .read(lectureScreenControllerProvider(widget.courseId)
                              .notifier)
                          .onLectureTileTapped(lecture);
                      ref
                          .read(videoControllerProvider.notifier)
                          .onVideoChanged();
                    },
              lecture: lecture,
              isSelected: lecture.index == widget.selectedIndex,
            );
          },
        ).toList()
      ],
    );
  }
}
