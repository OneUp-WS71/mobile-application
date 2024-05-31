import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'Login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        color: Styles.primaryColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          child: ListView(
            children: [
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 120,
                    child: Image(
                      image: AssetImage('assets/icons/logo-elderlycare.png'),
                      fit: BoxFit.contain,
                    ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding:EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0,2)
                      ),
                    ],
                  ),
                ),
                  ) ,
            ],
          ),
        )
      )
    );
  }
}