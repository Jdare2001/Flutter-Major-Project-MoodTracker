import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.lightBlue.shade200,
    secondary: const Color.fromRGBO(103, 58, 183, 1),
    tertiary: Colors.lightBlue.shade200,
    onSurface: Colors.black,
    onSurfaceVariant: Colors.grey,
  ),
  fontFamily: 'Nunito',
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w600)),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black12,
    primary: Colors.black,
    secondary: Colors.green,
    tertiary: Colors.orange,
    onSurface: Colors.white,
    onSurfaceVariant: Colors.grey,
  ),
  fontFamily: 'Nunito',
  navigationBarTheme:
      NavigationBarThemeData(backgroundColor: Colors.grey.shade200),
  appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w600)),
);
