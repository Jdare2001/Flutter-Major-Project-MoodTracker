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
  final _NewHabitNameControler = TextEditingController();

  _onChecked(bool? value, index) {
    setState(() {
      todaysHabits[index][1] = value!;
    });
  }

  void cancelDialog() {
    _NewHabitNameControler.clear();
    Navigator.of(context).pop();
  }

  void editHabit(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return editHabitAlertDialog(
            title: "Edit Habit",
            hint: todaysHabits[index][0],
            cancel: cancelDialog,
            controller: _NewHabitNameControler,
            onSave: () => updateHabit(index),
            onDelete: () => deleteHabit(index),
          );
        });
  }

  void deleteHabit(int index) {
    setState(() {
      todaysHabits.removeAt(index);
    });

    _NewHabitNameControler.clear();
    Navigator.of(context).pop();
  }

  void updateHabit(int index) {
    setState(() {
      todaysHabits[index][0] = _NewHabitNameControler.text;
      _NewHabitNameControler.clear();
      Navigator.of(context).pop();
    });
  }

  void saveHabit() {
    setState(() {
      todaysHabits.add([_NewHabitNameControler.text, false]);
    });

    _NewHabitNameControler.clear();
    Navigator.of(context).pop();
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
          cancel: cancelDialog,
          onSave: saveHabit,
          controller: _NewHabitNameControler,
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
