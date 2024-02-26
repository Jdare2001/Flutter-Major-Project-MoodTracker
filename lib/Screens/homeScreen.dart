import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:moodtracker/utilities/topAppBar.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              height: 7.h,
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
                    percent: 0.74,
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
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Text(
                        '70%',
                        style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Text(
                        'of your habits for the day',
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
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
                    fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
