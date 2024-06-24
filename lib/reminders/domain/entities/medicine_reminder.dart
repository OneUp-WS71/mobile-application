import 'package:mobile_application/reminders/domain/entities/reminder.dart';

class MedicineReminder extends Reminder{
  final String dosage;
  final List<String> frecuency;

  MedicineReminder({
    required int id,
    required String title,
    required DateTime time,
    required this.dosage,
    required this.frecuency,
  }) : super(id: id, title: title, time: time);
}