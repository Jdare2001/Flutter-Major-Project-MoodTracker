import 'package:flutter/material.dart';

class HabitTileWidget extends StatelessWidget {
  final habitName;
  final bool completed;
  final Function(bool?)? onChecked;
  const HabitTileWidget(
      {super.key,
      required this.habitName,
      required this.completed,
      required this.onChecked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              value: completed,
              onChanged: onChecked,
            ),
            Expanded(
              child: Text(
                habitName,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
