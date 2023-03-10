import '../../../constants/type_defs/type_defs.dart';
import '../model/note.dart';

abstract class NoteRepository {
  Future<void> addNote(LNote note);
  Future<void> editNote(LNote note);
  Future<void> deleteNote(NoteId id);
  Future<List<LNote>> fetchByCourse(UserId userId, CourseId courseId);
  Stream<List<LNote>> watchNotes(UserId userId, CourseId courseId);
}
