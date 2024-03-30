import 'package:flutter/material.dart';
import 'package:moodtracker/Firebase/auth.dart';
import 'package:moodtracker/utilities/top_screen.dart';
import 'package:moodtracker/Screens/Login/login_register.dart';

class WidgetPath extends StatefulWidget {
  const WidgetPath({super.key});

  @override
  State<WidgetPath> createState() => _WidgetPathState();
}

class _WidgetPathState extends State<WidgetPath> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const TopLevelScreen();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
