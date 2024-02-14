import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/habitTile.dart';
import 'package:moodtracker/utilities/topAppBar.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  onChecked(bool? value, index) {
    setState(() {
      todaysHabits[index][1] = value!;
    });
  }

  List todaysHabits = [
    ["Stretch", false],
    ["Drink 2L Water", false],
    ["Read A book", false]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: getTopAppBar("Habits", context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
                onChecked: (value) => onChecked(value, index));
          },
        ));
  }
}
