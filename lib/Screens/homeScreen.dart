import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:moodtracker/utilities/topAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getTopAppBar("Welcome Back", context),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              height: 200,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.lightBlue.shade200,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  CircularPercentIndicator(
                    radius: 50,
                    backgroundColor: Colors.white,
                    percent: 0.74,
                    progressColor: Colors.deepPurple,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    children: [
                      SizedBox(
                        height: 55,
                      ),
                      Text(
                        'You have completed',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text('70%', style: TextStyle(fontSize: 25)),
                      Text('of your habits for the day',
                          style: TextStyle(fontSize: 18)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 320,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue.shade200,
                  padding: const EdgeInsets.all(20)),
              child: const Text(
                "Do Daily Check In",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
