import 'package:flutter/material.dart';

import 'package:moodtracker/utilities/top_app_bar.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: getTopAppBar("Journal", context),
      body: const Column(
        children: [
          SizedBox(height: 5),
          Text(
            "Last 7 days at a glance",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Divider(),
        ],
      ),
    );
  }
}
