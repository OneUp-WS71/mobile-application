import 'package:flutter/material.dart';
import 'package:mobile_application/elderlyProfile/presentation/profile/profile_screen.dart';

class MenuItem {
  final Widget link;

  MenuItem(
      {required this.link});
}

List<MenuItem> appMenuItems = <MenuItem>[
  MenuItem(
    link: const ProfilePage()),
    MenuItem(
    link: const ProfilePage()),
    MenuItem(
    link: const ProfilePage()),
    MenuItem(
    link: const ProfilePage()),
    MenuItem( 
    link: const ProfilePage()),
  
];
