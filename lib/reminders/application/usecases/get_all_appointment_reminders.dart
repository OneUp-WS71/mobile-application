import '../../domain/entities/appointment_reminder.dart';
import '../../domain/repositories/reminder_repository.dart';

class GetAllAppointmentReminders {
  final ReminderRepository repository;

  GetAllAppointmentReminders(this.repository);

  Future<List<AppointmentReminder>> call() async {
    final reminders = await repository.getAllReminders();
    return reminders.whereType<AppointmentReminder>().toList();
  }
}