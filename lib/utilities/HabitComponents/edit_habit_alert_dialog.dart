import 'package:flutter/material.dart';

class EditHabitAlertDialog extends StatefulWidget {
  final String title;
  final String hint;
  final VoidCallback cancel;
  final VoidCallback onDelete;
  final VoidCallback onSave;
  final TextEditingController controller;
  const EditHabitAlertDialog({
    super.key,
    required this.title,
    required this.hint,
    required this.cancel,
    required this.controller,
    required this.onDelete,
    required this.onSave,
  });
  @override
  State<EditHabitAlertDialog> createState() => _EditHabitAlertDialogState();
}

class _EditHabitAlertDialogState extends State<EditHabitAlertDialog> {
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
              onPressed: widget.onDelete,
              child: Text("Delete",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface)),
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
