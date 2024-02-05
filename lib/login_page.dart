import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp1/bottomnavbar.dart';

import 'package:groceryapp1/homepage.dart';
import 'package:groceryapp1/refaction.dart';
import 'package:groceryapp1/resetpassword.dart';
import 'package:groceryapp1/signup.dart';

TextEditingController newemail = TextEditingController();
TextEditingController newpassword = TextEditingController();
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 150,right: 60,left: 60),
            child: Text("Welcome Back",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.green[900]),),
          ),
          SizedBox(height: 7.5,),
          Text("Login to your Account",style: TextStyle(fontSize:20,fontWeight: FontWeight.w300,color: Colors.grey)),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: insert(store: newemail,clue: 'Email',logo: Icon(Icons.mail_outline_rounded),fillColor: Colors.green[100],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: insert(store: newpassword,clue: 'Password',logo: Icon(Icons.lock_outline_rounded),suffixIcon: Icon(Icons.visibility_outlined),fillColor: Colors.green[100]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => againpass(),));
              }, child:Text("Forgot Password?"))
            ],
          ),
          SizedBox(height: 30,),
          Container(
            height: 50,
            width: 340,
            decoration:BoxDecoration(
              color: Colors.green[900],
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: MaterialButton(
              onPressed: (){
                signInUser(context);
              },
              child: Center(child: Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
            ),

          ),
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",style: TextStyle(fontSize: 20,color: Colors.grey),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
              }, child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green[900]),))
            ],
          )
        ],
      ),
    );
  }
}

Future<void> signInUser(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: newemail.text.trim(), password: newpassword.text.trim());
    print('ok');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => bottomnavbar(),
        ));
  } on FirebaseAuthException catch (e) {
    final errorMessage = 'Email and password do not match';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green[900],
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text('Email and password do not match')));
  }
}

