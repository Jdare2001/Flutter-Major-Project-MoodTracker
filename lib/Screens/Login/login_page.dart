import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/Auth/login_textfield.dart';
import 'package:moodtracker/utilities/Auth/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  Future<void> signInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        userNotFoundDialog();
      } else if (e.code == 'wrong-password') {
        wrongPasswordDialog();
      } else if (e.code == 'invalid-credential') {
        userNotFoundDialog();
      }
    }
  }

  void userNotFoundDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Incorrect Login Details"),
          );
        });
  }

  void wrongPasswordDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Incorrect Password"),
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
                  //Welcome text
                  const Text(
                    "Welcome Back!",
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

                  const SizedBox(height: 10),
                  //password feild
                  LoginTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  //sign in
                  LoginButton(
                    onTap: signInUser,
                    buttonName: 'Sign In',
                  ),
                  //sign up
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not A Member?",
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
                            Navigator.pushNamed(context, '/SignUpScreen'),
                        child: const Text(
                          "Sign up Now!",
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
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/ForgotPasswordScreen'),
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
