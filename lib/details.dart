import 'package:flutter/material.dart';
import 'package:groceryapp1/service/database.dart';
import 'package:groceryapp1/service/sharedpreferences.dart';
import 'package:groceryapp1/wallet.dart';
import 'package:groceryapp1/widgets/wishlist.dart';
class Details extends StatefulWidget {
  String image, name, detail, price;
Details({required this.image,required this.name,required this.detail,required this.price});

  @override
  State<Details> createState() => _DetailsState();
}
class _DetailsState extends State<Details> {
  int a = 1, total = 0;
  String? id;

  getthesharedpref()async{
    id = await SharedPreferenceHelper().getUserId();
    setState(() {

    });

  }
  ontheload()async{
    await getthesharedpref();
    setState(() {

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ontheload();
    total = int.parse(widget.price);
  }
  bool isFavourite= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    )),
                GestureDetector(
                  onTap: ()async{
                    Map<String, dynamic> addFoodtoWishlist={
                      "Name":widget.name,
                      "Quantity":a.toString(),
                      "Total":total.toString(),
                      "Image":widget.image,
                    };
                    await DatabaseMethods().addFoodtoCart(addFoodtoWishlist, id);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.orangeAccent,
                        content: Text(
                          "Food Added to Wishlist",
                          style: TextStyle(fontSize: 18.0),
                        )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.favorite_border_outlined)                  ),
                ),
              ],
            ),
            Image.network(
              widget.image,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name
                    ),
                    Text(
                        "Chickpea Salad",style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;
                      total = total-int.parse(widget.price);
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  a.toString()

                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    ++a;
                    total = total+int.parse(widget.price);
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.detail

            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Text(
                  "Delivery Time",

                ),
                SizedBox(
                  width: 25.0,
                ),
                Icon(
                  Icons.alarm,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "30 min",

                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                      ),
                      Text(
                        "\$"+total.toString()

                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Wallet()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Buy Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins'),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: ()async{
                          Map<String, dynamic> addFoodtoCart={
                            "Name":widget.name,
                            "Quantity":a.toString(),
                            "Total":total.toString(),
                            "Image":widget.image,
                          };
                          await DatabaseMethods().addFoodtoCart(addFoodtoCart, id);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.orangeAccent,
                              content: Text(
                                "Food Added to Cart",
                                style: TextStyle(fontSize: 18.0),
                              )));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Add to cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins'),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
