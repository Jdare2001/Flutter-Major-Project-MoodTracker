import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final controller;
  final bool obscureText;

  const LoginTextField(
      {super.key,
      required this.hintText,
      this.controller,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onSurface),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
            ),
            hintText: hintText),
      ),
    );
  }
}
