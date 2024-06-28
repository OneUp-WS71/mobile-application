import 'package:flutter/material.dart';
import 'package:mobile_application/application/infrastructure/datasources/userdb_datasource.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/common/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:mobile_application/dataManagment/presentation/widgets/measure_box.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';
import 'package:mobile_application/security/application/models/user_userdb.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../injections.dart';
import '../../../security/application/datasources/provider.dart';
import '../../../security/application/datasources/user_datasources.dart';
import '../../application/use_cases/get_report_by_id.dart';
import '../widgets/vital_signs_box.dart';


class HomeScreen extends StatefulWidget {
  final int ? userId;
  const HomeScreen({Key? key,  this.userId}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _indicatorSlider = 1;
  final _pageController = PageController(initialPage: 1);
  

  //Lista de vital signs
  List<Map<String,dynamic>>  vitalSignsData = [
    {
      'title': 'Heart Rate',
      'measure': '60 bpm', // cambiar el valor aqui traido del backend '${heart rate} kg',
      'value': 'Stable',
      'icon': Icons.favorite,
      'iconColor': Colors.red,
      'image': 'assets/images/Latido.png',
    },
    {
      'title': 'Temperature',
      'measure': '40 °C',// cambiar el valor aqui traido del backend
      'value': 'Stable',
      'icon': Icons.thermostat,
      'iconColor': Colors.lightBlueAccent,
      'image': 'assets/images/temperature.png',
    },
    {
      'title': 'Breathing frequency',
      'measure': '100 rpm', // cambiar el valor aqui traido del backend
      'value': 'Stable',
      'icon': Icons.air_rounded,
      'iconColor': Colors.blueAccent,
      'image': 'assets/images/freRespiratorio.png',
    },
  ];

  //variables para peso y altura
  double  weight=0;
  double  height=0;
  double bmi = 0;


  @override
  void initState() {
    super.initState();
  }
  void _updateVitalSignsData(UserUserDb user) {
    for (var vitalSign in vitalSignsData) {
      String value = 'Stable';
      if (vitalSign['title'] == 'Heart Rate') {
        int heartRate = user.patients[0].reports.last.heartRate.toInt();
        vitalSign['measure'] = '${user.patients[0].reports.last.heartRate.toInt()} bpm';
        if (heartRate < 60 || heartRate > 100) {
          value = 'Unstable';
        }
      } else if (vitalSign['title'] == 'Temperature') {
        double temperature = user.patients[0].reports.last.temperature;
        vitalSign['measure'] = '${user.patients[0].reports.last.temperature.toInt()} °C';
        if (temperature < 36 || temperature > 37) {
          value = 'Unstable';
        }
      } else if (vitalSign['title'] == 'Breathing frequency') {
        int breathingFreq = user.patients[0].reports.last.breathingFrequency.toInt();
        vitalSign['measure'] = '${user.patients[0].reports.last.breathingFrequency.toInt()} rpm';
        if (breathingFreq < 12 || breathingFreq > 20) {
          value = 'Unstable';
        }
      }
      vitalSign['value'] = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context).username;
    if (user != null && user.patients.isNotEmpty) {
      weight = user.patients[0].weight;
      height = user.patients[0].height;
      _updateVitalSignsData(user);
    }
    //calculate BMI
    if (height != 0) {
      bmi = weight / ((height) * (height));
    }

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
                  children:  [
                    MeasureBox(
                      title: 'Weight',
                      icon: Icons.fitness_center,
                      value: '${weight.toStringAsFixed(1)} kg',
                    ),
                    MeasureBox(
                      title: 'Height',
                      icon: Icons.height,
                      value: '${height.toStringAsFixed(1)}  m',
                    ),
                    MeasureBox(
                      title: 'BMI',
                      icon: Icons.monitor_weight,
                      value: bmi.toStringAsFixed(1),
                      weightLevel: bmi < 18.5
                          ? 'Underweight'
                          : bmi < 24.9
                          ? 'Normal'
                          : bmi < 29.9
                          ? 'Overweight'
                          : 'Obese',
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
