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

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: const Text("Settings"),
      ),
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
          const Divider()
        ],
      )),
    );
  }
}
