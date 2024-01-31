import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moodtracker/Screens/dailyCheckInScreen.dart';
import 'package:moodtracker/Screens/habitsScreen.dart';
import 'package:moodtracker/Screens/homeScreen.dart';
import 'package:moodtracker/Screens/journalScreen.dart';
import 'package:moodtracker/Screens/settingsScreen.dart';
import 'package:moodtracker/Screens/topScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TopLevelScreen(),
      routes: {
        '/Home': (context) => const HomePage(),
        '/Settings': (context) => const SettingsScreen(),
        '/JournalScreen': (context) => const JournalScreen(),
        '/HabitsScreen': (context) => const HabitsScreen(),
        '/DailyCheckIn': (context) => const DailyCheckInScreen(),
      },
    );
  }
}
