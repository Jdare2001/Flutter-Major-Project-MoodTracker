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
    const JournalScreen(),
    const HomePage(),
    const HabitsScreen(),
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
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.background,
        index: 1,
        items: [
          Icon(
            Icons.bar_chart_outlined,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          Icon(
            Icons.check_box,
            color: Theme.of(context).colorScheme.onSurface,
          )
        ],
        onTap: onTapped,
      ),
    );
  }
}
