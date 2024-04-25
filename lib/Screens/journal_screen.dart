import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/model/database_helper.dart';
import 'package:moodtracker/utilities/BarChart/bar_graph.dart';
import 'package:moodtracker/utilities/top_app_bar.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  void initState() {
    super.initState();
    getAverage();
  }

  double? average = 0.0;
  Future getAverage() async {
    double? adv;
    adv = await DatabaseHelper().getHappinessAdverage(currentUser);
    average = adv;
    setState(() {});
  }

  double? getAverageHappiness() {
    if (average != 0.0) {
      return average;
    } else {
      return 0.0;
    }
  }

  User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: getTopAppBar("Journal", context),
      body: Column(
        children: [
          const SizedBox(height: 5),
          const Text(
            "Last 7 days at a glance",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          Text(
            "Average Happiness: ${getAverageHappiness()}",
            style: const TextStyle(fontSize: 28),
          ),
          const TheBarChart(),
        ],
      ),
    );
  }
}
