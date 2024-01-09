import 'package:flutter/material.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:groceryapp1/login_page.dart';

import 'constants.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {

  int currentIndex = 0;
  late PageController _controller;
  List<UnboardingContent>contents = [
    UnboardingContent(image: 'images/salad.jpg',
        title: 'Select from our menu\n  --- Best Menu',
        description: 'Pick your food from our menu\n More than 35 times'),
    UnboardingContent(image: 'images/Burger-43.png',
        title: 'Easy and Online Payment',
        description: 'You can pay cash on delivery and\n Card payment'),
    UnboardingContent(
        image: 'images/pngtree-ice-cream-dessert-realistic-white-background-transparent-png-image_9047252.png',
        title: 'Quick delivery at your doorstep',
        description: 'Deliver your food at your\n  Doorstep')
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 40.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "images/salad.jpg",
                          height: 450,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          "Select from our menu\n  --- Best Menu",

                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                            "Pick your food from our menu\n More than 35 times"
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                    (index) => buildDot(index, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => login()));
              }
              _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIndex == contents.length - 1 ? "Start" : "Next",
                  style: TextStyle(color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black38),
    );
  }
}

class UnboardingContent {
  late String image;
  late String title;
  late String description;

  UnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}