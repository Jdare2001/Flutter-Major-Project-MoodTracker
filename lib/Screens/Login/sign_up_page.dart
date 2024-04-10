import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodtracker/utilities/Auth/login_textfield.dart';
import 'package:moodtracker/utilities/Auth/sign_in_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfController = TextEditingController();
  Future<void> signUpUser() async {
    if (passwordController.text == passwordConfController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } on FirebaseAuthException catch (e) {
        print(e.code);
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
                  //Welcome text
                  const Text(
                    "Sign Up!",
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
