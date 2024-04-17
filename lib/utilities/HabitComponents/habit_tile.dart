import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTileWidget extends StatelessWidget {
  final String habitName;
  final bool completed;
  final Function(bool?)? onChecked;
  final Function(BuildContext)? editHabit;
  final String positive;
  final String habitType;

  const HabitTileWidget({
    super.key,
    required this.habitName,
    required this.completed,
    required this.onChecked,
    required this.editHabit,
    required this.positive,
    required this.habitType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              //edit habit button
              SlidableAction(
                onPressed: editHabit,
                icon: Icons.more_horiz,
                borderRadius: BorderRadius.circular(8),
                backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
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
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  shape: const CircleBorder(),
                  value: completed,
                  onChanged: onChecked,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        habitName,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "$positive $habitType Habit",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
