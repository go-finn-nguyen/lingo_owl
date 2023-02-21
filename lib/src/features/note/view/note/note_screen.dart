import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../widgets/common/app_bar.dart';
import '../../../../widgets/state/error.dart';
import '../../../../widgets/state/loading/loading.dart';
import 'note_list_view.dart';
import 'note_screen_controller.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scrollHeight =
        size.height - size.width / UiParameters.videoAspectRatio;
    final relativeHeight = scrollHeight / size.height;

    return Material(
      color: Colors.transparent,
      child: DraggableScrollableSheet(
        initialChildSize: relativeHeight,
        maxChildSize: 1,
        minChildSize: relativeHeight,
        builder: (context, scrollController) {
          return ColoredBox(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              children: [
                const LAppBar(
                  title: 'Notes',
                  leading: CloseButton(),
                ),
                Expanded(
                  child: Padding(
                    padding: UiParameters.screenPadding,
                    child: Consumer(builder: (context, ref, child) {
                      final state =
                          ref.watch(noteScreenControllerProvider(courseId));
                      return state.status.when(
                        loading: LoadingState.new,
                        error: (_, __) => const ErrorState(),
                        data: (_) => NoteListView(
                          controller: scrollController,
                          notes: state.notes!,
                          lectures: state.lectures!,
                          course: state.course!,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
