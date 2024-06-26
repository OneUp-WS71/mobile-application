import 'package:get_it/get_it.dart';
import 'package:mobile_application/reminders/application/usecases/delete_reminder.dart';
import 'package:mobile_application/reminders/application/usecases/get_all_appointment_reminders.dart';
import 'package:mobile_application/reminders/application/usecases/get_all_medicine_reminders.dart';
import 'package:mobile_application/reminders/application/usecases/get_all_reminders.dart';
import 'package:mobile_application/reminders/application/usecases/save_reminder.dart';
import 'package:mobile_application/reminders/domain/repositories/reminder_repository.dart';
import 'package:mobile_application/reminders/infrastructure/data_sources/sqlite_reminder_repository.dart';
import 'package:mobile_application/reminders/infrastructure/repositories/reminder_repository_impl.dart';

final  serviceLocator= GetIt.instance;

void setupDependencies() {
  // Repositorios
  serviceLocator.registerLazySingleton<ReminderRepository>(
          () => ReminderRepositoryImpl(SQLiteReminderRepository()));

  // Use Cases
  serviceLocator.registerLazySingleton(() => SaveReminder(serviceLocator<ReminderRepository>()));
  serviceLocator.registerLazySingleton(() => GetAllReminders(serviceLocator<ReminderRepository>()));
  serviceLocator.registerLazySingleton(() => DeleteReminder(serviceLocator<ReminderRepository>()));
  serviceLocator.registerLazySingleton(() => GetAllAppointmentReminders(serviceLocator<ReminderRepository>()));
  serviceLocator.registerLazySingleton(() => GetAllMedicineReminders(serviceLocator<ReminderRepository>()));
}