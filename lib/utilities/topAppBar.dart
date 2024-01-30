import 'package:flutter/material.dart';

getTopAppBar(String title) {
  return AppBar(
    title: Text(title),
    actions: const [
      IconButton(onPressed: settingsOnPressed, icon: Icon(Icons.settings))
    ],
    backgroundColor: Colors.lightBlue.shade200,
    centerTitle: false,
  );
}

void settingsOnPressed() {}
