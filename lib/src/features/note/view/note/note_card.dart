import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../router/coordinator.dart';
import '../../../../utils/params/lecture_name_provider_params/lecture_name_provider_params.dart';
import '../../../../utils/text_helpers.dart';
import '../../../course/data/course_repository.dart';
import '../../../lecture/data/lecture_repository.dart';
import '../../model/note.dart';
import '../add_note/add_note_bottom_sheet.dart';
import 'note_screen_controller.dart';

class NoteCard extends ConsumerWidget {
  const NoteCard({
    super.key,
    required this.note,
    this.seekTo,
  });

  final LNote note;
  final void Function(Index lectureIndex, Duration position)? seekTo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseId = note.courseId;
    const contentPadding = EdgeInsets.all(Sizes.p16);

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: contentPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: _buildTimeStamp(context),
              ),
              Gaps.w12,
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Consumer(builder: (context, ref, child) {
                                final name = ref.watch(
                                  lectureNameProvider(
                                    LectureNameProviderParams(
                                      courseId: courseId,
                                      sectionIndex: note.sectionIndex,
                                      lectureIndex: note.lectureIndex,
                                    ),
                                  ),
                                );
                                return Text(
                                  name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                );
                              }),
                              Gaps.h8,
                              Consumer(builder: (context, ref, child) {
                                final courseName = ref
                                    .watch(courseNameProvider(note.courseId));
                                return Text(
                                  courseName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                );
                              }),
                            ],
                          ),
                        ),
                        _buildPopupMenu(context, ref, courseId),
                      ],
                    ),
                    _buildNoteContent(note.content),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeStamp(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onPrimary,
        );

    return Card(
      elevation: 10,
      color: Theme.of(context).colorScheme.primary,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(builder: (context, ref, child) {
          final textHelper = ref.watch(textHelpersProvider);
          return Center(
            child: Text(
              textHelper.toTimeLabel(note.atSeconds),
              style: textStyle,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPopupMenu(
      BuildContext context, WidgetRef ref, CourseId courseId) {
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        );
    return PopupMenuButton(
      color: Theme.of(context).colorScheme.primary,
      itemBuilder: (_) => <PopupMenuEntry>[
        PopupMenuItem(
          onTap: () async {
            final controller = ref.watch(noteScreenControllerProvider.notifier);
            // * Must have to show bottom sheet
            // * https://stackoverflow.com/a/69939955/16037103
            Future.delayed(
              Duration.zero,
              () => showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                useSafeArea: true,
                isDismissible: false,
                builder: (_) {
                  return AddNoteBottomSheet(
                    onSaveButtonPressed: (content) {
                      controller.onSaveButtonPressed(note, content);
                      LCoordinator.onBack();
                    },
                    content: note.content,
                    position: Duration(seconds: note.atSeconds),
                  );
                },
              ),
            );
          },
          child: Text('Edit', style: textStyle),
        ),
        PopupMenuItem(
          onTap: () => ref
              .read(noteScreenControllerProvider.notifier)
              .onDeleteButtonPressed(note.id),
          child: Text(
            'Delete',
            style: textStyle,
          ),
        )
      ],
    );
  }

  Widget _buildNoteContent(String content) {
    if (content.isEmpty) return const SizedBox.shrink();
    return Column(
      children: [
        Gaps.h20,
        Text(
          note.content,
        ),
      ],
    );
  }
}
