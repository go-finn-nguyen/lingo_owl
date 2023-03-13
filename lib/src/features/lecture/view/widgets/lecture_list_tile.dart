import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums/lecture_type.dart';
import '../../../../utils/text_helpers.dart';
import '../../../../widgets/dialog/alert_dialog.dart';
import '../../model/lecture/lecture.dart';

class LectureListTile extends ConsumerWidget {
  const LectureListTile({
    super.key,
    required this.lecture,
    this.isSelected = false,
    required this.onTap,
  });

  final LLecture lecture;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0.0,
      selected: isSelected,
      contentPadding: EdgeInsets.zero,
      leading: _buildLeading(),
      trailing: lecture.type.isVideo
          ? IconButton(
              onPressed: () => showNotImplementedAlertDialog(context: context),
              icon: const Icon(Icons.download_for_offline_outlined),
            )
          : null,
      title: Text(
        lecture.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: isSelected ? FontWeight.bold : null),
      ),
      subtitle: _buildSubtitle(),
    );
  }

  Widget _buildLeading() {
    late IconData iconData;
    switch (lecture.type) {
      case LectureType.video:
        iconData = Icons.ondemand_video_outlined;
        break;
      case LectureType.article:
        iconData = Icons.article;
        break;
      default:
        iconData = Icons.category;
    }
    return SizedBox.square(
      dimension: 50.0,
      child: Icon(
        iconData,
      ),
    );
  }

  Widget _buildSubtitle() {
    switch (lecture.type) {
      case LectureType.video:
        return Row(
          children: [
            const Icon(Icons.closed_caption),
            Consumer(
              builder: (context, ref, child) {
                final textHelper = ref.watch(textHelpersProvider);
                return Text(
                    'Video - ${textHelper.toTimeLabel(lecture.seconds)} mins');
              },
            ),
          ],
        );
      case LectureType.article:
        return const Text('Article');
      default:
        return const SizedBox.shrink();
    }
  }
}
