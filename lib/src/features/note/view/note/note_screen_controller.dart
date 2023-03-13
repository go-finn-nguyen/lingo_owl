import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/type_defs/type_defs.dart';
import '../../../../domain_manager.dart';
import '../../data/note_repository.dart';
import '../../model/note.dart';
import 'note_screen_state.dart';

final noteScreenControllerProvider =
    StateNotifierProvider<NoteScreenController, NoteScreenState>((ref) {
  final noteRepository =
      ref.watch(DomainManager.instance.noteRepositoryProvider);
  return NoteScreenController(noteRepository);
});

class NoteScreenController extends StateNotifier<NoteScreenState> {
  NoteScreenController(
    this._noteRepository,
  ) : super(const NoteScreenState(status: AsyncLoading()));

  final NoteRepository _noteRepository;

  void onSaveButtonPressed(LNote note, String content) async {
    final asyncValue = await AsyncValue.guard(
      () => _noteRepository.editNote(
        note.copyWith(
          content: content,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        ),
      ),
    );
    state = state.copyWith(status: asyncValue);
  }

  void onDeleteButtonPressed(NoteId id) async {
    final asyncValue =
        await AsyncValue.guard(() => _noteRepository.deleteNote(id));
    state = state.copyWith(status: asyncValue);
  }
}
