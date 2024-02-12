import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.lightBlue.shade200,
    secondary: Colors.deepPurple,
    tertiary: Colors.lightBlue.shade200,
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 30)),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade200,
    primary: Colors.black,
    secondary: Colors.green,
    tertiary: Colors.orange,
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  navigationBarTheme: NavigationBarThemeData(),
  appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 30)),
);
