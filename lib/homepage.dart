import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodorderingapp/details.dart';
import 'package:foodorderingapp/service/database.dart';
import 'package:foodorderingapp/service/sharedpreferences.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int currentSlide = 0;
  String? name;

  bool icecream = false, pizza = false, burger = false, salad = false;

  Stream? foodItemStream;

  getthesharedpref() async {
    name = await SharedPreferenceHelper().getUserName();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    foodItemStream = await DatabaseMethods().getFoodItem("Salad");
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItemsvertically() {
    return StreamBuilder(
        stream: foodItemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    image: ds["Image"],
                                    name: ds["Name"],
                                    detail: ds["Detail"],
                                    price: ds["Price"])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20, bottom: 20),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Center(
                                            child: Text(ds["Name"],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)))),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Center(
                                            child: Text("\$" + ds["Price"],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  Widget allItems() {
    return StreamBuilder(
        stream: foodItemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    image: ds["Image"],
                                    name: ds["Name"],
                                    detail: ds["Detail"],
                                    price: ds["Price"])));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(ds["Image"],
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover),
                                ),
                                Text(ds["Name"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("\$" + ds["Price"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(top: 20, left: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentSlide = value;
                        });
                      },
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image:
                                        AssetImage("images/Banner_5_jpg.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned.fill(
                      bottom: 10,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              4,
                              (index) => AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: currentSlide == index ? 15 : 8,
                                    height: 8,
                                    margin: EdgeInsets.only(right: 3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: currentSlide == index
                                            ? Colors.black
                                            : Colors.transparent,
                                        border:
                                            Border.all(color: Colors.black)),
                                  )),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              showItem(),
              SizedBox(
                height: 20,
              ),
              Container(height: 270, child: allItems()),
              SizedBox(
                height: 20,
              ),
              allItemsvertically()
            ],
          ),
        ),
      )),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            foodItemStream = await DatabaseMethods().getFoodItem("Ice-cream");
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image(
                  image: AssetImage(
                      'images/pngtree-ice-cream-dessert-realistic-white-background-transparent-png-image_9047252.png'),
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            foodItemStream = await DatabaseMethods().getFoodItem("Pizza");
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image(
                  image: AssetImage(
                      'images/png-transparent-pizza-margherita-sushi-pizza-pizza-delivery-pizza-thumbnail.png'),
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
            foodItemStream = await DatabaseMethods().getFoodItem("Salad");
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image(
                  image: AssetImage('images/salad.jpg'),
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
            foodItemStream = await DatabaseMethods().getFoodItem("Burger");
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image(
                  image: AssetImage('images/Burger-43.png'),
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    );
  }
}
