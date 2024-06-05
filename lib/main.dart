import 'package:flutter/material.dart';
import 'package:mobile_application/security/presentation/login/login_screen.dart';
import 'package:mobile_application/reminders/presentation/medicine/reminder_medicine_screen.dart';
import 'package:mobile_application/dataManagment/presentation/home/home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      //const ReminderMedicineScreen(),
      //const LoginScreen(),
      //SplashScreen(),
      //TermsConditionScreen(),
      //RegisterKeeperScreen(),
      //RegisterKeeperDataScreen(),
      //CustomAppBar(title: 'EXAMPLE'),

    );
  }
}

