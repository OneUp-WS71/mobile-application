import 'package:get_it/get_it.dart';
import 'package:mobile_application/dataManagment/infrastructure/data_sources/api_report_data_source.dart';
import 'package:mobile_application/reminders/application/usecases/delete_reminder.dart';
import 'package:mobile_application/reminders/application/usecases/get_all_appointment_reminders.dart';
import 'package:mobile_application/reminders/application/usecases/get_all_medicine_reminders.dart';
import 'package:mobile_application/reminders/application/usecases/get_all_reminders.dart';
import 'package:mobile_application/reminders/application/usecases/save_reminder.dart';
import 'package:mobile_application/reminders/domain/repositories/reminder_repository.dart';
import 'package:mobile_application/reminders/infrastructure/data_sources/sqlite_reminder_repository.dart';
import 'package:mobile_application/reminders/infrastructure/repositories/reminder_repository_impl.dart';

import 'dataManagment/application/use_cases/get_report_by_id.dart';
import 'dataManagment/domain/repositories/report_repository.dart';
import 'dataManagment/infrastructure/repositories/report_repository_impl.dart';
import 'package:mobile_application/common/api_config/ApiConfig.dart';

final  serviceLocator= GetIt.instance;

void setupDependencies() {
  //Data Sources 
  serviceLocator.registerLazySingleton(() => ApiReportDataSource(ApiConfig.reportsBaseUrl));
  // Repositorios
  serviceLocator.registerLazySingleton<ReminderRepository>(
          () => ReminderRepositoryImpl(SQLiteReminderRepository()));
  serviceLocator.registerLazySingleton<ReportRepository>(
          () => ReportRepositoryImpl(serviceLocator<ApiReportDataSource>()));


  // Use Cases
  serviceLocator.registerLazySingleton(() => SaveReminder(serviceLocator<ReminderRepository>()));
  serviceLocator.registerLazySingleton(() => GetAllReminders(serviceLocator<ReminderRepository>()));
  serviceLocator.registerLazySingleton(() => DeleteReminder(serviceLocator<ReminderRepository>()));
  serviceLocator.registerLazySingleton(() => GetAllAppointmentReminders(serviceLocator<ReminderRepository>()));
  serviceLocator.registerLazySingleton(() => GetAllMedicineReminders(serviceLocator<ReminderRepository>()));
  serviceLocator.registerLazySingleton(() => GetReportById(serviceLocator<ReportRepository>()));

}