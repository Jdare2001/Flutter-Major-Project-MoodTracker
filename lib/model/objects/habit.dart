import 'package:hive_flutter/hive_flutter.dart';
part 'habit.g.dart';

@HiveType(typeId: 1)
class Habit {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool isChecked;
  @HiveField(2)
  String dateChecked;
  @HiveField(3)
  bool positiveOrNeg;
  @HiveField(4)
  String? habitType;
  @HiveField(5)
  String? habitEnd;

  Habit({
    required this.name,
    required this.isChecked,
    required this.dateChecked,
    required this.positiveOrNeg,
    this.habitType,
    this.habitEnd,
  });
}
