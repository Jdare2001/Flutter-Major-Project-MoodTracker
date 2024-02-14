import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({super.key});

  @override
  Widget build(BuildContext context) {
    bool? value = false;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
                value: value,
                onChanged: (theValue) {
                  value = theValue;
                }),
            Text(
              "Go For a walk",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void _onClick() {}
}
