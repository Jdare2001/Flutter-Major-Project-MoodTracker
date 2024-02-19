import 'package:flutter/material.dart';

class AddHabitAlertDialog extends StatefulWidget {
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
  State<AddHabitAlertDialog> createState() => _AddHabitAlertDialogScreenState();
}

class _AddHabitAlertDialogScreenState extends State<AddHabitAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(labelText: widget.hint),
          ),
          const Text("Good Habit?"),
          widget.getGoodorBad,
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: widget.onSave,
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: widget.cancel,
              child:
                  const Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
          ])
        ],
      ),
    );
  }
}
