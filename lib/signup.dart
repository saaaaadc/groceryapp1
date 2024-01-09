import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:groceryapp1/refaction.dart';
import 'package:groceryapp1/service/database.dart';
import 'package:groceryapp1/service/sharedpreferences.dart';
import 'package:groceryapp1/welcome_screen.dart';
import 'package:random_string/random_string.dart';

TextEditingController signname = TextEditingController();
TextEditingController signemail = TextEditingController();
TextEditingController signpassword = TextEditingController();
TextEditingController signconpassword = TextEditingController();


class signup extends StatelessWidget {

  signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage(
                    "images/279747-grocery-store-grocery-vegetable-and-carrot-hd.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please sign up to continue",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900])),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: insert(
                      store: signname,
                        logo: Icon(Icons.perm_contact_cal_sharp),
                        clue: 'First Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: insert(
                        store: signemail,
                        logo: Icon(Icons.email_outlined),
                        clue: 'Email'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: insert(
                      store: signpassword,
                      logo: Icon(Icons.password_outlined),
                      clue: 'Password',
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: insert(
                      store: signconpassword,
                      logo: Icon(Icons.password_outlined),
                      clue: ' Re enter Password',
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 310,
                    child: MaterialButton(
                      color: Colors.green[900],
                      onPressed: () {signInUser(context);},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future signInUser(BuildContext context) async {
  final pass = signpassword.text;
  final con = signconpassword.text;
  if (pass == con) {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signemail.text.trim(),
          password: signpassword.text.trim());
      print('ok');
      Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.brown[900],
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text('Account Created Successfully')));
      String Id= randomAlphaNumeric(20);
      Map<String, dynamic> addUserInfo={
        "Name":signname.text,
        "Email":signemail.text,
        "Wallet":"0",
        "Id":Id,
      };
      await DatabaseMethods().addUserDetail(addUserInfo, Id);
      await SharedPreferenceHelper().saveUserName(signname.text);
      await SharedPreferenceHelper().saveUserEmail(signemail.text);
      await SharedPreferenceHelper().saveUserWallet('0');
      await SharedPreferenceHelper().saveUserId(Id);




    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.blue[900],
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text('Try Again $e')));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red[900],
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text('Password does not match')));
  }
}


