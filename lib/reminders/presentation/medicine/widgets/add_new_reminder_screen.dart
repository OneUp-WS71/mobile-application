import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class AddNewReminderScreen extends StatelessWidget {
  const AddNewReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(15),
      title: Center(
        child: Text('Add New Reminder',
            style: TextStyle(
              fontFamily: Styles.headingFont,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Styles.primaryColor,
            )),
      ),
      content: Flexible(
        child: SingleChildScrollView(
            child: Column(children: [
              Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.30),
                child: Text(
              'Medicine Name',
                style: TextStyle(
                fontSize: 18,
                fontFamily: Styles.headingFont,
                fontWeight: FontWeight.bold,
                color: Styles.primaryColor,
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Enter Medicine Name',
                prefixIcon: Icon(
                  Icons.medical_information,
                  color: Styles.primaryColor,
                ),
                contentPadding: const EdgeInsets.all(20),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Styles.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.40),
            child: Text(
              'Dosage(mg)',
              style: TextStyle(
                fontSize: 18,
                fontFamily: Styles.headingFont,
                fontWeight: FontWeight.bold,
                color: Styles.primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Enter Dosage',
                prefixIcon: Icon(
                  Icons.mode_rounded,
                  color: Styles.primaryColor,
                ),
                contentPadding: const EdgeInsets.all(20),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Styles.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.40),
            child: Text(
              'Frequency',
              style: TextStyle(
                fontSize: 18,
                fontFamily: Styles.headingFont,
                fontWeight: FontWeight.bold,
                color: Styles.primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Enter Frequency',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Styles.primaryColor,
                ),
                contentPadding: const EdgeInsets.all(20),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Styles.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.50),
            child: Text(
              'Time',
              style: TextStyle(
                fontSize: 18,
                fontFamily: Styles.headingFont,
                fontWeight: FontWeight.bold,
                color: Styles.primaryColor,
              ),
            ),
          ),
        ])),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 45,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black26,
                ),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 130,
              height: 45,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
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
