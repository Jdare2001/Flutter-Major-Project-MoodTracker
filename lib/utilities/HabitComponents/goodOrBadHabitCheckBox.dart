import 'package:flutter/material.dart';

getHabitGoodBadCheckbox(
  bool value,
) {
  onChanged(newValue) {
    value = newValue;
  }

  return Switch(value: value, onChanged: (newValue) => onChanged(newValue));
}
