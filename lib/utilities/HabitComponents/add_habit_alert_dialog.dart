import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/model/mood_tracker_db.dart';

class AddHabitAlertDialog extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final VoidCallback cancel;
  final Function(dynamic, String) onSave;

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
  int selectedType = 0;
  bool checkValue = true;
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 220,
        padding: const EdgeInsets.only(top: 5.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
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
          CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => _showDialog(
                    CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      itemExtent: 32.0,
                      scrollController: FixedExtentScrollController(
                        initialItem: selectedType,
                      ),
                      onSelectedItemChanged: (int selectedItem) {
                        setState(() {
                          selectedType = selectedItem;
                        });
                      },
                      children:
                          List<Widget>.generate(habitTypes.length, (int index) {
                        return Center(child: Text(habitTypes[index]));
                      }),
                    ),
                  ),
              child: Text(
                habitTypes[selectedType],
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: () =>
                  widget.onSave(checkValue, habitTypes[selectedType]),
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

  List<String> habitTypes = [
    ('No Type'),
    ('Exercise'),
    ('Mental Health'),
    ('Diet'),
    ('Social'),
    ('Finance'),
    ('Mindfullness'),
    ('Self Care'),
    ('Learning'),
  ];

  isSelected() {}
}

enum HabitTypes {
  unspecified,
  exercise,
  mentalHealth,
  diet,
  social,
  finance,
  mindfullness,
  selfCare,
  learning,
}
