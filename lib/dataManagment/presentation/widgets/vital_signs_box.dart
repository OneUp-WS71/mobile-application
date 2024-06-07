import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';

class VitalSignsBox extends StatelessWidget {
  final String measure;
  final String value;
  const VitalSignsBox({
    Key? key,
    required this.measure,
    required this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
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
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 40,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Heart',
                    style: TextStyle(
                      fontFamily: Styles.headingFont,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Styles.primaryColor,
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 10),

            ],
          ),
          const SizedBox(width: 10),
          Image.asset('assets/images/Latido.png'),
        ],
      ),
    );
  }
}