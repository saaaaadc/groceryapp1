import 'dart:html';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp1/details.dart';
import 'package:groceryapp1/order.dart';
import 'package:groceryapp1/profile.dart';
import 'package:groceryapp1/scafffold_modify.dart';
import 'package:groceryapp1/wallet.dart';

class home extends StatefulWidget {
   home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

bool icecream = false,pizza = false, burger = false, salad = false;

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hello User',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)
        ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: Icon(Icons.shopping_cart,color: Colors.white,),
                )
              ],
            ),
        SizedBox(height: 20,),
        Text('Delicious Food',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
        ),
        Text('Discover and Get Great Food',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(right: 20),
                child:showItem()),
            SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: Navigator.push(context, MaterialPageRoute(builder: (context) => Details(detail: detail, image: image, name: name, price: price),)),
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
                              Image(image: AssetImage('images/pngtree-ice-cream-dessert-realistic-white-background-transparent-png-image_9047252.png'),height: 150,width: 150,fit: BoxFit.cover ),
                              Text("Ice Cream",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                              SizedBox(height: 5,),
                              Text("Fresh and Healthy"),
                              SizedBox(height: 5,),
                              Text("\$25",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(image: AssetImage('images/pngtree-ice-cream-dessert-realistic-white-background-transparent-png-image_9047252.png'),height: 150,width: 150,fit: BoxFit.cover ),
                            Text("Ice Cream",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                            SizedBox(height: 5,),
                            Text("Fresh and Healthy"),
                            SizedBox(height: 5,),
                            Text("\$25",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black))

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage("images/Burger-43.png"),height: 120,width: 120,fit: BoxFit.cover,),
                      SizedBox(height: 20,),

                      Column(
                        children: [

                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("Royal Cheese Burger")),
                          SizedBox(height: 5,),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("Barbeque Burger")),
                          SizedBox(height: 5,),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("\$28",style: TextStyle(fontWeight: FontWeight.bold),)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage("images/Burger-43.png"),height: 120,width: 120,fit: BoxFit.cover,),
                      SizedBox(height: 20,),

                      Column(
                        children: [

                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("Royal Cheese Burger")),
                          SizedBox(height: 5,),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("Barbeque Burger")),
                          SizedBox(height: 5,),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("\$28",style: TextStyle(fontWeight: FontWeight.bold),)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage("images/Burger-43.png"),height: 120,width: 120,fit: BoxFit.cover,),
                      SizedBox(height: 20,),

                      Column(
                        children: [

                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("Royal Cheese Burger")),
                          SizedBox(height: 5,),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("Barbeque Burger")),
                          SizedBox(height: 5,),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("\$28",style: TextStyle(fontWeight: FontWeight.bold),)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),



          ],
        ),
      ),


    );
  }
  Widget showItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            icecream=true;
            pizza=false;
            salad=false;
            burger=false;
            setState(() {
            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream?Colors.black:Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8),
              child: Image(image: AssetImage('images/pngtree-ice-cream-dessert-realistic-white-background-transparent-png-image_9047252.png'),height: 50,width: 50,fit: BoxFit.fill ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            icecream=false;
            pizza=true;
            salad=false;
            burger=false;
            setState(() {
            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza?Colors.black:Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8),
              child: Image(image: AssetImage('images/png-transparent-pizza-margherita-sushi-pizza-pizza-delivery-pizza-thumbnail.png'),height: 50,width: 50,fit: BoxFit.fill),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            icecream=false;
            pizza=false;
            salad=true;
            burger=false;
            setState(() {
            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad?Colors.black:Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8),
              child: Image(image: AssetImage('images/salad.jpg'),height: 50,width: 50,fit: BoxFit.fill),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            icecream=false;
            pizza=false;
            salad=false;
            burger=true;
            setState(() {
            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger?Colors.black:Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8),
              child: Image(image: AssetImage('images/Burger-43.png'),height: 50,width: 50,fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    );
  }
}
