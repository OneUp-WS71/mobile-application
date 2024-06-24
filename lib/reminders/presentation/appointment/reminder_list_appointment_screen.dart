import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class ReminderListAppointmentScreen extends StatelessWidget {
  const ReminderListAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      AppointmentItem(
        appointmentName: 'Dentist',
        location: 'Clinic A',
        time: '8:00 AM',
      ),
      AppointmentItem(
        appointmentName: 'Doctor',
        location: 'Clinic B',
        time: '12:00 PM',
      ),
    ]);
  }
}

class AppointmentItem extends StatelessWidget {
  final String appointmentName;
  final String location;
  final String time;

  const AppointmentItem({
    Key? key,
    required this.appointmentName,
    required this.location,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        subtitle: Text('Location: $location, Time: $time'),
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