import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/Auth/login_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  Future<void> sendEmailReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'missing-email') {
        emailNotValidDialog();
      } else if (e.code == 'invalid-email') {
        emailNotValidDialog();
      }
    }
  }

  void emailNotValidDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text(
                "Invalid Email - There may be no account under this email"),
          );
        });
  }

  Widget emailResetButton({
    required String buttonName,
    required Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          buttonName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          softWrap: false,
        ),
      ),
    );
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
                  //Welcome text
                  const Text(
                    "Send Reset Email",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50),
                  //User field
                  LoginTextField(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  emailResetButton(
                    buttonName: 'Send Reset Email',
                    onTap: sendEmailReset,
                  ),
                  //sign up
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/LoginScreen'),
                        child: const Text(
                          "Go Back",
                          style: TextStyle(
                            fontSize: 25,
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
