import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/common/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:mobile_application/dataManagment/presentation/widgets/measure_box.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMMM dd').format(now);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
      ),
      bottomNavigationBar: const NavigationMenu(currentPageIndex: 0,),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
            formattedDate,
            style:  TextStyle(
              fontFamily: Styles.headingFont,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Styles.primaryColor,
        ),
      ),
      ),
      ),
          //const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            child: Text(
              'Measures',
              style: TextStyle(
                fontFamily: Styles.headingFont,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                MeasureBox(
                  title: 'Weight',
                  icon: Icons.fitness_center,
                  value: '70 kg',
                ),
                MeasureBox(
                  title: 'Height',
                  icon: Icons.height,
                  value: '170 cm',
                ),
                MeasureBox(
                  title: 'BMI',
                  icon: Icons.monitor_weight,
                  value: '24.2',
                ),
              ],

            )
          ),

          //tabBar decorativo
         /* Container(
            height: 10,
            child: DefaultTabController(
              length: 3,
              child: TabBar(
                indicator: BoxDecoration(
                  color: Styles.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.transparent,
                tabs: const [
                  Tab(text:''),
                  Tab(text:''),
                  Tab(text:''),
                ],
              ),
            ),
            ),*/

          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Vital Signs',
              style: TextStyle(
                fontFamily: Styles.headingFont,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}