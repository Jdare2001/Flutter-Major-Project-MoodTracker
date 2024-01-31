import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/topAppBar.dart';

class DailyCheckInScreen extends StatefulWidget {
  const DailyCheckInScreen({super.key});

  @override
  State<DailyCheckInScreen> createState() => _DailyCheckInScreenState();
}

class _DailyCheckInScreenState extends State<DailyCheckInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getTopAppBar('Daily Check In', context),
    );
  }
}
