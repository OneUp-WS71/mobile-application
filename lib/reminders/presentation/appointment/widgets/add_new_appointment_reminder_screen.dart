import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/reminders/application/usecases/save_reminder.dart';import '../../../domain/entities/appointment_reminder.dart';

class AddNewAppointmentReminderScreen extends StatefulWidget {
  const AddNewAppointmentReminderScreen({Key? key}) : super(key: key);
  @override
  _AddNewAppointmentReminderScreenState createState()=> _AddNewAppointmentReminderScreenState();
}
class _AddNewAppointmentReminderScreenState extends State<AddNewAppointmentReminderScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _appointmentNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();


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

  void _saveReminderAppointment() {
    if (_appointmentNameController.text.isNotEmpty && selectedTime != null){
      final now= DateTime.now();
      final reminder= AppointmentReminder(
        id: UniqueKey().toString(),
        title: _appointmentNameController.text,
        time: DateTime(
          now.year,
          now.month,
          now.day,
          selectedTime.hour,
          selectedTime.minute,
        ),
        location: _locationController.text,
      );
      final saveReminderAppointment= GetIt.instance<SaveReminder>();
      saveReminderAppointment(reminder).then((_) {
        Navigator.pop(context);
      }).catchError((error) {
        print('Error saving reminder: $error');
      });
      }
    }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(15),
      title: Center(
        child: Text('Add New Appointment',
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
               'Appointment Name',
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
       controller: _appointmentNameController,
       maxLines: 1,
    decoration: InputDecoration(
       hintText: 'Enter Appointment Name',
       prefixIcon: Icon(
          Icons.event_available,
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
SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.50),
            child: Text(
              'Location',
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
              controller: _locationController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Enter Location',
                prefixIcon: Icon(
                  Icons.location_on_rounded,
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
          SizedBox(height: 10),
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
       ],),
        ),
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
                onPressed: _saveReminderAppointment,
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