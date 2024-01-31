import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/topAppBar.dart';
import 'package:sizer/sizer.dart';

class DailyCheckInScreen extends StatefulWidget {
  const DailyCheckInScreen({super.key});

  @override
  State<DailyCheckInScreen> createState() => _DailyCheckInScreenState();
}

class _DailyCheckInScreenState extends State<DailyCheckInScreen> {
  var rating = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getTopAppBar('Daily Check In', context),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 10.h,
            ),
            Container(
              width: 380,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.lightBlue.shade200,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'How Happy have you been today?',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 30),
                  Slider(
                    value: rating,
                    onChanged: (newRating) {
                      setState(() => rating = newRating);
                    },
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: rating.toString(),
                  ),
                ],
              ),
            ),
            Container(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue.shade200,
                  padding: const EdgeInsets.all(20)),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
