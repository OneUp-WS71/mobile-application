import 'package:flutter/material.dart';

import 'package:mobile_application/common/widgets/custom_app_bar.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';
import 'package:mobile_application/security/application/datasources/provider.dart';
import 'package:mobile_application/security/application/models/user_userdb.dart';
import 'package:provider/provider.dart';
import 'package:mobile_application/common/styles/styles.dart';

class ProfilePage extends StatelessWidget {
  static const String name = 'profile_screen';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      bottomNavigationBar: NavigationMenu(currentPageIndex: 4,),
      body: Profile_screen(),
    );
  }
}
class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  bool _error = false;
   
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserModel>(context).username;

    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image:  NetworkImage("https://th.bing.com/th/id/OIP.jvRECeCSgnTq1MB6g8OvLAHaE8?rs=1&pid=ImgDetMain")
                      )
                  )
                ),
              ]
              
            ),
            const SizedBox(height: 7,),
            Text(
              (username?.patients == [] || username == null) ?
              "Elderly Name":
              username!.patients[0].name,
              style: TextStyle(
                            color: Colors.black87,
                            fontFamily: Styles.headingFont,
                            fontWeight: FontWeight.w800,
                            fontSize: 35),),
            SizedBox(height: 5,),
            Padding(
              padding:  const EdgeInsets.all(8.0),
              child: Container(
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: Offset(1.0, 1.0),
                    )
                  ],
                  color: Colors.white,
                ),
                height: 300,
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        "Basic Information",
                        style: TextStyle(
                          color: Styles.primaryColor,
                          fontFamily: Styles.headingFont,
                          fontWeight: FontWeight.w800,
                          fontSize: 27),),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.phone, color: Styles.primaryColor, size: 22,),
                          SizedBox(width: 5,),
                           Text(
                          "Emergency number: ",
                          style:  TextStyle(
                              color: Colors.black,
                              fontFamily: Styles.headingFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),),
                            Text(
                              (username?.patients == [] || username == null) ?
                              "":
                              username!.phone,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: Styles.bodyFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.calendar_today, color: Styles.primaryColor, size: 22,),
                          SizedBox(width: 5,),
                           Text(
                          "Born: ",
                          style:  TextStyle(
                              color: Colors.black,
                              fontFamily: Styles.headingFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),),
                            Text(
                              (username?.patients == [] || username == null) ?
                              "":
                              username!.patients[0].date,
                            style:  TextStyle(
                              color: Colors.black,
                                fontFamily: Styles.bodyFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.height_outlined, color: Styles.primaryColor, size: 22,),
                          SizedBox(width: 5,),
                           Text(
                          "Height: ",
                          style:  TextStyle(
                              color: Colors.black,
                              fontFamily: Styles.headingFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),),
                            Text(
                              (username?.patients == [] || username == null) ?
                              "":
                              ' ${username!.patients![0].height.toString()} m',
                            style:  TextStyle(
                              color: Colors.black,
                                fontFamily: Styles.bodyFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.monitor_weight, color: Styles.primaryColor, size: 22,),
                          SizedBox(width: 5,),
                           Text(
                          "Weight: ",
                          style:  TextStyle(
                              color: Colors.black,
                              fontFamily: Styles.headingFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),),
                            Text(
                              (username?.patients == [] || username == null) ?
                              "":
                              '${username!.patients[0].weight} Kg',
                            style:  TextStyle(
                              color: Colors.black,
                                fontFamily: Styles.bodyFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.maps_home_work, color: Styles.primaryColor, size: 22,),
                          SizedBox(width: 5,),
                           Text(
                          "Address: ",
                          style:  TextStyle(
                              color: Colors.black,
                              fontFamily: Styles.headingFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),),
                            Text(
                              (username?.patients == [] || username == null)?
                              "":
                              username!.patients![0].address,
                            style:  TextStyle(
                              color: Colors.black,
                                fontFamily: Styles.bodyFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      
                    ],
                  ),
                ),
              ),
            ),
          ]),
      ),
    );
  }
}
