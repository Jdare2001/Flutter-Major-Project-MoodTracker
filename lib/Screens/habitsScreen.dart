import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moodtracker/model/MoodTrackerDb.dart';
import 'package:moodtracker/model/objects/habit.dart';
import 'package:moodtracker/utilities/DateTimeConverter.dart';
import 'package:moodtracker/utilities/HabitComponents/addHabitAlertDialog.dart';
import 'package:moodtracker/utilities/HabitComponents/editHabitAlertDialog.dart';
import 'package:moodtracker/utilities/HabitComponents/habitTile.dart';
import 'package:moodtracker/utilities/topAppBar.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  MoodtrackerDb db = MoodtrackerDb();
  final _myHabitBox = Hive.box("habitBox");
  final _newHabitNameControler = TextEditingController();

  @override
  void initState() {
    if (_myHabitBox.get("currentHabitList") == null) {
      db.createDefaultData();
    } else {
      db.loadHabitData();
    }
    db.updateHabitBox();
    super.initState();
  }

  _onChecked(bool? value, index) {
    setState(() {
      db.todaysHabits[index].isChecked = value!;
    });
    db.updateHabitBox();
    db.updateSettingsBox();
  }

  void cancelDialog() {
    _newHabitNameControler.clear();
    Navigator.of(context).pop();
  }

  void editHabit(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return editHabitAlertDialog(
            title: "Edit Habit",
            hint: db.todaysHabits[index].name,
            cancel: cancelDialog,
            controller: _newHabitNameControler,
            onSave: () => updateHabit(index),
            onDelete: () => deleteHabit(index),
          );
        });
  }

  void deleteHabit(int index) {
    setState(() {
      db.todaysHabits.removeAt(index);
    });

    _newHabitNameControler.clear();
    Navigator.of(context).pop();
    db.updateHabitBox();
  }

  void updateHabit(int index) {
    setState(() {
      db.todaysHabits[index].name = _newHabitNameControler.text;

      _newHabitNameControler.clear();
      Navigator.of(context).pop();
      db.updateHabitBox();
      db.updateSettingsBox();
    });
  }

  //create new habit
  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return AddHabitAlertDialog(
          title: "Add A Habit",
          hint: "Habit Name",
          cancel: cancelDialog,
          controller: _newHabitNameControler,
          onSave: saveHabit,
        );
      },
    );
  }

  saveHabit(dynamic checkvalue) {
    setState(
      () {
        db.todaysHabits.add(Habit(
            name: _newHabitNameControler.text,
            isChecked: false,
            dateChecked: todaysDateFormatedString(),
            positiveOrNeg: checkvalue));
      },
    );
    Navigator.of(context).pop();
    db.updateHabitBox();
    db.updateSettingsBox();
    _newHabitNameControler.clear();
  }

  String positiveOrNegative(int index) {
    if (db.todaysHabits[index].positiveOrNeg) {
      return "Positive";
    } else {
      return "Negative";
    }
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
          itemCount: db.todaysHabits.length,
          itemBuilder: (context, index) {
            return HabitTileWidget(
              habitName: db.todaysHabits[index].name,
              completed: db.todaysHabits[index].isChecked,
              onChecked: (value) => _onChecked(value, index),
              editHabit: (context) => editHabit(index),
              positive: positiveOrNegative(index),
            );
          },
        ));
  }
}
