import '../../domain/entities/reminder.dart';
import '../../domain/repositories/reminder_repository.dart';

class GetAllReminders {
  final ReminderRepository repository;

  GetAllReminders(this.repository);

  Future<List<Reminder>> call() {
    return repository.getAllReminders();
  }
}