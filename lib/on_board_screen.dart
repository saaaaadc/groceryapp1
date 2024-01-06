import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});
  static const kPageViewTextStyle = TextStyle(
    fontSize: 20,fontWeight: FontWeight.w700
  );

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

final _controller = PageController(
  initialPage: 0,
);

int _currentPage = 0;

List<Widget> _pages = [
  Column(
    children: [
      Expanded(
        child: Image(image: AssetImage("images/home-page-161.png")),
      ),
      Text(
        "Order Online from your Favourite Store",style: OnBoardScreen.kPageViewTextStyle,

      )
        ,

    ],
  ),
  Column(
    children: [
      Expanded(
        child: Image(
            image:
            AssetImage("images/202.9-location-service-icon-iconbunny.jpg")),
      ),
      Text(
        "Set your delivery location",
        style: OnBoardScreen.kPageViewTextStyle,
        textAlign: TextAlign.center,
      )
    ],
  ),
];

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
              ;
            },
          ),
        ),
        SizedBox(height: 20),
        DotsIndicator(
          dotsCount: _pages.length,
          position: _currentPage,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              activeColor: Colors.green[600]),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
