import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
