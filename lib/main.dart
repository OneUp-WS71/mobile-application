import 'package:flutter/material.dart';
import 'package:mobile_application/splash_screen.dart';
import 'package:mobile_application/security/presentation/register/terms_condition_screen.dart';
import 'package:mobile_application/security/presentation/login/login_screen.dart';
import 'package:mobile_application/security/presentation/register/register_keeper_screen.dart';
import 'package:mobile_application/security/presentation/register/register_keeper_data_screen.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      //TermsConditionScreen(),
      //LoginScreen(),
      //RegisterKeeperScreen(),
      //RegisterKeeperDataScreen(),

    );
  }
}

