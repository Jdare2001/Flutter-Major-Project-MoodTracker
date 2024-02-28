import 'package:hive/hive.dart';
import 'package:moodtracker/model/objects/habit.dart';
import 'package:moodtracker/utilities/DateTimeConverter.dart';

final _myHabitBox = Hive.box("habitBox");

class MoodtrackerDb {
  List<Habit> todaysHabits = [];

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
    } else {
      todaysHabits = _myHabitBox.get(todaysHabits);
    }
  }

  void updateHabitBox() {
    _myHabitBox.put(todaysDateFormatedString(), todaysHabits);

    _myHabitBox.put("currentHabitList", todaysHabits);
  }
}
