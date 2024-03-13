import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/top_app_bar.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
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
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'How Happy have you been today?',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  const SizedBox(height: 30),
                  Text(getMessage(rating),
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSurface)),
                  Slider(
                    activeColor: Theme.of(context).colorScheme.secondary,
                    inactiveColor: Theme.of(context).colorScheme.background,
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
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  padding: const EdgeInsets.all(20)),
              child: Text(
                "Submit",
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

  String getMessage(rating) {
    String message = 'test';
    switch (rating) {
      case 0:
        message = "0 - Worst Day Ever";
        break;
      case 1:
        message = "1 - Really Awful";
        break;
      case 2:
        message = "2 - Very Bad";
        break;
      case 3:
        message = "3 - Sad";
        break;
      case 4:
        message = "4 - Could Be Better";
        break;
      case 5:
        message = "5 - Content";
        break;
      case 6:
        message = "6 - Chearful";
        break;
      case 7:
        message = "7 - Happy";
        break;
      case 8:
        message = "8 - Very Happy";
        break;
      case 9:
        message = "9 - Elated";
        break;
      case 10:
        message = "10 - Best Day Ever";
        break;
    }

    return message;
  }
}
