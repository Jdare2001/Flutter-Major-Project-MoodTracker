import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moodtracker/model/database_helper.dart';
import 'package:moodtracker/utilities/Components/progress_indicator.dart';
import 'package:moodtracker/utilities/Components/top_app_bar.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username = "";
  double? percent = 0.0;
  double? adaptivepercent = 0.0;

  final User? currentUser = FirebaseAuth.instance.currentUser;

  final db = FirebaseFirestore.instance;
  final _settingsBox = Hive.box("settingsBox");

  void getUsername() async {
    username = await DatabaseHelper().getUserName(currentUser);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    DatabaseHelper().updateDocumentsDaily(currentUser);
    getUsername();
  }

  getUsernameText() {
    if (username != "") {
      return username;
    }
  }

  getPercentDone() async {
    percent = await DatabaseHelper().getPercentDone(currentUser) as double;
  }

  /// extra functions to get around errors from asyncronus functions and to null check
  getDoublePercent() {
    getPercentDone();

    if (percent != 0) {
      return percent!.toDouble();
    } else {
      return percent;
    }
  }

  @override
  Widget build(BuildContext context) {
    _settingsBox.put('Username', getUsernameText());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: getTopAppBar("Welcome Back", context),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 5.h,
            ),
            Container(
              height: 100,
              width: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).colorScheme.tertiary),
              child: Row(children: [
                const SizedBox(width: 40),
                const Icon(
                  CupertinoIcons.person_alt_circle,
                  size: 60,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 17),
                    SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _settingsBox.get('Username'),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            "Beginner",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 7),
                          const HabitCircularProgressIndicator(
                            percentage: 0.6,
                            height: 5,
                            width: 250,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ]),
            ),
            Container(
              height: 5.h,
            ),
            Container(
              height: 160,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'You have completed',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      HabitCircularProgressIndicator(
                        percentage: getDoublePercent(),
                        height: 50,
                        width: 300,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'of your habits for the day',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/DailyCheckIn');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  padding: const EdgeInsets.all(20)),
              child: Text(
                "Do Daily Check In",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  double progressIndicator() {
    if (adaptivepercent! < percent!) {
      adaptivepercent = adaptivepercent! + 0.01;
    }
    return adaptivepercent as double;
  }
}
