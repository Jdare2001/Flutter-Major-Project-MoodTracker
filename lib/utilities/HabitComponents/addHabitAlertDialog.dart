import 'package:flutter/material.dart';
import 'package:moodtracker/model/MoodTrackerDb.dart';

class AddHabitAlertDialog extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final VoidCallback cancel;
  final Function(dynamic) onSave;

  const AddHabitAlertDialog({
    super.key,
    required this.title,
    required this.hint,
    required this.cancel,
    required this.controller,
    required this.onSave,
  });

  @override
  State<AddHabitAlertDialog> createState() => _AddHabitAlertDialogState();
}

class _AddHabitAlertDialogState extends State<AddHabitAlertDialog> {
  MoodtrackerDb db = MoodtrackerDb();

  bool checkValue = true;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600),
      ),
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
          Row(
            children: [
              Text(
                "Good Habit?",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w600),
              ),
              Checkbox(
                  value: checkValue,
                  onChanged: (newValue) => onChanged(newValue)),
            ],
          ),
          Text(
            'Type of Habit',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600),
          ),
          Row(
            children: [],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: () => widget.onSave(checkValue),
              child: Text(
                "Save",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: widget.cancel,
              child: Text("Cancel",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600)),
            ),
          ])
        ],
      ),
    );
  }

  onChanged(newValue) {
    setState(() {
      checkValue = newValue;
    });
  }

  List<Widget> habitTypes = [
    const Text('Exercise'),
    const Text('Mental health'),
    const Text('Diet'),
    const Text('Social'),
    const Text('Finance'),
    const Text('Mindfullness'),
    const Text('Self Care'),
    const Text('Learning'),
  ];
  isSelected() {}
}
