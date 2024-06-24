import 'package:mobile_application/reminders/domain/entities/reminder.dart';

class AppointmentReminder extends Reminder {
  final String location;

  AppointmentReminder({
    required int id,
    required String title,
    required DateTime time,
    required this.location,
  }) : super(id: id, title: title, time: time,);
}