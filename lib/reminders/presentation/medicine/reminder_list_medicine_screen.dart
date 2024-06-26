import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/reminders/domain/entities/reminder.dart';

import '../../application/usecases/get_all_reminders.dart';
import '../../domain/entities/medicine_reminder.dart';

class ReminderListMedicineScreen extends StatelessWidget {
  const ReminderListMedicineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getAllReminders=GetIt.instance<GetAllReminders>();

    return FutureBuilder<List<Reminder>>(
      future: getAllReminders(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No reminders found.'));
        } else {
            final reminders = snapshot.data!;
            return ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                final reminder = reminders[index] as MedicineReminder;
                return ReminderItem(
                  medicineName: reminder.title,
                  dosage: reminder.dosage,
                  time: reminder.time.toIso8601String(),
                );
               },
            );
          }
        }
    );
  }
}

// Clase del item del reminder

class ReminderItem extends StatelessWidget {
  final String medicineName;
  final String dosage;
  final String time;

  const ReminderItem({
    Key? key,
    required this.medicineName,
    required this.dosage,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(Icons.medication_rounded, color: Styles.primaryColor),
        title: Text(
          medicineName,
          style: TextStyle(
            fontSize: 18,
            fontFamily: Styles.headingFont,
            fontWeight: FontWeight.bold,
            color: Styles.primaryColor,
          ),
        ),
        subtitle: Text('Dosage: $dosage, Time: $time'),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Styles.primaryColor,
          onPressed: () {},
        ),
      ),
    );
  }
}
