import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/common/widgets/custom_app_bar.dart';

class ReminderMedicineScreen extends StatelessWidget {
  const ReminderMedicineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Medicine Reminder'),
      body: Container(
        child: Text('Medicine Reminder Screen'),
      ),
    );
  }
}