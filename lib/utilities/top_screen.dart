import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/Screens/habits_screen.dart';
import 'package:moodtracker/Screens/home_screen.dart';
import 'package:moodtracker/Screens/journal_screen.dart';

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
            CupertinoIcons.chart_bar,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          Icon(
            CupertinoIcons.home,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          Icon(
            CupertinoIcons.check_mark_circled,
            color: Theme.of(context).colorScheme.onSurface,
          )
        ],
        onTap: onTapped,
      ),
    );
  }
}
