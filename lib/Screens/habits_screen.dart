// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/date_time_converter.dart';
import 'package:moodtracker/utilities/HabitComponents/add_habit_alert_dialog.dart';
import 'package:moodtracker/utilities/HabitComponents/edit_habit_alert_dialog.dart';
import 'package:moodtracker/utilities/HabitComponents/habit_tile.dart';
import 'package:moodtracker/utilities/Components/top_app_bar.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  void _onChecked(habit, index) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .collection('Habits')
        .doc(habit.id)
        .update({
      'name': habit['name'],
      'isChecked': !habit['isChecked'],
      'dateChecked': todaysDateFormatedString(),
      'positiveOrNeg': habit['positiveOrNeg'],
      'habitType': habit['habitType']
    });
  }

  dynamic data;
  final _newHabitNameControler = TextEditingController();

  void cancelDialog() {
    _newHabitNameControler.clear();
    Navigator.of(context).pop();
  }

  void editHabit(habit) {
    showDialog(
        context: context,
        builder: (context) {
          return EditHabitAlertDialog(
            title: "Edit Habit",
            hint: habit['name'],
            cancel: cancelDialog,
            controller: _newHabitNameControler,
            onSave: () => updateHabit(habit),
            onDelete: () => deleteHabit(habit),
          );
        });
  }

  void deleteHabit(habit) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .collection('Habits')
        .doc(habit.id)
        .delete();

    _newHabitNameControler.clear();
    Navigator.of(context).pop();
  }

  void updateHabit(habit) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .collection('Habits')
        .doc(habit.id)
        .update({
      'name': _newHabitNameControler.text,
      'isChecked': habit['isChecked'],
      'dateChecked': habit['dateChecked'],
      'positiveOrNeg': habit['positiveOrNeg'],
      'habitType': habit['habitType']
    });

    _newHabitNameControler.clear();
    Navigator.of(context).pop();
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

  saveHabit(dynamic checkvalue, String habitType) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .collection('Habits')
        .doc(_newHabitNameControler.text)
        .set({
      'name': _newHabitNameControler.text,
      'isChecked': false,
      'dateChecked': todaysDateFormatedString(),
      'positiveOrNeg': checkvalue,
      'habitType': habitType,
    });
    _newHabitNameControler.clear();
    Navigator.pop(context);
  }

  String positiveOrNegative(bool posOrNeg) {
    if (posOrNeg) {
      return "Positive";
    } else {
      return "Negative";
    }
  }

  String habitTypeChecker(String habType) {
    if (habType == 'No Type') {
      return '';
    } else {
      return habType;
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(currentUser!.email)
            .collection("Habits")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          if (snapshot.data == null) {
            return const Text("No Habits Yet");
          }

          final habits = snapshot.data!.docs;
          return ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                return HabitTileWidget(
                  habitName: habit['name'],
                  completed: habit['isChecked'],
                  positive: positiveOrNegative(habit['positiveOrNeg']),
                  editHabit: (context) => editHabit(habit),
                  onChecked: (value) => _onChecked(habit, value),
                  habitType: habitTypeChecker(habit['habitType']),
                );
              });
        },
      ),
    );
  }
}
