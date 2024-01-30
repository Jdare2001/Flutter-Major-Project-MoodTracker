import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/bottomnavbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Back"),
        actions: const [
          IconButton(onPressed: settingsOnPressed, icon: Icon(Icons.settings))
        ],
        centerTitle: false,
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

void settingsOnPressed() {}
