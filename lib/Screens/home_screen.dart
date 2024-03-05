import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:moodtracker/utilities/top_app_bar.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mySettingsBox = Hive.box("settingsBox");

  onChecked() {}
  @override
  Widget build(BuildContext context) {
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
                            "User",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Beginner - 300 exp to level up ",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 7),
                          LinearProgressIndicator(
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.secondary),
                            value: 0.7,
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
              height: 200,
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
                  CircularPercentIndicator(
                    radius: 50,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    percent: percentCalculatedDouble(),
                    progressColor: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 55,
                      ),
                      Text(
                        'You have completed',
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${(percentCalculatedDouble() * 100).toInt()}%',
                        style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'of your habits for the day',
                        style: TextStyle(
                            fontSize: 18,
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

  double percentCalculatedDouble() {
    double percent = 0.0;
    if (_mySettingsBox.get("todaysPercent") != null) {
      percent = _mySettingsBox.get("todaysPercent");
    } else {
      percent = 0;
    }
    return percent;
  }
}
