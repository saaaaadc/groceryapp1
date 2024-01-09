import 'package:flutter/material.dart';
import 'package:groceryapp1/bottomnavbar.dart';
import 'package:groceryapp1/login_page.dart';
import 'package:groceryapp1/on_board_screen.dart';
class WelcomeScreen extends StatefulWidget {


  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child:OnBoardScreen(),
                ),
                Text("Ready to order from your nearest shop?"),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Already a Customer ?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Center(
                  child: MaterialButton(
                      color: Colors.deepOrangeAccent,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => bottomnavbar(),));
                      },
                      child: Text("Next")),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}