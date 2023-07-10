// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.blueAccent,
      height: 60.0,
      index: currentIndex,
      items: const <Widget>[
        Icon(Icons.home, size: 40),
        Icon(Icons.settings, size: 40)
      ],
      onTap: onTap,
    );
  }
}
