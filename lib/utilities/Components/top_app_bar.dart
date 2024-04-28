import 'package:flutter/material.dart';
//code for top app bar

getTopAppBar(String title, context) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
          onPressed: () => settingsOnPressed(context),
          icon: const Icon(Icons.settings))
    ],
    backgroundColor: Theme.of(context).colorScheme.primary,
    centerTitle: false,
  );
}

settingsOnPressed(context) {
  Navigator.pushNamed(context, '/Settings');
}
