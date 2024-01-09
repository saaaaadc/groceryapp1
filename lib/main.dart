import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:groceryapp1/on_board_screen.dart';
import 'package:groceryapp1/welcome_screen.dart';
import 'package:groceryapp1/widgets/app_constants.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey:"AIzaSyDpj2mj-gJmVJv2785chdyBfI6lZ8z9M6Q", appId: "1:722592910536:android:2e748b58da5faa69bb69f",
        messagingSenderId: "722592910536",
        projectId:"groceryapp-1-5b7ee")
  );
  runApp( MyApp(),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan),
      debugShowCheckedModeBanner: false,
      home:WelcomeScreen(),
    );
  }
}

