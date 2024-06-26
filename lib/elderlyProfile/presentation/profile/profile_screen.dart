import 'package:flutter/material.dart';

import 'package:mobile_application/common/widgets/custom_app_bar.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';
import 'package:mobile_application/security/application/datasources/provider.dart';
import 'package:mobile_application/security/application/models/user_userdb.dart';
import 'package:provider/provider.dart';

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
    print('-----username----- ${username!.patients[0].address}');
    return  Padding(
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
            username?.patients == [] ?
            "string":
            username!.patients[0].name
            ,
            style: const TextStyle(
                          color: Color.fromRGBO(99, 102, 241, 1),
                          fontWeight: FontWeight.w800,
                          fontSize: 28),),
          const SizedBox(height: 7,),
          Padding(
            padding:  const EdgeInsets.all(8.0),
            child: Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(99, 102, 241, 0.4)),
              height: 300,
              width: double.infinity,
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Basic Information",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 25),),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                        "Emergency number: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),),
                          Text(
                            username?.patients == [] ?
                            "":
                            username.phone,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                        "Born: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),),
                          Text(
                            username?.patients == [] ?
                            "":
                            username!.patients[0].date,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                        "Height: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),),
                          Text(
                            username?.patients == [] ?
                            "":
                            ' ${username!.patients![0].height.toString()} m',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                        "Weight: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),),
                          Text(
                            username?.patients == [] ?
                            "":
                            '${username!.patients[0].weight} Kg',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                        "Address: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),),
                          Text(
                            username?.patients == [] ?
                            "":
                            username!.patients![0].address,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(89, 78, 207, 1),
                      ),
                      onPressed: null, 
                      child: const Text("Edit", style: TextStyle(color: Colors.white),)),
                  ],
                ),
              ),
            ),
          ),
        ]),
    );
  }
}
