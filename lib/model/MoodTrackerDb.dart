import 'package:hive/hive.dart';
import 'package:moodtracker/model/objects/habit.dart';

final _myHabitBox = Hive.box("habitBox");
final _myDailyCheckInBox = Hive.box("dailyBox");

class MoodtrackerDb {
  List<Habit> todaysHabits = [];

  void createDefaultData() {
    todaysHabits = [
      Habit(
        name: "Run",
        isChecked: false,
        dateChecked: DateTime.now(),
        positiveOrNeg: true,
      ),
      Habit(
          name: "Read Book",
          isChecked: false,
          dateChecked: DateTime.now(),
          positiveOrNeg: true)
    ];
  }

  void loadHabitData() {}
  void updateHabit() {}
}
