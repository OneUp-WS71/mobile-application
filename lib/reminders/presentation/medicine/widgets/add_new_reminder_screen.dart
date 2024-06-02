import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class AddNewReminderScreen extends StatelessWidget {
  const AddNewReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Text('Add New Reminder Screen');
  }
}