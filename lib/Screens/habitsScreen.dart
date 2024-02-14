import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/habitTile.dart';
import 'package:moodtracker/utilities/topAppBar.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  bool isHabitcompleted = false;
  onChecked(bool? value) {
    setState(() {
      isHabitcompleted = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: getTopAppBar("Habits", context),
      body: ListView(
        children: [
          HabitTileWidget(
            habitName: "Go For a run",
            completed: isHabitcompleted,
            onChecked: (value) => onChecked(value),
          ),
        ],
      ),
    );
  }
}
