import 'dart:js';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp1/refaction.dart';
import 'package:groceryapp1/signup.dart';
import 'package:groceryapp1/welcome_screen.dart';
class againpass extends StatelessWidget {
  TextEditingController emailidd = TextEditingController();

  againpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Reset Password")),
        backgroundColor: Colors.green.shade900,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              insert(store: emailidd, clue: 'email',),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    resetttpassword(context);
                  },
                  child: Text('OK'))
            ],
          ),
        ),
      ),
    );
  }

  Future resetttpassword(BuildContext context) async {
    final email = emailidd.text;
    if (email.contains('@')) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Color.fromARGB(255, 6, 157, 21),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text('Reset Email has been sent to $email')));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ));
      } on FirebaseAuthException catch (f) {
        print(f);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromARGB(255, 6, 157, 21),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text('Enter correct Email')));
    }
  }
}
