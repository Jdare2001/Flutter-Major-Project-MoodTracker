import 'package:moodtracker/utilities/BarChart/single_bar.dart';

class BarData {
  final double day1;
  final double day2;
  final double day3;
  final double day4;
  final double day5;
  final double day6;
  final double day7;

  BarData(
      {required this.day1,
      required this.day2,
      required this.day3,
      required this.day4,
      required this.day5,
      required this.day6,
      required this.day7});

  List<SingleBar> chartData = [];

  void initializeChartData() {
    chartData = [
      SingleBar(x: 0, y: day1),
      SingleBar(x: 0, y: day2),
      SingleBar(x: 0, y: day3),
      SingleBar(x: 0, y: day4),
      SingleBar(x: 0, y: day5),
      SingleBar(x: 0, y: day6),
      SingleBar(x: 0, y: day7),
    ];
  }
}
