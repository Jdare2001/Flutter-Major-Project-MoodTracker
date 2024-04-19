import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class HabitCircularProgressIndicator extends StatelessWidget {
  final double percentage;
  final double height;
  final double width;

  const HabitCircularProgressIndicator(
      {super.key,
      required this.percentage,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: FAProgressBar(
          animatedDuration: const Duration(seconds: 1),
          currentValue: percentage * 100,
          maxValue: 100,
          displayText: '%',
          backgroundColor: Theme.of(context).colorScheme.background,
          progressColor: Theme.of(context).colorScheme.secondary,
          size: 10,
          displayTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
