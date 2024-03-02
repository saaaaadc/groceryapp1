import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodorderingapp/admi/admin_homepage.dart';
import 'package:foodorderingapp/admi/admin_login.dart';
import 'package:foodorderingapp/bottomnavbar.dart';
import 'package:foodorderingapp/login_page.dart';
import 'package:foodorderingapp/wallet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyDpj2mj-gJmVJv2785chdyBfI6lZ8z9M6Q",
    appId: "1:722592910536:android:2e748b58da5faa69bb69f",
    messagingSenderId: "722592910536",
    projectId: "groceryapp-1-5b7ee",
    storageBucket: "gs://groceryapp-1-5b7ee.appspot.com",
  ));
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your app logo or illustration here
            Image.asset(
              'images/latest.png', // Replace with your image asset path
              height: 330,
              width: 330,
            ),
            Center(
              child: Text(
                "Where Flavor Meets Choice",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => login(),
                    ));
              },
              child: Text('Get Started'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
