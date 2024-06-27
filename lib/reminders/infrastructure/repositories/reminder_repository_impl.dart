
import '../../domain/entities/reminder.dart';
import '../../domain/repositories/reminder_repository.dart';
import '../data_sources/sqlite_reminder_repository.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final SQLiteReminderRepository _sqliteReminderRepository;

  ReminderRepositoryImpl(this._sqliteReminderRepository);

  @override
  Future<void> saveReminder(Reminder reminder) {
    return _sqliteReminderRepository.saveReminder(reminder);
  }

  @override
  Future<List<Reminder>> getAllReminders() {
    return _sqliteReminderRepository.getAllReminders();
  }

  @override
  Future<void> deleteReminder(String id) {
    return _sqliteReminderRepository.deleteReminder(id);
  }
}