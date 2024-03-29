import 'package:hive/hive.dart';
import 'package:moodtracker/model/objects/habit.dart';
import 'package:moodtracker/utilities/date_time_converter.dart';

final _myHabitBox = Hive.box("habitBox");
final _settingsBox = Hive.box("settingsBox");

class MoodtrackerDb {
  String currentTheme = 'lightMode';
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
    int amountPos = 0;
    int amountCompleted = 0;
    for (int i = 0; i < todaysHabits.length; i++) {
      if (todaysHabits[i].isChecked == true && todaysHabits[i].positiveOrNeg) {
        amountCompleted++;
      }
      if (todaysHabits[i].positiveOrNeg == true) {
        amountPos++;
      }
    }

    double percentage;
    if (todaysHabits.isEmpty) {
      percentage = 0;
    } else {
      percentage = amountCompleted / amountPos;
    }
    return percentage;
  }
}
