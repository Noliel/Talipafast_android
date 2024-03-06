import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talipafast/components/button.dart';
import 'package:talipafast/components/login_textfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // CALLER
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // LOGGER
  void signUserIn() async {
    // LOADING SRC
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Email'),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Password'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 25),
              const Text(
                'Welcome to Talipafast',
                style: TextStyle(
                  color: Color.fromARGB(255, 212, 143, 53),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),

              // Email Textfield
              LoginTextfield(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              // Passowrd Textfield
              LoginTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              ButtonSignin(
                onTap: signUserIn,
              ),

              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Need to register?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Register now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
