import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  void onTapped(int index) {}

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.lightBlue.shade200,
      backgroundColor: Colors.white,
      items: const [
        Icon(Icons.bar_chart_outlined),
        Icon(Icons.home),
        Icon(Icons.check_box)
      ],
      onTap: onTapped,
    );
  }
}
