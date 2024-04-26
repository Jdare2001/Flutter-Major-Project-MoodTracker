import 'package:flutter/material.dart';

class WeekAtAGlance extends StatefulWidget {
  const WeekAtAGlance({super.key});

  @override
  State<WeekAtAGlance> createState() => _WeekAtAGlanceState();
}

class _WeekAtAGlanceState extends State<WeekAtAGlance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: const Text("Week At A Glance"),
      ),
      body: const Center(
        child: Column(children: [
          SizedBox(height: 15),
          Text("Average Happiness: ", style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Text("Total Good Habits: ", style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Text("Total Bad Habits: ", style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Text("Total Unspecified Habits: ", style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Text("Total Exercise Habits: ", style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Text("Total Mental Health Habits: ", style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Text("Total Diet Habits: ", style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Text("Total Social Habits: ", style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Text("Total Finance Habits: ", style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Text("Total Self Care Habits: ", style: TextStyle(fontSize: 25)),
          SizedBox(height: 15),
          Text("Total Learning Habits: ", style: TextStyle(fontSize: 25)),
        ]),
      ),
    );
  }
}
