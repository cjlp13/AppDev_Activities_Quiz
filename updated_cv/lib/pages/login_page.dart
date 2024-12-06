// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:updated_cv/components/button.dart';
import 'package:updated_cv/components/text_field.dart';
import 'package:updated_cv/pages/cv_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String signInLog = 'Welcome! Please Sign In to continue.';
  Color logColor = Colors.black;
  double fontSize = 17;

  void signIn(BuildContext context) {
    final usernameInput = usernameController.text;
    final passwordInput = passwordController.text;

    if (usernameInput == 'justine13' && passwordInput == 'justine123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      setState(() {
        signInLog = 'Sign In error: Check your username or password.';
        logColor = Colors.red;
        fontSize = 16;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //Login logo

              const SizedBox(height: 25),

              //Main Login Title
              const Text(
                'CV',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w700
                ),
              ),

              const SizedBox(height: 20),

              Text(
                signInLog,
                style: TextStyle(
                    fontSize: fontSize,
                    color: logColor,
                ),
              ),

              const SizedBox(height: 25),

              //username textfield
              textField(
                hintText: 'Username',
                controller: usernameController,
                obscureText: false,


              ),

              const SizedBox(height: 10,),

              //password textfield
              textField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
              ),

              const SizedBox(height: 25,),

              //sign in button
              Button(
                onTap: () => signIn(context),
              ),

          ],),
        )
      ),
    );
  }
}