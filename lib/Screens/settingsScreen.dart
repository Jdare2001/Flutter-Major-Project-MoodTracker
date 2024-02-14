import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/topAppBar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: getTopAppBar('Settings', context),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Dark Mode",
                style: TextStyle(fontSize: 30),
              ),
              Switch(
                value: isDarkTheme,
                onChanged: (isOn) {
                  isOn
                      ? _toggleTheme(ThemeMode.dark)
                      : _toggleTheme(ThemeMode.light);
                },
              )
            ],
          ),
          Divider()
        ],
      )),
    );
  }
}
