import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/Screens/habitsScreen.dart';
import 'package:moodtracker/Screens/homeScreen.dart';
import 'package:moodtracker/Screens/journalScreen.dart';

class TopLevelScreen extends StatefulWidget {
  const TopLevelScreen({super.key});

  @override
  State<TopLevelScreen> createState() => _TopLevelScreenState();
}

class _TopLevelScreenState extends State<TopLevelScreen> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    JournalScreen(),
    HomePage(),
    HabitsScreen(),
  ];
  onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.lightBlue.shade200,
        backgroundColor: Colors.white,
        index: 1,
        items: const [
          Icon(Icons.bar_chart_outlined),
          Icon(Icons.home),
          Icon(Icons.check_box)
        ],
        onTap: onTapped,
      ),
    );
  }
}
