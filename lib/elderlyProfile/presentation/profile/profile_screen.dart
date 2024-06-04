import 'package:flutter/material.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  static const String name = 'profile_screen';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Elderly', 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800
            ),
          ),
        backgroundColor: const Color.fromRGBO(99, 102, 241, 1),
      ),
      bottomNavigationBar: const NavigationMenu(currentPageIndex: 4,),
      body: const Profile_screen(),
    );
  }
}
class Profile_screen extends StatelessWidget {
  const Profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Text(
            "Emerson",
            style: TextStyle(
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                        "Emergency number: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),),
                          Text(
                          "+51 942 985 325",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                        "Age: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),),
                          Text(
                          "58 años",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                        "Height: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),),
                          Text(
                          "1,75 m",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                        "Weight: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),),
                          Text(
                          "70 kg",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                        "Address: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),),
                          Text(
                          "Los olivos, calle Cleto 123",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(89, 78, 207, 1),
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
