import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/bottomnavbar.dart';
import 'package:moodtracker/utilities/topAppBar.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getTopAppBar("Journal"),
      body: Text("Journal"),
    );
  }
}
