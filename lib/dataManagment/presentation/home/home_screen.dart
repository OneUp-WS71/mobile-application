import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/common/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:mobile_application/dataManagment/presentation/widgets/measure_box.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mobile_application/dataManagment/presentation/widgets/vital_signs_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _indicatorSlider = 1;
  final _pageController = PageController(initialPage: 1);

  //Lista de vital signs
  final List<Map<String,dynamic>> vitalSignsData=[
    {
      'title': 'Heart Rate',
      'measure':'75 bpm',
      'value':'Stable',
      'icon': Icons.favorite,
      'iconColor': Colors.red,
      'image': 'assets/images/Latido.png',
    },
    {
      'title': 'Temperature',
      'measure':'36.5 °C',
      'value':'Stable',
      'icon': Icons.thermostat,
      'iconColor': Colors.lightBlueAccent,
      'image': 'assets/images/temperature.png',
    },

  ];

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
          Column(
            children: [
              SizedBox(
                height: 180,
                width: 300,
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _indicatorSlider = index;
                    });
                  },
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
                ),
              ),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Styles.primaryColor,
                  dotColor: Colors.grey,
                  dotWidth: 10,
                  dotHeight: 10,
                ),
              ),
            ],
          ),
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
          //Agregar list de vital signs
          Expanded(
              child: ListView.builder(
                itemCount: vitalSignsData.length,
                itemBuilder: (context,index){
                  final vitalSign=vitalSignsData[index];
                  return VitalSignsBox(
                      title: vitalSign['title']!,
                      measure: vitalSign['measure']!,
                      value: vitalSign['value']!,
                    icon: vitalSign['icon']!,
                    iconColor: vitalSign['iconColor']!,
                    image: vitalSign['image']!,
                  );
                }
              )
          ),
        ],
      ),
    );
  }
}
