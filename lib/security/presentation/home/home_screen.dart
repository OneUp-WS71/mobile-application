import 'package:flutter/material.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';

class HomePage extends StatefulWidget {
  static const String name = 'home_screen';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: NavigationMenu(currentPageIndex: 0,),
      body: Home_screen(),
    );
  }
}

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}