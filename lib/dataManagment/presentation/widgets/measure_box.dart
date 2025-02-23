import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class MeasureBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;
  final String ? weightLevel;

  const MeasureBox({
    Key? key,
    required this.title,
    required this.icon,
    required this.value,
    this.weightLevel,
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
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Styles.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Icon(
            icon,
            size: 40,
            color: Colors.black87,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontFamily: Styles.headingFont,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
          if(weightLevel != null)
            Text(
              weightLevel!,
              style: TextStyle(
                fontFamily: Styles.headingFont,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Styles.primaryColor,
              ),
            ),
        ],
      ),
    );
  }
}