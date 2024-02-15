import 'package:flutter/material.dart';

class editHabitAlertDialog extends StatelessWidget {
  final String title;
  final String hint;
  final VoidCallback cancel;
  const editHabitAlertDialog({
    super.key,
    required this.title,
    required this.hint,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: hint),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child:
                  const Text("Delete", style: TextStyle(color: Colors.white)),
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
    ;
  }
}
