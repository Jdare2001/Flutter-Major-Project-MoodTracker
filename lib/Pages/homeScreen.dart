import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/bottomnavbar.dart';
import 'package:moodtracker/utilities/topAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getTopAppBar("Welcome Back"),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

void settingsOnPressed() {}
