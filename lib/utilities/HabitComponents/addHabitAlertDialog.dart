import 'package:flutter/material.dart';

class AddHabitAlertDialog extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final VoidCallback cancel;
  final VoidCallback onSave;
  final Widget getGoodorBad;

  const AddHabitAlertDialog({
    super.key,
    required this.title,
    required this.hint,
    required this.cancel,
    required this.controller,
    required this.onSave,
    required this.getGoodorBad,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(labelText: hint),
          ),
          const Text("Good Habit?"),
          getGoodorBad,
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: onSave,
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: cancel,
              child:
                  const Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
          ])
        ],
      ),
    );
  }
}
