import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/dataManagment/presentation/widgets/vital_signs_chart_screen.dart';

class VitalSignsBox extends StatelessWidget {
  final String title;
  final String measure;
  final String value;
  final IconData icon;
  final String image;
  final Color iconColor;

  const VitalSignsBox({
    Key? key,
    required this.title,
    required this.measure,
    required this.value,
    required this.icon,
    required this.image,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> VitalSignsChartScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsets.all(15),
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
                      icon,
                      size: 35,
                      color: iconColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: Styles.headingFont,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: iconColor,
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  measure,
                  style: TextStyle(
                    fontFamily: Styles.headingFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                // CLASE QUE MUESTRA SI ESTA ESTABLE O NO
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: Styles.headingFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: iconColor,
                  ),
                ),

              ],
            ),
            const Spacer(),
            Image.asset(
                image,
                width: 150,
                height: 100,
            ),
          ],
        ),
      ),
    );
  }
}