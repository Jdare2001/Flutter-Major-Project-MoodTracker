import 'package:flutter/material.dart';

getTopAppBar(String title) {
  return AppBar(
    title: Text(title),
    actions: const [
      IconButton(onPressed: settingsOnPressed, icon: Icon(Icons.settings))
    ],
    centerTitle: false,
  );
}

void settingsOnPressed() {}
