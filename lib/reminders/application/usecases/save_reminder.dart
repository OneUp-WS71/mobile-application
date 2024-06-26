import '../../domain/entities/reminder.dart';
import '../../domain/repositories/reminder_repository.dart';

class SaveReminder {
  final ReminderRepository repository;

  SaveReminder(this.repository);

  Future<void> call(Reminder reminder) {
    return repository.saveReminder(reminder);
  }
}