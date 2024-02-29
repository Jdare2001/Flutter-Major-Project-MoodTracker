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
              Checkbox(value: value, onChanged: onChanged),
            ],
          ),
          Text(
            'Type of Habit',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              ToggleButtons(
                isSelected: isSelected(),
                children: habitTypes,
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: widget.onSave,
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

  List<Widget> habitTypes = [
    Text('Exercise'),
    Text('Mental health'),
    Text('Diet'),
    Text('Social'),
    Text('Finance'),
    Text('Mindfullness'),
    Text('Self Care'),
    Text('Learning'),
  ];
  isSelected() {}
}
