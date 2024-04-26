import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/BarChart/bar_data.dart';

class TheBarChart extends StatelessWidget {
  final List<int> theBarData;
  final double maxY;
  const TheBarChart({super.key, required this.theBarData, required this.maxY});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(theBarData[0], theBarData[1], theBarData[2],
        theBarData[3], theBarData[4], theBarData[5], theBarData[6]);
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        minY: 0.0,
        maxY: maxY,
        gridData: const FlGridData(
          show: false,
        ),
        borderData: FlBorderData(
          show: true,
        ),
        titlesData: const FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))),
        barGroups: myBarData.chartData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y.toDouble(),
                    width: 15,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
