import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/topAppBar.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: getTopAppBar("Habits", context),
      body: const Text('Habits'),
    );
  }
}
