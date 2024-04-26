import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/model/database_helper.dart';

class WeekAtAGlance extends StatefulWidget {
  const WeekAtAGlance({super.key});

  @override
  State<WeekAtAGlance> createState() => _WeekAtAGlanceState();
}

class _WeekAtAGlanceState extends State<WeekAtAGlance> {
  @override
  void initState() {
    super.initState();
    getAverageFromDb();
    getGoodListFromDB();
    getNegListFromDB();
  }

  User? currentUser = FirebaseAuth.instance.currentUser;
  double? average = 0.0;
  List<dynamic> goodList = [];
  List<dynamic> negList = [];
  List<String> baseList = [];

  Future getAverageFromDb() async {
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

  Future getGoodListFromDB() async {
    goodList =
        await DatabaseHelper().getGoodHabListDataForLastWeek(currentUser);

    setState(() {});
  }

  List<dynamic>? getTheGoodHabList() {
    if (goodList.isEmpty) {
      return baseList;
    } else {
      return goodList;
    }
  }

  Future getNegListFromDB() async {
    negList = await DatabaseHelper().getNegHabListDataForLastWeek(currentUser);

    setState(() {});
  }

  List<dynamic>? getTheNegHabList() {
    if (goodList.isEmpty) {
      return baseList;
    } else {
      return negList;
    }
  }

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            const SizedBox(height: 15),
            Text(
                "Average Happiness: ${getAverageHappiness()!.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text("Total Good Habits: ${getTheGoodHabList()!.length.toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text("Total Bad Habits: ${getTheNegHabList()!.length.toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Divider(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            const Text(
              "Positive Habits",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(height: 15),
            Text(
                "Total Unspecified Habits: ${getNumOfHabitdone(goodList, "No Type").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Exercise Habits: ${getNumOfHabitdone(goodList, "Exercise").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Mental Health Habits: ${getNumOfHabitdone(goodList, "Mental Health").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Diet Habits: ${getNumOfHabitdone(goodList, "Diet").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Social Habits: ${getNumOfHabitdone(goodList, "Social").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Finance Habits: ${getNumOfHabitdone(goodList, "Finance").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Mindfullness Habits: ${getNumOfHabitdone(goodList, "Mindfullness").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Self Care Habits: ${getNumOfHabitdone(goodList, "Self Care").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Learning Habits: ${getNumOfHabitdone(goodList, "Learning").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Divider(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            const Text(
              "Negative Habits",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(height: 15),
            Text(
                "Total Unspecified Habits: ${getNumOfHabitdone(negList, "No Type").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Exercise Habits: ${getNumOfHabitdone(negList, "Exercise").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Mental Health Habits: ${getNumOfHabitdone(negList, "Mental Health").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Diet Habits: ${getNumOfHabitdone(negList, "Diet").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Social Habits: ${getNumOfHabitdone(negList, "Social").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Finance Habits: ${getNumOfHabitdone(negList, "Finance").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Mindfullness Habits: ${getNumOfHabitdone(negList, "Mindfullness").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Self Care Habits: ${getNumOfHabitdone(negList, "Self Care").toString()}",
                style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 15),
            Text(
                "Total Learning Habits: ${getNumOfHabitdone(negList, "Learning").toString()}",
                style: const TextStyle(fontSize: 25)),
          ]),
        ),
      ),
    );
  }

  int getNumOfHabitdone(List<dynamic> theList, String contained) {
    int count = 0;
    for (int i = 0; i < theList.length; i++) {
      if (theList[i] == contained) {
        count++;
      }
    }
    return count;
  }
}
