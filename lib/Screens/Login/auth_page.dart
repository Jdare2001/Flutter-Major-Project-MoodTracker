import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/Screens/Login/login_page.dart';
import 'package:moodtracker/Screens/Login/sign_up_page.dart';
import 'package:moodtracker/utilities/top_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return TopLevelScreen();
          } else {
            return SignUpPage();
          }
        },
      ),
    );
  }
}
