import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'security/presentation/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash:Column(
          children: [
            Image.asset('assets/icons/logo-elderlycare.png'),
            SizedBox(height: 10),
            Text('Elderly Care',
              style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
          ],
        ),
        backgroundColor: Color(0xFF594ECF),
        duration: 3000,
        nextScreen: const LoginScreen(),
      splashIconSize: 300,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
