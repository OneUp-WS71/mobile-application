
import 'package:flutter/material.dart';
import 'package:mobile_application/config/menu/menu.dart';
import 'package:mobile_application/common/styles/styles.dart';

class NavigationMenu extends StatefulWidget {
  final int currentPageIndex;
  const NavigationMenu({super.key, required this.currentPageIndex});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Styles.primaryColor,
      unselectedItemColor: Colors.black26,
      currentIndex: widget.currentPageIndex,
      onTap: (int index) {
        final menuItem = appMenuItems[index];
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => menuItem.link),
        );
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm_rounded),
          label: 'Reminders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Location',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.watch_rounded),
          label: 'Device',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],

    );
  }
}