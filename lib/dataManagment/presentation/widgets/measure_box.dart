import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class MeasureBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;

  const MeasureBox({
    Key? key,
    required this.title,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: Styles.headingFont,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Styles.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Icon(
            icon,
            size: 40,
            color: Styles.primaryColor,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontFamily: Styles.headingFont,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}