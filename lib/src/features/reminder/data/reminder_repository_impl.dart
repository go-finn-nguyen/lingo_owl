import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain_manager.dart';
import '../model/reminder.dart';
import 'reminder_collection_reference.dart';
import 'reminder_repository.dart';

final remindersStreamProvider = StreamProvider<List<LReminder>>((ref) {
  final reminderRepository =
      ref.watch(DomainManager.instance.reminderRepositoryProvider);
  return reminderRepository.watchReminders();
});

final reminderCountProvider = Provider.autoDispose<int>((ref) {
  final reminders = ref.watch(remindersStreamProvider);
  return reminders.maybeWhen(
    data: (data) => data.length,
    orElse: () => 0,
  );
});

class ReminderRepositoryImpl implements ReminderRepository {
  final ref = ReminderCollectionReference();

  Future<void> init() => ref.init();

  // call this when the DB is no longer needed
  void dispose() => ref.dispose();

  @override
  Future<List<LReminder>> fetchReminders() async {
    final result = await ref.get();
    return result ?? const <LReminder>[];
  }

  @override
  Future<void> setReminders(List<LReminder> reminder) {
    return ref.set(reminder);
  }

  @override
  Stream<List<LReminder>> watchReminders() {
    return ref.snapshots().map((event) => event ?? const <LReminder>[]);
  }
}
