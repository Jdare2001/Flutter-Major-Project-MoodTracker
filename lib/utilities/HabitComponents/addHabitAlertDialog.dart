import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/HabitComponents/goodOrBadHabitCheckBox.dart';

class AddHabitAlertDialog extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final VoidCallback cancel;
  final VoidCallback onSave;

  const AddHabitAlertDialog({
    super.key,
    required this.title,
    required this.hint,
    required this.cancel,
    required this.controller,
    required this.onSave,
  });
  @override
  State<AddHabitAlertDialog> createState() => _AddHabitAlertDialogScreenState();
}

class _AddHabitAlertDialogScreenState extends State<AddHabitAlertDialog> {
  bool value = true;
  onChanged(newValue) {
    setState(() {
      value = newValue;
    });
  }

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
          const Padding(
            padding: EdgeInsets.all(8),
          ),
          const Text("Good Habit?"),
          Switch(value: value, onChanged: onChanged),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: widget.onSave,
              child: Text(
                "Save",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            ElevatedButton(
              onPressed: widget.cancel,
              child: Text("Cancel",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
            ),
          ])
        ],
      ),
    );
  }
}
