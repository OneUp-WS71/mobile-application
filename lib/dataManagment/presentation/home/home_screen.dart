import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/common/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:mobile_application/dataManagment/presentation/widgets/measure_box.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';
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
  List<Map<String,dynamic>> vitalSignsData=[];

  //variables para peso y altura
  double  weight=0.0;
  double  height=0.0;

  @override
  void initState() {
    super.initState();
    _fetchReportData();
    _fetchUserData();
  }
  Future<void>_fetchReportData() async{
    try {
      final report = await serviceLocator<GetReportById>()(widget.userId!);
      setState(() {
        vitalSignsData = [
      {
        'title': 'Heart Rate',
        'measure': '${report.heartRate} bpm',
        'value': 'Stable',
        'icon': Icons.favorite,
        'iconColor': Colors.red,
        'image': 'assets/images/Latido.png',
      },
      {
        'title': 'Temperature',
        'measure': '${report.temperature} °C',
        'value': 'Stable',
        'icon': Icons.thermostat,
        'iconColor': Colors.lightBlueAccent,
        'image': 'assets/images/temperature.png',
      },
      {
        'title': 'Breathing frequency',
        'measure': '${report.breathingFrequency} rpm',
        'value': 'Stable',
        'icon': Icons.air_rounded,
        'iconColor': Colors.blueAccent,
        'image': 'assets/images/freRespiratorio.png',
      },
    ];
    });
    } catch (e) {
      print('Failed to fetch report: $e');
    }
  }

  Future<void> _fetchUserData() async {
    try {
      final user = await UserDataProvider().getUserByName('username');
      if (user.patients.isNotEmpty) {
        final patient = user.patients.first;
        setState(() {
          weight = patient.weight;
          height = patient.height;
        });
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
    }

  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context).username;
    weight= user!.patients[0].weight;
    height = user!.patients[0].height;
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
                      value: '$weight kg',
                    ),
                    MeasureBox(
                      title: 'Height',
                      icon: Icons.height,
                      value: '$height cm',
                    ),
                    MeasureBox(
                      title: 'BMI',
                      icon: Icons.monitor_weight,
                      value: (weight / ((height / 100) * (height / 100))).toStringAsFixed(1),
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
