import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TheBarChart extends StatelessWidget {
  const TheBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(minY: 0, maxY: 100));
  }
}
