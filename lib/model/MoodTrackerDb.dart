import 'package:hive/hive.dart';
import 'package:moodtracker/model/objects/habit.dart';

final _myHabitBox = Hive.box("habitBox");

class MoodTrackerDb {
  List<Habit> todaysHabits = [];

  void loadHabits() {}
  void updateHabits() {}

  void createDefaultDataHabits() {
    todaysHabits = [
      Habit(
        name: "Run",
        isChecked: false,
        dateChecked: DateTime.now(),
        positiveOrNeg: true,
      ),
    ];
  }
}
