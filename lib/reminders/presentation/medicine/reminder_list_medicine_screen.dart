import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class ReminderListMedicineScreen extends StatelessWidget {
  const ReminderListMedicineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        title: const Text('Medicine Reminders'),
      ),
      body: const Center(
        child: Text('Medicine Reminders'),
      ),
    );
  }
}