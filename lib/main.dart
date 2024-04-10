import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moodtracker/Screens/Login/auth_page.dart';
import 'package:moodtracker/Screens/Login/login_page.dart';
import 'package:moodtracker/Screens/Login/sign_up_page.dart';
import 'package:moodtracker/Screens/daily_check_in_screen.dart';
import 'package:moodtracker/Screens/habits_screen.dart';
import 'package:moodtracker/Screens/home_screen.dart';
import 'package:moodtracker/Screens/journal_screen.dart';
import 'package:moodtracker/Screens/settings_screen.dart';
import 'package:moodtracker/model/objects/habit.dart';
import 'package:moodtracker/Theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Hive.registerAdapter(HabitAdapter());
  await Hive.initFlutter();
  await Hive.openBox("habitBox");
  await Hive.openBox("settingsBox");

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
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Mood Tracker',
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: const AuthScreen(),
          routes: {
            '/Home': (context) => const HomePage(),
            '/Settings': (context) => const SettingsScreen(),
            '/JournalScreen': (context) => const JournalScreen(),
            '/HabitsScreen': (context) => const HabitsScreen(),
            '/DailyCheckIn': (context) => const DailyCheckInScreen(),
            '/LoginScreen': (context) => LoginPage(),
            '/AuthScreen': (context) => const AuthScreen(),
            '/SignUpScreen': (context) => SignUpPage(),
          },
        );
      },
    );
  }
}
