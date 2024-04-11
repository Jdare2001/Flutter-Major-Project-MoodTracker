import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const LoginTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        style: const TextStyle(color: Colors.black),
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
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
