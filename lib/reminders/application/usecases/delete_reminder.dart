import '../../domain/repositories/reminder_repository.dart';

class DeleteReminder {
  final ReminderRepository repository;

  DeleteReminder(this.repository);

  Future<void> call(String id) {
    return repository.deleteReminder(id);
  }
}