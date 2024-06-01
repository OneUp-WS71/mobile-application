import 'package:flutter/material.dart';
import 'package:mobile_application/common/widgets/custom_app_bar.dart';
import 'package:mobile_application/common/styles/styles.dart';

class ReminderMedicineScreen extends StatelessWidget {
  const ReminderMedicineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Medicine Reminders'),
      body: const Center(
        child: Text('Medicine Reminders'),
      ),
    );
  }
}