import '../entities/reminder.dart';

abstract class ReminderRepository {
  Future<void> saveReminder(Reminder reminder);
  Future<List<Reminder>> getAllReminders();
  Future<void> deleteReminder(String id);
}
