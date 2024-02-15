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

<<<<<<< Updated upstream
=======
  void cancelDialog() {
    Navigator.of(context).pop();
  }

  void editHabit(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return editHabitAlertDialog(
            title: "Edit Habit",
            hint: "habitname",
            cancel: cancelDialog,
          );
        });
  }

  List todaysHabits = [
    ["Stretch", false],
    ["Drink 2L Water", false],
    ["Read A book", false]
  ];
  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return AddHabitAlertDialog(
          title: "Add A Habit",
          hint: "Habit Name",
          cancel: cancelDialog,
        );
      },
    );
  }

>>>>>>> Stashed changes
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
