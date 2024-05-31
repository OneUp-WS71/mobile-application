import 'package:flutter/material.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  static const String name = 'profile_screen';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: NavigationMenu(currentPageIndex: 4,),
      body: Profile_screen(),
    );
  }
}
class Profile_screen extends StatelessWidget {
  const Profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Text("Profile");
  }
}