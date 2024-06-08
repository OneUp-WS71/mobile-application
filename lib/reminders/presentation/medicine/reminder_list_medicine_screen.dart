import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class ReminderListMedicineScreen extends StatelessWidget {
  const ReminderListMedicineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ReminderItem(
        medicineName: 'Paracetamol',
        dosage: '2 tablets',
        time: '8:00 AM',
      ),
      ReminderItem(
        medicineName: 'Ibuprofen',
        dosage: '1 tablet',
        time: '12:00 PM',
      ),
    ]);
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
