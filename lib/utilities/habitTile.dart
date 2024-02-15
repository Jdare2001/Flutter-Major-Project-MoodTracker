import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTileWidget extends StatelessWidget {
  final habitName;
  final bool completed;
  final Function(bool?)? onChecked;
  final Function(BuildContext)? editHabit;
  const HabitTileWidget({
    super.key,
    required this.habitName,
    required this.completed,
    required this.onChecked,
    required this.editHabit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              //edit habit button
              SlidableAction(
                onPressed: editHabit,
                icon: Icons.more_horiz,
                borderRadius: BorderRadius.circular(8),
                backgroundColor: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
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
              ],
            ),
          ),
        ));
  }
}
