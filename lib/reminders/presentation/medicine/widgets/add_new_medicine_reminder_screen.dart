import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/reminders/domain/entities/medicine_reminder.dart';

import '../../../application/usecases/save_reminder.dart';

class AddNewMedicineReminderScreen extends StatefulWidget {
  const AddNewMedicineReminderScreen({Key? key}) : super(key: key);
  @override
  _AddNewMedicineReminderScreenState createState() => _AddNewMedicineReminderScreenState();
}

class _AddNewMedicineReminderScreenState extends State<AddNewMedicineReminderScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController _medicineNameController = TextEditingController();
  TextEditingController _dosageController = TextEditingController();

  Map<String, bool> daysOfWeek = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Styles.primaryColor, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Styles.primaryColor, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Styles.primaryColor, // Button text color
              ),
            ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Styles.secondaryColor,
              dialBackgroundColor: Colors.white,
              dialHandColor: Styles.primaryColor,
              dialTextColor: Colors.black,
              entryModeIconColor: Styles.primaryColor,
              hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? Colors.white
                  : Styles.primaryColor),
              hourMinuteColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? Styles.primaryColor
                  : Colors.white),
              dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? Colors.white
                  : Styles.primaryColor),
              dayPeriodColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? Styles.primaryColor
                  : Colors.white),// Background color
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  void _saveReminder(){
    final nowTime= DateTime.now();

    final reminder= MedicineReminder(
        id: UniqueKey().toString(),
        title: _medicineNameController.text,
        time: DateTime(nowTime.year, nowTime.month, nowTime.day, selectedTime.hour, selectedTime.minute),
        dosage: _dosageController.text,
        frequency: daysOfWeek.keys.where((key) => daysOfWeek[key]!).toList(),
    );
      final saveReminder = GetIt.instance<SaveReminder>();
      saveReminder(reminder).then((_){
        Navigator.pop(context);
      }).catchError((error){
      print ('Error saving reminder: $error');
      });
    }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(15),
      title: Center(
        child: Text('Add New Medicine',
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
                controller: _medicineNameController,
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
              controller: _dosageController,
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
              SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Styles.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: () => _selectTime(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.access_time, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      "Select Time",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: Styles.headingFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              Column(
                children: daysOfWeek.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: daysOfWeek[key],
                    activeColor: Styles.primaryColor,
                    checkColor: Colors.white,
                    onChanged: (bool? value) {
                      setState(() {
                        daysOfWeek[key] = value!;
                      });
                    },
                  );
                }).toList(),
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
                onPressed: _saveReminder,
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
