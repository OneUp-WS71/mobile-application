import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'common/styles/styles.dart';
import 'security/presentation/login/login_screen.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash:Column(
          children: [
            Image.asset('assets/icons/logo-elderlycare.png'),
            const SizedBox(height: 10),
            Text('Elderly Care',
              style: TextStyle(
                  fontFamily: Styles.headingFont,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          ],
        ),
        backgroundColor: Styles.primaryColor,
        duration: 2000,
        nextScreen: const LoginScreen(),
      splashIconSize: 300,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
