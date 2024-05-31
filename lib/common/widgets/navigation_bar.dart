
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_application/config/menu/menu.dart';

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
    return NavigationBar(destinations: const [
      NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.alarm), label: 'Reminders'),
      NavigationDestination(icon: Icon(Icons.location_city), label: 'Location'),
      NavigationDestination(icon: Icon(Icons.device_hub), label: 'Device'),
      NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
    ],
    selectedIndex: widget.currentPageIndex,

    onDestinationSelected: (int index){
      setState((){
        current = index;
      });
      final menuItem = appMenuItems[index];
      context.push(menuItem.link);
    },
    );
  }
}