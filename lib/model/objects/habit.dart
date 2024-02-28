class Habit {
  String name;
  bool isChecked;
  String dateChecked;
  bool positiveOrNeg;
  String? habitType;
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
