import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/common/widgets/custom_app_bar.dart';
import 'package:mobile_application/reminders/presentation/medicine/reminder_list_medicine_screen.dart';
import 'package:mobile_application/reminders/presentation/medicine/widgets/add_new_reminder_screen.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';

class ReminderMedicineScreen extends StatelessWidget {
  const ReminderMedicineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Número de pestañas
      child: Scaffold(
        appBar: CustomAppBar(title: 'Reminders'),
        bottomNavigationBar: const NavigationMenu(currentPageIndex: 1,),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Styles.secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Styles.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: Styles.headingFont,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontFamily: Styles.headingFont,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Medicine',
                    ),
                    Tab(
                      text: 'Appointment',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              const Expanded(
                child: TabBarView(
                  children: [
                    ReminderListMedicineScreen(),
                    Center(child: Text('Appointment')),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return  AddNewReminderScreen();
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Styles.primaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
