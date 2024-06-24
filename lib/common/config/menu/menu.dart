import 'package:flutter/material.dart';
import 'package:mobile_application/dataManagment/presentation/home/home_screen.dart';
import 'package:mobile_application/elderlyProfile/presentation/profile/profile_screen.dart';
import 'package:mobile_application/reminders/presentation/medicine/reminder_medicine_screen.dart';
import 'package:mobile_application/dataManagment/presentation/location/location_screen.dart';

class MenuItem {
  final Widget link;

  MenuItem(
      {required this.link});
}

List<MenuItem> appMenuItems = <MenuItem>[
  MenuItem(
    link: const HomeScreen()),
    MenuItem(
    link: const ReminderMedicineScreen()),
    MenuItem(
    link: const LocationScreen ()),
    MenuItem(
    link: const ProfilePage()),
    MenuItem( 
    link: const ProfilePage()),
  
];
