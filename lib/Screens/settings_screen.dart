import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      themeMode = themeMode;
    });
  }

  void signOutUser() {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: const Text("Settings"),
      ),
      body: Center(
          child: Column(
        children: [
          const Divider(),
          GestureDetector(
            onTap: signOutUser,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
          ),
        ],
      )),
    );
  }
}
