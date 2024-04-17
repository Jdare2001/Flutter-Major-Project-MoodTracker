// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/Auth/login_textfield.dart';
import 'package:moodtracker/utilities/Auth/sign_in_button.dart';
import 'package:moodtracker/utilities/date_time_converter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final passwordConfController = TextEditingController();
  Future<void> signUpUser() async {
    if (passwordController.text == passwordConfController.text) {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        createUserCollections(userCredential);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          emailNotValidDialog();
        } else if (e.code == 'invalid-credential') {
          emailNotValidDialog();
        }
      }
    } else {
      passwordsDontMatch();
    }
  }

  //create user collection
  Future<void> createUserCollections(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernameController.text,
      });
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .collection('Habits')
          .doc('Walk 10,000 steps')
          .set({
        'name': 'Walk 10,000 steps',
        'isChecked': false,
        'dateChecked': todaysDateFormatedString(),
        'positiveOrNeg': true,
        'habitType': 'No Type'
      });
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .collection('DailyCheckIn')
          .doc('Testday')
          .set({'Name': ''});
    }
  }

  void emailNotValidDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Invalid Email"),
          );
        });
  }

  void passwordsDontMatch() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Passwords Don't Match"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/Assets/LogonoBG.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Welcome text
                  const Text(
                    "Sign Up!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 25),
                  //username feild
                  LoginTextField(
                    controller: usernameController,
                    hintText: "Username",
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),
                  //email field
                  LoginTextField(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),
                  //password feild
                  LoginTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  LoginTextField(
                    controller: passwordConfController,
                    hintText: "Confirm Password",
                    obscureText: true,
                  ),
                  //sign in
                  const SizedBox(
                    height: 10,
                  ),
                  LoginButton(
                    onTap: signUpUser,
                    buttonName: 'Sign Up',
                  ),
                  //sign up
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "A Member?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/LoginScreen'),
                        child: const Text(
                          "Sign In Now!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ));
  }
}
