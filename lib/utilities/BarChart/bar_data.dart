import 'package:moodtracker/utilities/BarChart/single_bar.dart';
import 'package:moodtracker/utilities/date_time_converter.dart';

//creates the bar data by taking in the data and then creating a list of the single bar objects
class BarData {
  final int day1;
  final int day2;
  final int day3;
  final int day4;
  final int day5;
  final int day6;
  final int day7;
  BarData(
    this.day1,
    this.day2,
    this.day3,
    this.day4,
    this.day5,
    this.day6,
    this.day7,
  );

  List<SingleBar> chartData = [];

  void initializeBarData() {
    chartData = [
      SingleBar(x: getXDaysAgo(6) % 100, y: day1),
      SingleBar(x: getXDaysAgo(5) % 100, y: day2),
      SingleBar(x: getXDaysAgo(4) % 100, y: day3),
      SingleBar(x: getXDaysAgo(3) % 100, y: day4),
      SingleBar(x: getXDaysAgo(2) % 100, y: day5),
      SingleBar(x: getXDaysAgo(1) % 100, y: day6),
      SingleBar(x: int.parse(todaysDateFormatedString()) % 100, y: day7),
    ];
  }
}
