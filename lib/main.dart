import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:groceryapp1/on_board_screen.dart';
import 'package:groceryapp1/register_screen.dart';
import 'package:groceryapp1/scafffold_modify.dart';
import 'package:groceryapp1/welcome_screen.dart';
import 'package:groceryapp1/widgets/app_constants.dart';
void main() async{
  Stripe.publishableKey=publishableKey;
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
      home: OnBoardScreen(),
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
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(image: AssetImage("images/download.jpg"),
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover
          ,)
      ],
    );
  }
}
