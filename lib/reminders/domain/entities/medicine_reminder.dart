import 'package:mobile_application/reminders/domain/entities/reminder.dart';

class MedicineReminder extends Reminder{
  final String dosage;
  final List<String> frequency;

  MedicineReminder({
    required String id,
    required String title,
    required DateTime time,
    required this.dosage,
    required this.frequency,
  }) : super(id: id, title: title, time: time);
}