import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobile_application/common/styles/styles.dart';

import '../../application/usecases/delete_reminder.dart';
import '../../application/usecases/get_all_reminders.dart';
import '../../domain/entities/appointment_reminder.dart';
import '../../domain/entities/reminder.dart';

class ReminderListAppointmentScreen extends StatelessWidget {
  const ReminderListAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getAllReminders = GetIt.instance<GetAllReminders>();

    return FutureBuilder <List<Reminder>>(
        future: getAllReminders(),
        builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
           return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No reminders found.'));
       } else {
         final reminders = snapshot.data!;
        return ListView.builder(
       itemCount: reminders.length,
        itemBuilder: (context, index) {
        final reminder = reminders[index] as AppointmentReminder;
          return AppointmentItem(
            id: reminder.id,
            appointmentName: reminder.title,
            location: reminder.location,
            time: reminder.time,
          );
            }
           );
         }
       }
     );
    }
}


class AppointmentItem extends StatelessWidget {
  final String id;
  final String appointmentName;
  final String location;
  final DateTime time;

  const AppointmentItem({
    Key? key,
    required this.id,
    required this.appointmentName,
    required this.location,
    required this.time,
  }) : super(key: key);

  void _deleteReminder(BuildContext context) {
    final deleteReminder = GetIt.instance<DeleteReminder>();
    deleteReminder(id).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reminder deleted')),
      );
    }).catchError((error) {
      print('Error deleting reminder: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete reminder')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //formatear el tiempo
    final formattedTime= DateFormat.jm().format(time);

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(Icons.event_note_rounded, color: Styles.primaryColor),
        title: Text(
          appointmentName,
          style: TextStyle(
            fontSize: 18,
            fontFamily: Styles.headingFont,
            fontWeight: FontWeight.bold,
            color: Styles.primaryColor,
          ),
        ),
        subtitle: Text('Location: $location, Time: $formattedTime'),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Styles.primaryColor,
          onPressed: () {
            _deleteReminder(context);
          },
        ),
      ),
    );
  }
}