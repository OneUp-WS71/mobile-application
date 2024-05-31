import 'package:flutter/material.dart';

class MenuItem {
  final String link;

  MenuItem(
      {required this.link});
}

List<MenuItem> appMenuItems = <MenuItem>[
  MenuItem(
    link: '/home'),
    MenuItem(
    link: '/reminder'),
    MenuItem(
    link: '/location'),
    MenuItem(
    link: '/device'),
  MenuItem( 
    link: '/profile'),
  
];
