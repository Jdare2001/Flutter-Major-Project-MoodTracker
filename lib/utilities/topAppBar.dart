import 'package:flutter/material.dart';

getTopAppBar(String title, context) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
          onPressed: () => settingsOnPressed(context),
          icon: Icon(Icons.settings))
    ],
    backgroundColor: Colors.lightBlue.shade200,
    centerTitle: false,
  );
}

settingsOnPressed(context) {
  Navigator.pushNamed(context, '/Settings');
}
