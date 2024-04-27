import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/model/database_helper.dart';
import 'package:moodtracker/utilities/BarChart/bar_graph.dart';
import 'package:moodtracker/utilities/Components/top_app_bar.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  void initState() {
    super.initState();
    getAverageFromDB();
    getHappyListFromDB();
    getGoodListFromDB();
    getNegListFromDB();
  }

  double? average = 0.0;
  Future getAverageFromDB() async {
    double? adv;
    adv = await DatabaseHelper().getHappinessAdverage(currentUser);
    average = adv;
    setState(() {});
  }

  List<int>? happyListed = [];
  List<int>? goodListed = List<int>.filled(7, 0);
  getHappyListFromDB() async {
    happyListed =
        await DatabaseHelper().getHappyListDataForLastWeek(currentUser);
    setState(() {});
  }

  List<int> theList = List<int>.filled(7, 0);
  getTheHappyList() {
    if (happyListed!.isEmpty) {
      return theList;
    } else {
      return happyListed;
    }
  }

  List<int>? goodHabListed = [];
  getGoodListFromDB() async {
    goodHabListed = await DatabaseHelper()
        .getGoodHabListDataAmountsForLastWeek(currentUser);
    setState(() {});
  }

  getTheGoodList() {
    if (goodHabListed!.isEmpty) {
      return theList;
    } else {
      return goodHabListed;
    }
  }

  List<int>? negHabListed = [];
  getNegListFromDB() async {
    negHabListed =
        await DatabaseHelper().getNegHabListDataAmountsForLastWeek(currentUser);
    setState(() {});
  }

  getTheNegList() {
    if (negHabListed!.isEmpty) {
      return theList;
    } else {
      return negHabListed;
    }
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
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
                "Average Happiness: ${getAverageHappiness()!.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 28),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/WeekAtAGlance');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    padding: const EdgeInsets.all(20)),
                child: Text(
                  "Week At A Glance",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Happiness", style: TextStyle(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(right: 30),
                height: 200,
                child: TheBarChart(
                  maxY: 10,
                  theBarData: getTheHappyList(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Percent of Good Habits Done",
                  style: TextStyle(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(right: 30),
                height: 200,
                child: TheBarChart(
                  theBarData: getTheGoodList(),
                  maxY: 100,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Percent of Negative Habits Done",
                  style: TextStyle(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(right: 30),
                height: 200,
                child: TheBarChart(
                  theBarData: getTheNegList(),
                  maxY: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
