import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class TermsConditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Terms & Conditions',
      style: TextStyle(
        fontFamily: Styles.headingFont,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )),
      content: Flexible(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to our mobile application. Before using our application, please carefully read these terms and conditions of use. By accessing and using our application, you agree to be legally bound by the following terms and conditions, as well as our privacy policy.'),
              Text('1. Acceptance of Terms'),
              Text('By using our application, you agree to these terms and conditions in their entirety. If you do not agree with any of these terms, please refrain from using our application.'),
              Text('2. Use of the Application'),
              Text(' -1.Purpose: Our mobile application aims to provide health tracking and monitoring services for individuals in care.'),
              Text(' -2.Location Information: By using our application, you agree that we may access your real-time location in order to provide you with tracking and monitoring services.'),
              Text(' -3.Personal Data: You agree that we may collect and use certain personal data, such as your name, email address, and health data, in accordance with our privacy policy.'),
              Text(' -4. Responsible Use: You agree to use our application responsibly and legally, without infringing on the rights of third parties or violating the law.'),
              Text('3. Privacy'),
              Text(' -1 Data Collection: By using our application, you agree that we may collect certain personal and location data in order to provide our services. Please refer to our privacy policy for more information on how we collect, use, and protect your data.'),
              Text(' -2. Security: We are committed to protecting the security and confidentiality of your personal data in accordance with applicable data protection laws.'),
              Text('4.Modifications'),
              Text('We reserve the right to modify these terms and conditions at any time without prior notice. You will be notified of any changes through a notification in our application. Your continued use of our application after any modifications will constitute your acceptance of the modified terms.'),
              Text('5.Limitation of Liability'),
              Text('To the maximum extent permitted by law, we shall not be liable for any direct, indirect, incidental, special, consequential, or punitive damages arising out of the use or inability to use our application.'),
              Text('6.Applicable Law'),
              Text('These terms and conditions shall be governed by and construed in accordance with the laws of Perú, and any dispute relating to these terms and conditions shall be subject to the exclusive jurisdiction of the courts of Perú.')
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 165,
              height: 45,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
                style: TextButton.styleFrom(
                  foregroundColor:
                  Colors.white,
                  backgroundColor: Colors.black26,
                ),
              ),
            ),
            SizedBox(width: 5),
            Container(
              width: 165,
              height: 45,
              child: TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Accept'),
                style: TextButton.styleFrom(
                  foregroundColor:
                  Colors.white,
                  backgroundColor: Styles.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}