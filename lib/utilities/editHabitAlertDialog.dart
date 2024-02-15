import 'package:flutter/material.dart';

class editHabitAlertDialog extends StatelessWidget {
  final String title;
  final String hint;
  final VoidCallback cancel;
  final VoidCallback onDelete;
  final VoidCallback onSave;
  final TextEditingController controller;
  const editHabitAlertDialog({
    super.key,
    required this.title,
    required this.hint,
    required this.cancel,
    required this.controller,
    required this.onDelete,
    required this.onSave,
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: onSave,
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: onDelete,
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
