
import '../../domain/entities/medicine_reminder.dart';
import '../../domain/repositories/reminder_repository.dart';

class GetAllMedicineReminders {
  final ReminderRepository repository;

  GetAllMedicineReminders(this.repository);

  Future<List<MedicineReminder>> call() async {
    final reminders = await repository.getAllReminders();
    return reminders.whereType<MedicineReminder>().toList();
  }
}