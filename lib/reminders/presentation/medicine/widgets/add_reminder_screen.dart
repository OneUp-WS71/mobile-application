import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class AddReminder extends StatelessWidget {
  const AddReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Add New Reminder',
          style: TextStyle(
            fontFamily: Styles.headingFont,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
      content: const Flexible(
        child: SingleChildScrollView(
          child: Column(

          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 165,
              height: 45,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor:
                  Colors.white,
                  backgroundColor: Colors.black26,
                ),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 165,
              height: 45,
              child: TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor:
                  Colors.white,
                  backgroundColor: Styles.primaryColor,
                ),
                child: const Text('Confirm'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}