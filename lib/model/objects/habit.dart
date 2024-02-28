class Habit {
  String name;
  bool isChecked;
  DateTime dateChecked;
  bool positiveOrNeg;
  String habitType;
  DateTime? habitEnd;

  Habit({
    required this.name,
    required this.isChecked,
    required this.dateChecked,
    required this.positiveOrNeg,
    required this.habitType,
    this.habitEnd,
  });
}
