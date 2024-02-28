import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:moodtracker/model/objects/habit.dart';
import 'package:moodtracker/utilities/DateTimeConverter.dart';

final _myHabitBox = Hive.box("habitBox");
final _settingsBox = Hive.box("settingsBox");

class MoodtrackerDb {
  List todaysHabits = [];
  double percentCalculated = 0.0;

  void createDefaultData() {
    todaysHabits = [
      Habit(
        name: "Run",
        isChecked: false,
        dateChecked: todaysDateFormatedString(),
        positiveOrNeg: true,
      ),
      Habit(
          name: "Read Book",
          isChecked: false,
          dateChecked: todaysDateFormatedString(),
          positiveOrNeg: true)
    ];
    _myHabitBox.put("START_DATE", DateTime.now());
  }

  void loadHabitData() {
    if (_myHabitBox.get(todaysDateFormatedString()) == null) {
      todaysHabits = _myHabitBox.get("currentHabitList");
      for (int i = 0; i < todaysHabits.length; i++) {
        todaysHabits[i].isChecked = false;
      }
      updateSettingsBox();
    } else {
      todaysHabits = _myHabitBox.get("currentHabitList");
    }
  }

  void updateHabitBox() {
    _myHabitBox.put(todaysDateFormatedString(), todaysHabits);

    _myHabitBox.put("currentHabitList", todaysHabits);
  }

  void updateSettingsBox() {
    _settingsBox.put("todaysPercent", calculatepercentHabits());
  }

  double calculatepercentHabits() {
    int amountCompleted = 0;
    for (int i = 0; i < todaysHabits.length; i++) {
      if (todaysHabits[i].isChecked == true) {
        amountCompleted++;
      }
    }
    double percentage;
    if (todaysHabits.isEmpty) {
      percentage = 1;
    } else {
      percentage = amountCompleted / todaysHabits.length;
    }
    return percentage;
  }
}
