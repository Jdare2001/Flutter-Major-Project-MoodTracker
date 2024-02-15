import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/addHabitAlertDialog.dart';
import 'package:moodtracker/utilities/editHabitAlertDialog.dart';
import 'package:moodtracker/utilities/habitTile.dart';
import 'package:moodtracker/utilities/topAppBar.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  _onChecked(bool? value, index) {
    setState(() {
      todaysHabits[index][1] = value!;
    });
  }

  void cancelDialog() {
    Navigator.pop(context);
  }

  void editHabit(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return editHabitAlertDialog(
            title: "Edit Habit",
            hint: "habitname",
            Cancel: cancelDialog,
          );
        });
  }

  List todaysHabits = [
    ["Stretch", false],
    ["Drink 2L Water", false],
    ["Read A book", false]
  ];
  //create new habit
  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return AddHabitAlertDialog(
          title: "Add A Habit",
          hint: "Habit Name",
          Cancel: cancelDialog,
        );
      },
    );
  }
//habit screen widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: getTopAppBar("Habits", context),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewHabit,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        body: ListView.builder(
          itemCount: todaysHabits.length,
          itemBuilder: (context, index) {
            return HabitTileWidget(
              habitName: todaysHabits[index][0],
              completed: todaysHabits[index][1],
              onChecked: (value) => _onChecked(value, index),
              editHabit: (context) => editHabit(index),
            );
          },
        ));
  }
}
